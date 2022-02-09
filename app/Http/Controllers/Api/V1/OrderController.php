<?php

namespace App\Http\Controllers\Api\V1;

use App\CentralLogics\Helpers;
use App\CentralLogics\OrderLogic;
use App\CentralLogics\CouponLogic;
use App\Http\Controllers\Controller;
use App\Models\BusinessSetting;
use App\Models\Order;
use App\Models\Coupon;
use App\Models\OrderDetail;
use App\Models\Food;
use App\Models\Restaurant;
use App\Models\ItemCampaign;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Zone;
use App\Models\User;
use Grimzy\LaravelMysqlSpatial\Types\Point;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{
    public function track_order(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }
        $order = Order::with(['restaurant', 'delivery_man.rating'])->withCount('details')->where(['id' => $request['order_id'], 'user_id' => $request->user()->id])->Notpos()->first();
        if ($order) {
            $restaurant = $order['restaurant'] ? Helpers::restaurant_data_formatting($order['restaurant']) : $order['restaurant'];
            $restaurant->avg_rating = number_format((float)$restaurant->avg_rating, 2, '.', '');

            $order['restaurant'] = $restaurant;

            $order['delivery_address'] = $order['delivery_address'] ? json_decode($order['delivery_address']) : $order['delivery_address'];


            $delivery_man = ($order['delivery_man'] != '') ? Helpers::deliverymen_data_formatting([$order['delivery_man']]) : "";
            unset($order['delivery_man']);
            $order['delivery_man'] = $delivery_man;
            $order_amount2 = number_format((float)$order['order_amount'], 2, '.', '');
            unset($order['order_amount']);
            $order['order_amount_round'] = $order_amount2;
            $order['transaction_reference'] = ($order['transaction_reference'] != '') ? $order['transaction_reference'] : '';
            $order['delivery_address_id'] = ($order['delivery_address_id'] != '') ? $order['delivery_address_id'] : '';
            $order['delivery_man_id'] = ($order['delivery_man_id'] != '') ? $order['delivery_man_id'] : '';
            $order['coupon_code'] = ($order['coupon_code'] != '') ? $order['coupon_code'] : '';
            $order['order_note'] = ($order['order_note'] != '') ? $order['order_note'] : '';
            $order['callback'] = ($order['callback'] != '') ? $order['callback'] : '';
            $order['accepted'] = ($order['accepted'] != '') ? $order['accepted'] : '';
            $order['confirmed'] = ($order['confirmed'] != '') ? $order['confirmed'] : '';
            $order['processing'] = ($order['processing'] != '') ? $order['processing'] : '';
            $order['handover'] = ($order['handover'] != '') ? $order['handover'] : '';
            $order['picked_up'] = ($order['picked_up'] != '') ? $order['picked_up'] : '';
            $order['delivered'] = ($order['delivered'] != '') ? $order['delivered'] : '';
            $order['refund_requested'] = ($order['refund_requested'] != '') ? $order['refund_requested'] : '';
            $order['failed'] = ($order['failed'] != '') ? $order['failed'] : '';
            $order['canceled'] = ($order['canceled'] != '') ? $order['canceled'] : '';
            $order['refunded'] = ($order['refunded'] != '') ? $order['refunded'] : '';

            unset($order['details']);

            if ($order['food_id'] > 0) {
                $product = Food::find($order['food_id']);
                if (!empty($product)) {
                    $order['food_name'] = $product->name;
                } else {
                    $order['food_name'] = '';
                }
            } else {
                $order['food_name'] = '';
            }

            $order['state'] = 0;
            return response()->json($order, 200);
        } else {
            return response()->json([
                'state' => 1,
                'errors' => [
                    ['code' => 'schedule_at', 'message' => trans('You have not ordered yet!')]
                ]
            ], 200);
        }
    }

    public function place_order(Request $request)
    {

        // print_r($request);die;

        $validator = Validator::make($request->all(), [
            'order_amount' => 'required',
            'payment_method' => 'required|in:cash_on_delivery,digital_payment',
            'order_type' => 'required|in:take_away,delivery',
            'restaurant_id' => 'required',
            // 'food_id' => 'required',
            // 'quantity' => 'required',
            'user_id' => 'required',
            'transaction_id' => 'required_if:payment_method,digital_payment',
            'distance' => 'required_if:order_type,delivery',
            'address' => 'required_if:order_type,delivery',
            'longitude' => 'required_if:order_type,delivery',
            'latitude' => 'required_if:order_type,delivery',
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $coupon = null;
        $delivery_charge = null;
        $schedule_at = $request->schedule_at ? \Carbon\Carbon::parse($request->schedule_at) : now();
        if ($request->schedule_at && $schedule_at < now()) {
            return response()->json([
                'state' => 1,
                'errors' => [
                    ['code' => 'order_time', 'message' => trans('messages.you_can_not_schedule_a_order_in_past')]
                ]
            ], 200);
        }
        $restaurant = Restaurant::with('discount')->where('id', $request->restaurant_id)->first();


        if (!$restaurant) {
            return response()->json([
                'state' => 1,
                'errors' => [
                    ['code' => 'order_time', 'message' => trans('messages.restaurant_not_found')]
                ]
            ], 200);
        }

        if ($request->schedule_at && !$restaurant->schedule_order) {
            return response()->json([
                'state' => 1,
                'errors' => [
                    ['code' => 'schedule_at', 'message' => trans('messages.schedule_order_not_available')]
                ]
            ], 200);
        }

        if ($restaurant->opening_time > $restaurant->closeing_time) {
            $restaurant->closeing_time->addHours(12);
        }

        if ($restaurant->opening_time->format('H:i') > $schedule_at->format('H:i') && $restaurant->closeing_time->format('H:i') < $schedule_at->format('H:i')) {
            return response()->json([
                'state' => 1,
                'errors' => [
                    ['code' => 'order_time', 'message' => trans('messages.restaurant_is_closed_at_order_time')]
                ]
            ], 200);
        }


        if (str_contains($restaurant->off_day, $schedule_at->dayOfWeek)) {
            return response()->json([
                'state' => 1,
                'errors' => [
                    ['code' => 'order_time', 'message' => trans('messages.scheduled_date_is_restaurant_offday')]
                ]
            ], 200);
        }


        if (!empty($request['coupon_code'])) {
            $coupon = Coupon::active()->where(['code' => $request['coupon_code']])->first();
            if (isset($coupon)) {
                $staus = CouponLogic::is_valide($coupon, $request->user()->id, $request['restaurant_id']);
                if ($staus == 407) {
                    return response()->json([
                        'state' => 1,
                        'errors' => [
                            ['code' => 'coupon', 'message' => trans('messages.coupon_expire')]
                        ]
                    ], 200);
                } else if ($staus == 406) {
                    return response()->json([
                        'state' => 1,
                        'errors' => [
                            ['code' => 'coupon', 'message' => trans('messages.coupon_usage_limit_over')]
                        ]
                    ], 200);
                } else if ($staus == 404) {
                    return response()->json([
                        'state' => 1,
                        'errors' => [
                            ['code' => 'coupon', 'message' => trans('messages.not_found')]
                        ]
                    ], 200);
                }
                if ($coupon->coupon_type == 'free_delivery') {
                    $delivery_charge = 0;
                    $coupon = null;
                }
            } else {
                return response()->json([
                    'state' => 1,
                    'errors' => [
                        ['code' => 'coupon', 'message' => 'not found!']
                    ]
                ], 200);
            }
        }
        $per_km_shipping_charge = (float)BusinessSetting::where(['key' => 'per_km_shipping_charge'])->first()->value;

        $minimum_shipping_charge = (float)BusinessSetting::where(['key' => 'minimum_shipping_charge'])->first()->value;
        $original_delivery_charge = ($request->distance * $per_km_shipping_charge > $minimum_shipping_charge) ? $request->distance * $per_km_shipping_charge : $minimum_shipping_charge;
        if ($request['order_type'] != 'take_away' && !$restaurant->free_delivery && $delivery_charge == null) {
            $delivery_charge = ($request->distance * $per_km_shipping_charge > $minimum_shipping_charge) ? $request->distance * $per_km_shipping_charge : $minimum_shipping_charge;
        }

        if ($request->latitude && $request->longitude) {
            $point = new Point($request->latitude, $request->longitude);
            $zone = Zone::where('id', $restaurant->zone_id)->contains('coordinates', $point)->first();
            if (!$zone) {
                $errors = [];
                array_push($errors, ['code' => 'coordinates', 'message' => trans('messages.out_of_coverage')]);
                return response()->json([
                    'state' => 1,
                    'errors' => $errors
                ], 200);
            }
        }

        $address = [
            'contact_person_name' => $request->contact_person_name ? $request->contact_person_name : $request->user()->f_name . ' ' . $request->user()->f_name,
            'contact_person_number' => $request->contact_person_number ? $request->contact_person_number : $request->user()->phone,
            'address_type' => $request->address_type ? $request->address_type : 'Delivery',
            'address' => $request->address,
            'longitude' => (string)$request->longitude,
            'latitude' => (string)$request->latitude,
        ];



        $total_addon_price = 0;
        $product_price = 0;
        $restaurant_discount_amount = 0;

        $order_details = [];
        $order = new Order();
        $order->id = 100000 + Order::all()->count() + 1;
        $order->user_id = $request['user_id'];
        // $order->user_id = $request->user()->id;

        $user = User::where('id', $order->user_id)->first();
        $order->customer->cm_firebase_token = (!empty($user)) ? $user->cm_firebase_token : '';
        $order->order_amount = number_format((float)$request['order_amount'], 2, '.', '');

        if ($request['payment_method'] == 'digital_payment') {
            if ($request['transaction_id'] != '') {
                $order->payment_status = 'paid';
                $order->order_status = 'pending';
                $order->transaction_id = $request['transaction_id'];
            } else {
                $order->payment_status = 'unpaid';
                $order->order_status = 'failed';
                $order->transaction_id = '';
            }
        } else {
            //cod
            $order->payment_status = 'unpaid';
            $order->order_status = 'pending';
            $order->transaction_id = '';
        }

        $order->food_id = 0;
        $order->quantity = 0;
        // $order->food_id = $request['food_id'];
        // $order->quantity = $request['quantity'];
        $order->coupon_code = $request['coupon_code'];
        $order->payment_method = $request->payment_method;
        $order->transaction_reference = null;
        $order->order_note = $request['order_note'];
        $order->order_type = $request['order_type'];
        $order->restaurant_id = $request['restaurant_id'];
        $order->delivery_charge = $delivery_charge ?? 0;
        $order->original_delivery_charge = $original_delivery_charge;
        $order->delivery_address = json_encode($address);
        $order->schedule_at = $schedule_at;
        $order->scheduled = $request->schedule_at ? 1 : 0;
        $order->otp = rand(1000, 9999);
        $order->pending = now();
        $order->created_at = now();
        $order->updated_at = now();

        // if (!empty($request['cart'])) {
        //     foreach ($request['cart'] as $c) {
        //         if ($c['item_campaign_id'] != null) {
        //             $product = ItemCampaign::find($c['item_campaign_id']);
        //             if ($product) {
        //                 if (count(json_decode($product['variations'], true)) > 0) {
        //                     $price = Helpers::variation_price($product, json_encode($c['variation']));
        //                 } else {
        //                     $price = $product['price'];
        //                 }
        //                 $product->tax = $restaurant->tax;
        //                 $product = Helpers::product_data_formatting($product);
        //                 $addon_data = Helpers::calculate_addon_price(\App\Models\AddOn::whereIn('id', $c['add_on_ids'])->get(), $c['add_on_qtys']);
        //                 $or_d = [
        //                     'food_id' => null,
        //                     'item_campaign_id' => $c['item_campaign_id'],
        //                     'food_details' => json_encode($product),
        //                     'quantity' => $c['quantity'],
        //                     'price' => $price,
        //                     'tax_amount' => Helpers::tax_calculate($product, $price),
        //                     'discount_on_food' => Helpers::product_discount_calculate($product, $price, $restaurant),
        //                     'discount_type' => 'discount_on_product',
        //                     'variant' => json_encode($c['variant']),
        //                     'variation' => json_encode($c['variation']),
        //                     'add_ons' => json_encode($addon_data['addons']),
        //                     'total_add_on_price' => $addon_data['total_add_on_price'],
        //                     'created_at' => now(),
        //                     'updated_at' => now()
        //                 ];
        //                 $order_details[] = $or_d;
        //                 $total_addon_price += $or_d['total_add_on_price'];
        //                 $product_price += $price * $or_d['quantity'];
        //                 $restaurant_discount_amount += $or_d['discount_on_food'] * $or_d['quantity'];
        //             } else {
        //                 return response()->json([
        //                     'state' => 1,
        //                     'errors' => [
        //                         ['code' => 'campaign', 'message' => 'not found!']
        //                     ]
        //                 ], 200);
        //             }
        //         } else {
        //             $product = Food::find($c['food_id']);
        //             if ($product) {
        //                 if (count(json_decode($product['variations'], true)) > 0) {
        //                     $price = Helpers::variation_price($product, json_encode($c['variation']));
        //                 } else {
        //                     $price = $product['price'];
        //                 }
        //                 $product->tax = $restaurant->tax;
        //                 $product = Helpers::product_data_formatting($product);
        //                 $addon_data = Helpers::calculate_addon_price(\App\Models\AddOn::whereIn('id', $c['add_on_ids'])->get(), $c['add_on_qtys']);
        //                 $or_d = [
        //                     'food_id' => $c['food_id'],
        //                     'item_campaign_id' => null,
        //                     'food_details' => json_encode($product),
        //                     'quantity' => $c['quantity'],
        //                     'price' => $price,
        //                     'tax_amount' => Helpers::tax_calculate($product, $price),
        //                     'discount_on_food' => Helpers::product_discount_calculate($product, $price, $restaurant),
        //                     'discount_type' => 'discount_on_product',
        //                     'variant' => json_encode($c['variant']),
        //                     'variation' => json_encode($c['variation']),
        //                     'add_ons' => json_encode($addon_data['addons']),
        //                     'total_add_on_price' => $addon_data['total_add_on_price'],
        //                     'created_at' => now(),
        //                     'updated_at' => now()
        //                 ];
        //                 $total_addon_price += $or_d['total_add_on_price'];
        //                 $product_price += $price * $or_d['quantity'];
        //                 $restaurant_discount_amount += $or_d['discount_on_food'] * $or_d['quantity'];
        //                 $order_details[] = $or_d;
        //             } else {
        //                 return response()->json([
        //                     'state' => 1,
        //                     'errors' => [
        //                         ['code' => 'food', 'message' => 'not found!']
        //                     ]
        //                 ], 200);
        //             }
        //         }
        //     }
        // }
        // print_r($restaurant);die; 
        $restaurant_discount = Helpers::get_restaurant_discount($restaurant);
        if (isset($restaurant_discount)) {
            if ($product_price + $total_addon_price < $restaurant_discount['min_purchase']) {
                $restaurant_discount_amount = 0;
            }

            // if($restaurant_discount_amount > $restaurant_discount['max_discount'])
            // {
            //     $restaurant_discount_amount = $restaurant_discount['max_discount'];
            // }
        }
        $coupon_discount_amount = $coupon ? CouponLogic::get_discount($coupon, $product_price + $total_addon_price - $restaurant_discount_amount) : 0;
        $total_price = $product_price + $total_addon_price - $restaurant_discount_amount - $coupon_discount_amount;

        $tax = $restaurant->tax;
        $total_tax_amount = ($tax > 0) ? (($total_price * $tax) / 100) : 0;

        // echo $restaurant->minimum_order . ">" . ($product_price);die;

        if ($restaurant->minimum_order > ($product_price + $total_addon_price)) {
            return response()->json([
                'state' => 1,
                'errors' => [
                    ['code' => 'order_time', 'message' => trans('messages.you_need_to_order_at_least', ['amount' => $restaurant->minimum_order . ' ' . Helpers::currency_code()])]
                ]
            ], 200);
        }

        $free_delivery_over = BusinessSetting::where('key', 'free_delivery_over')->first()->value;
        if (isset($free_delivery_over)) {
            if ($free_delivery_over <= $product_price + $total_addon_price - $coupon_discount_amount - $restaurant_discount_amount) {
                $order->delivery_charge = 0;
            }
        }
        try {
            $order->coupon_discount_amount = $coupon_discount_amount;
            $order->coupon_discount_title = $coupon ? $coupon->title : '';

            $order->restaurant_discount_amount = $restaurant_discount_amount;
            $order->total_tax_amount = $total_tax_amount;
            // $order->order_amount = $total_price + $total_tax_amount + $order->delivery_charge;
            $order->save();
            // foreach ($order_details as $key => $item) {
            //     $order_details[$key]['order_id'] = $order->id;
            // }
            // OrderDetail::insert($order_details);
            Helpers::send_order_notification($order);

            if (!empty($request['cart'])) {

                foreach ($request['cart'] as $key => $value) {
                    $data = [
                        'cart_id' => $value
                    ];

                    $details = DB::table('cart')
                        ->select('*')
                        ->where($data)
                        ->first();

                    // print_r($details);die;

                    if (!empty($details)) {
                        DB::table('cart')
                            ->where($data)
                            ->update(array(
                                'is_odered' => 1,
                                'order_id' => $order->id
                            ));
                    }
                }

                return response()->json([
                    'state' => 0,
                    'message' => trans('messages.order_placed_successfully'),
                    'order_id' => $order->id,
                    'total_ammount' => number_format((float)$order->order_amount, 2, '.', '')
                ], 200);
            } else {
                return response()->json([
                    'state' => 1,
                    'errors' => [
                        ['code' => 'order_time', 'message' => trans('messages.failed_to_place_order')]
                    ]
                ], 200);
            }
        } catch (\Exception $e) {
            return response()->json([$e], 200);
        }

        return response()->json([
            'state' => 1,
            'errors' => [
                ['code' => 'order_time', 'message' => trans('messages.failed_to_place_order')]
            ]
        ], 200);
    }

    public function get_order_list(Request $request)
    {
        // $user_id = $request->user()->id;
        $user_id = $request->id;

        $orders = Order::with(['restaurant', 'delivery_man.rating'])
            ->withCount('details')
            ->where(['user_id' => $user_id])
            ->where(['order_status' => 'success'])
            ->Notpos()->get()->map(function ($data) {
                $data['delivery_address'] = $data['delivery_address'] ? json_decode($data['delivery_address']) : $data['delivery_address'];
                $restaurant = $data['restaurant'] ? Helpers::restaurant_data_formatting($data['restaurant']) : $data['restaurant'];

                $restaurant->avg_rating = number_format((float)$restaurant->avg_rating, 2, '.', '');

                $data['restaurant'] = $restaurant;

                $delivery_man = ($data['delivery_man'] != '') ? Helpers::deliverymen_data_formatting([$data['delivery_man']]) : "";
                unset($data['delivery_man']);
                $data['delivery_man'] = $delivery_man;
                $order_amount2 = number_format((float)$data['order_amount'], 2, '.', '');
                unset($data['order_amount']);
                $data['order_amount_round'] = $order_amount2;


                $total_tax_amount = number_format((float)$data['total_tax_amount'], 2, '.', '');
                unset($data['total_tax_amount']);
                $data['total_tax_amount_round'] = $total_tax_amount;

                $data['transaction_reference'] = ($data['transaction_reference'] != '') ? $data['transaction_reference'] : '';
                $data['delivery_address_id'] = ($data['delivery_address_id'] != '') ? $data['delivery_address_id'] : '';
                $data['delivery_man_id'] = ($data['delivery_man_id'] != '') ? $data['delivery_man_id'] : '';
                $data['coupon_code'] = ($data['coupon_code'] != '') ? $data['coupon_code'] : '';
                $data['order_note'] = ($data['order_note'] != '') ? $data['order_note'] : '';
                $data['callback'] = ($data['callback'] != '') ? $data['callback'] : '';
                $data['accepted'] = ($data['accepted'] != '') ? $data['accepted'] : '';
                $data['confirmed'] = ($data['confirmed'] != '') ? $data['confirmed'] : '';
                $data['processing'] = ($data['processing'] != '') ? $data['processing'] : '';
                $data['handover'] = ($data['handover'] != '') ? $data['handover'] : '';
                $data['picked_up'] = ($data['picked_up'] != '') ? $data['picked_up'] : '';
                $data['delivered'] = ($data['delivered'] != '') ? $data['delivered'] : '';
                $data['refund_requested'] = ($data['refund_requested'] != '') ? $data['refund_requested'] : '';
                $data['failed'] = ($data['failed'] != '') ? $data['failed'] : '';
                $data['canceled'] = ($data['canceled'] != '') ? $data['canceled'] : '';
                $data['refunded'] = ($data['refunded'] != '') ? $data['refunded'] : '';

                if ($data['food_id'] > 0) {
                    $product = Food::find($data['food_id']);
                    if (!empty($product)) {
                        $data['food_name'] = $product->name;
                    } else {
                        $data['food_name'] = '';
                    }
                } else {
                    $data['food_name'] = '';
                }


                return $data;
            });

        if (!empty($orders) && isset($orders[0]->id)) {
            return response()->json(['state' => 0, 'message' => 'Found!', 'errors' => $orders], 200);
        } else {
            return response()->json(['state' => 1, 'message' => 'No orders found!', 'errors' => []], 200);
        }
    }


    public function get_running_orders(Request $request)
    {
        $orders = Order::with(['restaurant', 'delivery_man.rating'])->withCount('details')->where(['user_id' => $request->user()->id])->whereNotIn('order_status', ['delivered', 'canceled', 'refund_requested', 'refunded', 'failed'])->Notpos()->get()->map(function ($data) {
            $data['delivery_address'] = $data['delivery_address'] ? json_decode($data['delivery_address']) : $data['delivery_address'];
            $data['restaurant'] = $data['restaurant'] ? Helpers::restaurant_data_formatting($data['restaurant']) : $data['restaurant'];
            $data['delivery_man'] = $data['delivery_man'] ? Helpers::deliverymen_data_formatting([$data['delivery_man']]) : $data['delivery_man'];

            $delivery_man = ($data['delivery_man'] != '') ? Helpers::deliverymen_data_formatting([$data['delivery_man']]) : "";
            unset($data['delivery_man']);
            $data['delivery_man'] = $delivery_man;
            $order_amount2 = number_format((float)$data['order_amount'], 2, '.', '');
            unset($data['order_amount']);
            $data['order_amount_round'] = $order_amount2;
            $data['transaction_reference'] = ($data['transaction_reference'] != '') ? $data['transaction_reference'] : '';
            $data['delivery_address_id'] = ($data['delivery_address_id'] != '') ? $data['delivery_address_id'] : '';
            $data['delivery_man_id'] = ($data['delivery_man_id'] != '') ? $data['delivery_man_id'] : '';
            $data['coupon_code'] = ($data['coupon_code'] != '') ? $data['coupon_code'] : '';
            $data['order_note'] = ($data['order_note'] != '') ? $data['order_note'] : '';
            $data['callback'] = ($data['callback'] != '') ? $data['callback'] : '';
            $data['accepted'] = ($data['accepted'] != '') ? $data['accepted'] : '';
            $data['confirmed'] = ($data['confirmed'] != '') ? $data['confirmed'] : '';
            $data['processing'] = ($data['processing'] != '') ? $data['processing'] : '';
            $data['handover'] = ($data['handover'] != '') ? $data['handover'] : '';
            $data['picked_up'] = ($data['picked_up'] != '') ? $data['picked_up'] : '';
            $data['delivered'] = ($data['delivered'] != '') ? $data['delivered'] : '';
            $data['refund_requested'] = ($data['refund_requested'] != '') ? $data['refund_requested'] : '';
            $data['failed'] = ($data['failed'] != '') ? $data['failed'] : '';
            $data['canceled'] = ($data['canceled'] != '') ? $data['canceled'] : '';
            $data['refunded'] = ($data['refunded'] != '') ? $data['refunded'] : '';
            return $data;
        });
        return response()->json(['state' => 0, 'errors' => $orders], 200);
    }

    public function get_order_details(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $details = OrderDetail::whereHas('order', function ($query) use ($request) {
            return $query->where('user_id', $request->user()->id);
        })->where(['order_id' => $request['order_id']])->get();
        if ($details->count() > 0) {
            $details = $details = Helpers::order_details_data_formatting($details);
            return response()->json($details, 200);
        } else {
            return response()->json([
                'state' => 1,
                'errors' => [
                    ['code' => 'order', 'message' => 'not found!']
                ]
            ], 200);
        }
    }

    public function cancel_order(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required',
            'user_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $order = Order::where(['user_id' => $request['user_id'], 'id' => $request['order_id']])->Notpos()->first();
        if (!$order) {
            return response()->json([
                'errors' => [
                    ['state' => 1, 'code' => 'order', 'message' => 'not found!']
                ]
            ], 200);
        } else if ($order->order_status == 'pending') {

            $order->order_status = 'canceled';
            $order->canceled = now();
            $order->save();
            return response()->json(['state' => 0, 'message' => 'Order canceled'], 200);
        }
        return response()->json([
            'errors' => [
                ['state' => 1, 'code' => 'order', 'message' => 'You can not cancle after confirmed!']
            ]
        ], 200);
    }

    public function refund_request(Request $request)
    {
        $order = Order::where(['user_id' => $request->user()->id, 'id' => $request['order_id']])->Notpos()->first();
        if (!$order) {
            return response()->json([
                'errors' => [
                    ['code' => 'order', 'message' => 'not found!']
                ]
            ], 200);
        } else if ($order->order_status == 'delivered') {

            $order->order_status = 'refund_requested';
            $order->refund_requested = now();
            $order->save();
            return response()->json(['message' => 'Refund request placed succfully!'], 200);
        }
        return response()->json([
            'errors' => [
                ['code' => 'order', 'message' => 'You can not request for refund before delivery!']
            ]
        ], 200);
    }

    public function update_payment_method(Request $request)
    {
        $order = Order::where(['user_id' => $request->user()->id, 'id' => $request['order_id']])->Notpos()->first();
        if ($order) {
            Order::where(['user_id' => $request->user()->id, 'id' => $request['order_id']])->update([
                'payment_method' => 'cash_on_delivery', 'order_status' => 'pending', 'pending' => now()
            ]);

            $fcm_token = $request->user()->cm_firebase_token;
            $value = Helpers::order_status_update_message('pending');
            try {
                if ($value) {
                    $data = [
                        'title' => trans('messages.order_placed_successfully'),
                        'description' => $value,
                        'order_id' => $order->id,
                        'image' => '',
                        'type' => 'order_status',
                    ];
                    Helpers::send_push_notif_to_device($fcm_token, $data);
                    DB::table('user_notifications')->insert([
                        'data' => json_encode($data),
                        'user_id' => $request->user()->id,
                        'created_at' => now(),
                        'updated_at' => now()
                    ]);
                }
                if ($order->order_type == 'delivery' && !$order->scheduled) {
                    $data = [
                        'title' => trans('messages.order_placed_successfully'),
                        'description' => trans('messages.new_order_push_description'),
                        'order_id' => $order->id,
                        'image' => '',
                    ];
                    Helpers::send_push_notif_to_topic($data, $order->restaurant->zone->deliveryman_wise_topic, 'order_request');
                }
            } catch (\Exception $e) {
                info($e);
            }
            return response()->json(['message' => trans('messages.payment') . ' ' . trans('messages.method') . ' ' . trans('messages.updated_successfully')], 200);
        }
        return response()->json([
            'errors' => [
                ['code' => 'order', 'message' => trans('messages.not_found')]
            ]
        ], 200);
    }

    public function cart_list(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'restaurant_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $cartDetails = DB::table('cart')
            ->select('cart.*', 'food.name AS food_name', 'food.image AS food_image')
            ->join('food', 'food.id', '=', 'cart.food_id')
            ->where('cart.user_id', $request['user_id'])
            ->where('cart.restaurant_id', $request['restaurant_id'])
            ->where('cart.is_odered', 0)
            ->get();


        if (isset($cartDetails[0]->cart_id)) {
            foreach ($cartDetails as $key => $value) {
                $cartData[] = array(
                    'cart_id' => $value->cart_id,
                    'user_id' => $value->user_id,
                    'restaurant_id' => $value->restaurant_id,
                    'food_id' => $value->food_id,
                    'food_name' => $value->food_name,
                    // 'food_image' => $value->food_image,
                    'food_image' => url('storage/app/public/product/' . $value->food_image),
                    'quantity' => $value->quantity,
                    'tax' => number_format((float)$value->tax, 2, '.', ''),
                    'food_amount' => number_format((float)$value->food_amount, 2, '.', ''),
                    'is_odered' => $value->is_odered,
                    'added_dtime' => $value->added_dtime
                );
            }
            return response()->json(['state' => 0, 'message' => 'found!', 'respData' => $cartData], 200);
        } else {
            return response()->json(['state' => 1, 'message' => 'Cart is empty!', 'respData' => []], 200);
        }
    }

    public function add_to_cart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'restaurant_id' => 'required',
            'food_id' => 'required',
            'tax' => 'required',
            'food_amount' => 'required',
            'quantity' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $details = DB::table('cart')
            ->select('*')
            ->where('user_id', $request['user_id'])
            ->where('restaurant_id', $request['restaurant_id'])
            ->where('food_id', $request['food_id'])
            ->where('is_odered', 0)
            ->first();

        // print_r($details);die;

        if (empty($details)) {
            $data = [
                'user_id' => $request['user_id'],
                'restaurant_id' => $request['restaurant_id'],
                'food_id' => $request['food_id'],
                'tax' => $request['tax'],
                'food_amount' => $request['food_amount'],
                'quantity' => $request['quantity'],
                'added_dtime' => now()
            ];
            $cart_id = DB::table('cart')->insertGetId($data);

            $data += array('cart_id' => $cart_id);

            return response()->json(['state' => 0, 'message' => 'Added to cart!', 'respData' => $data], 200);
        } else {
            return response()->json(['state' => 1, 'message' => 'Already is in cart!', 'respData' => []], 200);
        }
    }


    public function update_cart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cart_id' => 'required',
            'quantity' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $data = [
            'cart_id' => $request['cart_id']
        ];


        $details = DB::table('cart')
            ->select('*')
            ->where($data)
            ->first();

        // print_r($details);die;

        if (!empty($details)) {

            DB::table('cart')
                ->where($data)
                ->update(array(
                    'quantity' => $request['quantity']
                ));

            $resdata = [
                'cart_id' => $request['cart_id'],
                'quantity' => $request['quantity']
            ];

            return response()->json(['state' => 0, 'message' => 'Item has been successfully updated!', 'respData' => $resdata], 200);
        } else {
            return response()->json(['state' => 1, 'message' => 'Cound not update. Item not found in cart!', 'respData' => []], 200);
        }
    }

    public function delete_cart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cart_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $data = [
            'cart_id' => $request['cart_id']
        ];

        $details = DB::table('cart')
            ->select('*')
            ->where($data)
            ->where('is_odered', 0)
            ->first();

        // print_r($details);die;

        if (!empty($details)) {

            $status = DB::table('cart')
                ->where($data)
                ->delete();

            return response()->json(['state' => 0, 'message' => 'Item has been successfully removed from cart!', 'respData' => $data], 200);
        } else {
            return response()->json(['state' => 1, 'message' => 'Cound not remove. Item not found in cart!', 'respData' => []], 200);
        }
    }
}
