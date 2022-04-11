<?php

namespace App\Http\Controllers\Api\V1;

ini_set('memory_limit', '-1');

use App\CentralLogics\Helpers;
use App\CentralLogics\OrderLogic;
use App\Http\Controllers\Controller;
use App\Models\DeliveryHistory;
use App\Models\DeliveryMan;
use App\Models\Admin;
use App\Models\Order;
use App\Models\RestaurantWallet;
use App\Models\AdminWallet;
use App\Models\DeliveryManWallet;
use App\Models\Notification;
use App\Models\Tracking;
use App\Models\UserNotification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Config;
use Carbon\Carbon;

Carbon::setWeekStartsAt(Carbon::SUNDAY);
Carbon::setWeekEndsAt(Carbon::SATURDAY);


class DeliverymanController extends Controller
{

    public function get_profile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }
        $dm = DeliveryMan::with(['rating'])->where(['phone' => $request['phone']])->first();
        $dm['avg_rating'] = (float)(!empty($dm->rating[0]) ? $dm->rating[0]->average : 0);
        $dm['rating_count'] = (float)(!empty($dm->rating[0]) ? $dm->rating[0]->rating_count : 0);
        $dm['order_count'] = (int)$dm->orders->count();
        $dm['todays_order_count'] = (int)$dm->todaysorders->count();
        $dm['this_week_order_count'] = (int)$dm->this_week_orders->count();
        $dm['member_since_days'] = (int)$dm->created_at->diffInDays();
        $dm['cash_in_hands'] = $dm->wallet ? $dm->wallet->collected_cash : 0;
        $dm['balance'] = $dm->wallet ? $dm->wallet->total_earning - $dm->wallet->total_withdrawn : 0;
        $dm['todays_earning'] = (float)$dm->todays_earning()->sum('original_delivery_charge');
        $dm['this_week_earning'] = (float)$dm->this_week_earning()->sum('original_delivery_charge');
        $dm['this_month_earning'] = (float)$dm->this_month_earning()->sum('original_delivery_charge');
        $dm['image'] = url('storage/app/public/delivery-man/' . $dm->image);
        unset($dm['orders']);
        unset($dm['rating']);
        unset($dm['todaysorders']);
        unset($dm['this_week_orders']);
        unset($dm['wallet']);
        return response()->json(['state' => 0, 'respData' => $dm], 200);
    }

    public function update_profile(Request $request)
    {
        $dm = DeliveryMan::with(['rating'])->where(['auth_token' => $request['token']])->first();
        $validator = Validator::make($request->all(), [
            'f_name' => 'required',
            'l_name' => 'required',
            'email' => 'required|unique:delivery_men,email,' . $dm->id,
            'password' => 'nullable|min:6',
        ], [
            'f_name.required' => 'First name is required!',
            'l_name.required' => 'Last name is required!',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $image = $request->file('image');

        if ($request->has('image')) {
            $imageName = Helpers::update('delivery-man/', $dm->image, 'png', $request->file('image'));
        } else {
            $imageName = $dm->image;
        }

        if ($request['password'] != null && strlen($request['password']) > 5) {
            $pass = bcrypt($request['password']);
        } else {
            $pass = $dm->password;
        }
        $dm->f_name = $request->f_name;
        $dm->l_name = $request->l_name;
        $dm->email = $request->email;
        $dm->image = $imageName;
        $dm->password = $pass;
        $dm->updated_at = now();
        $dm->save();

        return response()->json(['message' => 'successfully updated!'], 200);
    }

    public function activeStatus(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'active_status' => 'required|numeric|in:0,1'
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $dm = DeliveryMan::with(['rating'])->where(['id' => $request['user_id']])->first();
        // $dm->active = $dm->active ? 0 : 1;
        $dm->active = $request['active_status'];
        $dm->save();
        return response()->json(['state' => 0, 'active_status' => $dm->active, 'message' => trans('messages.active_status_updated')], 200);
    }

    public function get_current_orders(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $dm = DeliveryMan::where(['id' => $request['user_id']])->first();
        $orders = Order::with(['customer', 'restaurant'])
            ->whereIn('order_status', ['confirmed', 'processing', 'accepted_by_delivery_agent', 'picked_up', 'handover'])
            // ->whereIn('order_status', ['accepted', 'confirmed', 'pending', 'processing', 'picked_up', 'handover'])
            ->where(['delivery_man_id' => $dm['id']])
            ->whereDate('created_at', date('Y-m-d'))
            // ->orderBy('accepted')
            ->orderBy('schedule_at', 'desc')
            ->Notpos()
            ->get();
        // $orders = Helpers::order_data_formatting($orders, true);

        if (isset($orders[0]->id)) {
            foreach ($orders as $key => $value) {

                $cartDetails = DB::table('cart')
                    ->select('cart.*', 'food.name AS food_name', 'food.image AS food_image')
                    ->join('food', 'food.id', '=', 'cart.food_id')
                    ->where('cart.order_id', $value->id)
                    ->where('cart.is_odered', 1)
                    ->get();

                $orders_f[] = array(
                    'id' => $value->id,
                    'user_id' => $value->user_id,
                    'food_id' => $value->food_id,
                    'quantity' => $value->quantity,
                    'order_amount' => $value->order_amount,
                    'coupon_discount_amount' => $value->coupon_discount_amount,
                    'coupon_discount_title' => $value->coupon_discount_title,
                    'payment_status' => $value->payment_status,
                    'order_status' => $value->order_status,
                    'total_tax_amount' => $value->total_tax_amount,
                    'payment_method' => $value->payment_method,
                    'transaction_reference' => ($value->transaction_reference != '') ? $value->transaction_reference : '',
                    'delivery_man_id' => ($value->delivery_man_id != '') ? (string)$value->delivery_man_id : '',
                    'coupon_code' => ($value->coupon_code != '') ? $value->coupon_code : '',
                    'order_note' => ($value->order_note != '') ? $value->order_note : '',
                    'order_type' => ($value->order_type != '') ? $value->order_type : '',
                    'checked' => $value->checked,
                    'restaurant_id' => $value->restaurant_id,
                    'created_at' => $value->created_at,
                    'updated_at' => $value->updated_at,
                    'delivery_charge' => $value->delivery_charge,
                    'schedule_at' => $value->schedule_at,
                    'callback' => ($value->callback != '') ? $value->callback : '',
                    'otp' => $value->otp,
                    'pending' => ($value->pending != '') ? $value->pending : '',
                    'accepted' => ($value->accepted != '') ? $value->accepted : '',
                    'confirmed' => ($value->confirmed != '') ? $value->confirmed : '',
                    'processing' => ($value->processing != '') ? $value->processing : '',
                    'handover' => ($value->handover != '') ? $value->handover : '',
                    'picked_up' => ($value->picked_up != '') ? $value->picked_up : '',
                    'delivered' => ($value->delivered != '') ? $value->delivered : '',
                    'canceled' => ($value->canceled != '') ? $value->canceled : '',
                    'refund_requested' => ($value->refund_requested != '') ? $value->refund_requested : '',
                    'refunded' => ($value->refunded != '') ? $value->refunded : '',
                    'transaction_id' => $value->transaction_id,
                    'delivery_address' => $value->delivery_address,
                    'scheduled' => $value->scheduled,
                    'restaurant_discount_amount' => $value->restaurant_discount_amount,
                    'original_delivery_charge' => $value->original_delivery_charge,
                    'failed' => ($value->failed != '') ? $value->failed : '',
                    'adjusment' => $value->adjusment,
                    'edited' => $value->edited,
                    'cart_details' => $cartDetails,
                    'delivery_boy_details' => $dm
                );
            }
            return response()->json(['state' => 0, 'message' => 'found', 'respData' => $orders_f], 200);
        } else {
            return response()->json(['state' => 0, 'message' => 'not found', 'respData' => []], 200);
        }
        return response()->json(['state' => 0, 'respData' => $orders], 200);
    }

    public function get_latest_orders(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $dm = DeliveryMan::where(['id' => $request['user_id']])->first();

        if (!isset($dm)) {
            return response()->json(['state' => 1, 'errors' => 'User not found!'], 200);
        }

        $orders = Order::with(['customer', 'restaurant']);
        // print_r($orders);die;
        if ($dm->type == 'zone_wise') {
            $orders = $orders->whereHas('restaurant', function ($q) use ($dm) {
                $q->where('zone_id', $dm->zone_id)->where('self_delivery_system', 0);
            });
        } else {
            $orders = $orders->where('restaurant_id', $dm->restaurant_id);
        }

        // if (config('order_confirmation_model') == 'deliveryman') {
        //     $orders = $orders->whereIn('order_status', ['pending', 'confirmed', 'processing', 'handover']);
        // } else {
        //     $orders = $orders->whereIn('order_status', ['confirmed', 'processing', 'handover']);
        // }

        // $orders = $orders->where(['delivery_man_id' => $dm['id']]);
        // print_r($orders);die;
        $orders = $orders
            ->delivery()
            // ->OrderScheduledIn(30)
            ->whereDate('created_at', date('Y-m-d'))
            ->whereIn('order_status', ['confirmed', 'accepted', 'processing'])
            // ->whereNull('delivery_man_id')
            // ->orderBy('schedule_at', 'desc')
            ->Notpos()
            ->get();

        // print_r($orders);die;
        // $orders = Helpers::order_data_formatting($orders, true);
        if (isset($orders[0]->id)) {
            foreach ($orders as $key => $value) {

                $cartDetails = DB::table('cart')
                    ->select('cart.*', 'food.name AS food_name', 'food.image AS food_image')
                    ->join('food', 'food.id', '=', 'cart.food_id')
                    ->where('cart.order_id', $value->id)
                    ->where('cart.is_odered', 1)
                    ->get();

                $orders_f[] = array(
                    'id' => $value->id,
                    'user_id' => $value->user_id,
                    'food_id' => $value->food_id,
                    'quantity' => $value->quantity,
                    'order_amount' => $value->order_amount,
                    'coupon_discount_amount' => $value->coupon_discount_amount,
                    'coupon_discount_title' => $value->coupon_discount_title,
                    'payment_status' => $value->payment_status,
                    'order_status' => $value->order_status,
                    'total_tax_amount' => $value->total_tax_amount,
                    'payment_method' => $value->payment_method,
                    'transaction_reference' => ($value->transaction_reference != '') ? $value->transaction_reference : '',
                    'delivery_man_id' => ($value->delivery_man_id != '') ? (string)$value->delivery_man_id : '',
                    'coupon_code' => ($value->coupon_code != '') ? $value->coupon_code : '',
                    'order_note' => ($value->order_note != '') ? $value->order_note : '',
                    'order_type' => ($value->order_type != '') ? $value->order_type : '',
                    'checked' => $value->checked,
                    'restaurant_id' => $value->restaurant_id,
                    'created_at' => $value->created_at,
                    'updated_at' => $value->updated_at,
                    'delivery_charge' => $value->delivery_charge,
                    'schedule_at' => $value->schedule_at,
                    'callback' => ($value->callback != '') ? $value->callback : '',
                    'otp' => $value->otp,
                    'pending' => ($value->pending != '') ? $value->pending : '',
                    'accepted' => ($value->accepted != '') ? $value->accepted : '',
                    'confirmed' => ($value->confirmed != '') ? $value->confirmed : '',
                    'processing' => ($value->processing != '') ? $value->processing : '',
                    'handover' => ($value->handover != '') ? $value->handover : '',
                    'picked_up' => ($value->picked_up != '') ? $value->picked_up : '',
                    'delivered' => ($value->delivered != '') ? $value->delivered : '',
                    'canceled' => ($value->canceled != '') ? $value->canceled : '',
                    'refund_requested' => ($value->refund_requested != '') ? $value->refund_requested : '',
                    'refunded' => ($value->refunded != '') ? $value->refunded : '',
                    'transaction_id' => $value->transaction_id,
                    'delivery_address' => $value->delivery_address,
                    'scheduled' => $value->scheduled,
                    'restaurant_discount_amount' => $value->restaurant_discount_amount,
                    'original_delivery_charge' => $value->original_delivery_charge,
                    'failed' => ($value->failed != '') ? $value->failed : '',
                    'adjusment' => $value->adjusment,
                    'edited' => $value->edited,
                    'cart_details' => $cartDetails,
                    'delivery_boy_details' => $dm
                );
            }
            return response()->json(['state' => 0, 'message' => 'found', 'respData' => $orders_f], 200);
        } else {
            return response()->json(['state' => 0, 'message' => 'not found', 'respData' => []], 200);
        }
    }

    public function accept_order(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required|exists:orders,id',
            'user_id' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }
        $dm = DeliveryMan::where(['id' => $request['user_id']])->first();

        if ($dm->active) {
            $order = Order::where('id', $request['order_id'])
                // ->whereIn('order_status', ['pending', 'confirmed'])
                ->whereNull('delivery_man_id')
                ->Notpos()
                ->first();
            if (!$order) {
                return response()->json([
                    'state' => 1,
                    'errors' => [
                        ['code' => 'order', 'message' => trans('messages.can_not_accept')]
                    ]
                ], 200);
            }
            // if ($dm->current_orders >= config('dm_maximum_orders')) {
            //     return response()->json([
            //         'state' => 1,
            //         'errors' => [
            //             ['code' => 'dm_maximum_order_exceed', 'message' => trans('messages.dm_maximum_order_exceed_warning')]
            //         ]
            //     ], 200);
            // }
            // $order->order_status = in_array($order->order_status, ['pending', 'confirmed']) ? 'accepted_by_delivery_agent' : 
            $order->order_status = 'accepted_by_delivery_agent';
            $order->delivery_man_id = $dm->id;
            $order->accepted = now();
            $order->save();

            $dm->current_orders = $dm->current_orders + 1;
            $dm->save();

            $fcm_token = $order->customer->cm_firebase_token;

            $value = Helpers::order_status_update_message('accepted');
            try {
                if ($value) {
                    $data = [
                        'title' => trans('messages.order_push_title'),
                        'description' => $value,
                        'order_id' => $order['id'],
                        'image' => '',
                        'type' => 'order_status'
                    ];
                    Helpers::send_push_notif_to_device($fcm_token, $data);
                }
            } catch (\Exception $e) {
            }
        } else {
            return response()->json(['state' => 1, 'errors' => 'Duty status is inactive cannot accept!'], 200);
        }


        return response()->json(['state' => 0, 'message' => 'Order accepted successfully'], 200);
    }

    public function record_location_data(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required|exists:orders,id',
            'user_id' => 'required',
            'longitude' => 'required',
            'latitude' => 'required',
            // 'location' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $dm = DeliveryMan::where(['id' => $request['user_id']])->first();
        $order = Order::whereIn('order_status', ['accepted', 'confirmed', 'pending', 'processing', 'picked_up'])
            ->when($request['order_id'], function ($q) use ($request) {
                return $q->where('id', $request['order_id']);
            })
            ->where('delivery_man_id', $dm['id'])
            ->Notpos()
            ->first();
        DB::table('delivery_histories')->insert([
            'order_id' => $order ? $order->id : null,
            'delivery_man_id' => $dm['id'],
            'longitude' => $request['longitude'],
            'latitude' => $request['latitude'],
            'time' => now(),
            'location' => $request['location'],
            'created_at' => now(),
            'updated_at' => now()
        ]);
        return response()->json(['state' => 0, 'message' => 'location recorded'], 200);
    }

    public function get_order_history(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 403);
        }
        $dm = DeliveryMan::where(['auth_token' => $request['token']])->first();

        $history = DeliveryHistory::where(['order_id' => $request['order_id'], 'delivery_man_id' => $dm['id']])->get();
        return response()->json($history, 200);
    }

    public function update_order_status(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'order_id' => 'required',
            'status' => 'required|in:confirmed,canceled,picked_up,delivered',
        ]);

        // $validator->sometimes('otp', 'required', function ($request) {
        //     return (Config::get('order_delivery_verification') == 1 && $request['status'] == 'delivered');
        // });

        if ($validator->fails()) {
            return response()->json([
                'state' => 1, 'errors' => Helpers::error_processor($validator)
            ], 200);
        }
        $dm = DeliveryMan::where(['id' => $request['user_id']])->first();
        // $dm = DeliveryMan::where(['auth_token' => $request['token']])->first();

        $order = Order::where(['id' => $request['order_id'], 'delivery_man_id' => $dm['id']])->Notpos()->first();

        if ($order) {
            if ($request['status'] == "confirmed" && config('order_confirmation_model') == 'restaurant') {
                return response()->json([
                    'state' => 1,
                    'errors' => [
                        ['code' => 'order-confirmation-model', 'message' => trans('messages.order_confirmation_warning')]
                    ]
                ], 200);
            }

            if ($order->order_status != "pending" && $request['status'] == 'canceled') {
                return response()->json([
                    'state' => 1,
                    'errors' => [
                        ['code' => 'delivery-man', 'message' => trans('messages.order_can_not_cancle_after_confirm')]
                    ]
                ], 200);
            }

            // if (Config::get('order_delivery_verification') == 1 && $request['status'] == 'delivered' && $order->otp != $request['otp']) {
            //     return response()->json([
            //         'state' => 1,
            //         'errors' => [
            //             ['code' => 'otp', 'message' => 'Not matched']
            //         ]
            //     ], 200);
            // }
            if ($request->status == 'delivered') {
                if ($order->transaction == null) {
                    $reveived_by = $order->payment_method == 'cash_on_delivery' ? 'deliveryman' : 'admin';

                    if (OrderLogic::create_transaction($order, $reveived_by, null)) {
                        $order->payment_status = 'paid';
                    } else {
                        return response()->json([
                            'state' => 1,
                            'errors' => [
                                ['code' => 'error', 'message' => trans('messages.faield_to_create_order_transaction')]
                            ]
                        ], 200);
                    }
                }
                if ($order->transaction) {
                    $order->transaction->update(['delivery_man_id' => $dm->id]);
                }

                $order->details->each(function ($item, $key) {
                    if ($item->food) {
                        $item->food->increment('order_count');
                    }
                });
                $order->customer->increment('order_count');
                if ($dm->earning == 1) {
                    $dmWallet = DeliveryManWallet::firstOrNew(
                        ['delivery_man_id' => $dm->id]
                    );
                    $dmWallet->total_earning = $dmWallet->total_earning + $order->original_delivery_charge;
                    $dmWallet->save();
                }

                $dm->current_orders = $dm->current_orders > 1 ? $dm->current_orders - 1 : 0;
                $dm->save();
            }


            $order->order_status = $request['status'];
            $order[$request['status']] = now();
            $order->save();

            Helpers::send_order_notification($order);

            return response()->json(['state' => 0, 'message' => 'Status updated'], 200);
        } else {

            return response()->json(['state' => 1, 'message' => 'Order not found!'], 200);
        }
    }

    public function get_order_details(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'order_id' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'state' => 1,
                'errors' => Helpers::error_processor($validator)
            ], 200);
        }

        $dm = DeliveryMan::where(['id' => $request['user_id']])->first();
        // $dm = DeliveryMan::where(['auth_token' => $request['token']])->first();

        $order = Order::with(['details'])->where(['delivery_man_id' => $dm['id'], 'id' => $request['order_id']])->Notpos()->first();
        if (!$order) {
            return response()->json([
                'state' => 1,
                'errors' => [
                    ['code' => 'order', 'message' => trans('messages.not_found')]
                ]
            ], 200);
        }
        // $details = Helpers::order_details_data_formatting($order->details);

        if (isset($order->id)) {
            // foreach ($order as $key => $value) {

            $cartDetails = DB::table('cart')
                ->select('cart.*', 'food.name AS food_name', 'food.image AS food_image')
                ->join('food', 'food.id', '=', 'cart.food_id')
                ->where('cart.order_id', $order->id)
                ->where('cart.is_odered', 1)
                ->get();


            $orders_f[] = array(
                'id' => $order->id,
                'user_id' => $order->user_id,
                'food_id' => $order->food_id,
                'quantity' => $order->quantity,
                'order_amount' => $order->order_amount,
                'coupon_discount_amount' => $order->coupon_discount_amount,
                'coupon_discount_title' => $order->coupon_discount_title,
                'payment_status' => $order->payment_status,
                'order_status' => $order->order_status,
                'total_tax_amount' => $order->total_tax_amount,
                'payment_method' => $order->payment_method,
                'transaction_reference' => ($order->transaction_reference != '') ? $order->transaction_reference : '',
                'delivery_man_id' => ($order->delivery_man_id != '') ? (string)$order->delivery_man_id : '',
                'coupon_code' => ($order->coupon_code != '') ? $order->coupon_code : '',
                'order_note' => ($order->order_note != '') ? $order->order_note : '',
                'order_type' => ($order->order_type != '') ? $order->order_type : '',
                'checked' => $order->checked,
                'restaurant_id' => $order->restaurant_id,
                'created_at' => $order->created_at,
                'updated_at' => $order->updated_at,
                'delivery_charge' => $order->delivery_charge,
                'schedule_at' => $order->schedule_at,
                'callback' => ($order->callback != '') ? $order->callback : '',
                'otp' => $order->otp,
                'pending' => ($order->pending != '') ? $order->pending : '',
                'accepted' => ($order->accepted != '') ? $order->accepted : '',
                'confirmed' => ($order->confirmed != '') ? $order->confirmed : '',
                'processing' => ($order->processing != '') ? $order->processing : '',
                'handover' => ($order->handover != '') ? $order->handover : '',
                'picked_up' => ($order->picked_up != '') ? $order->picked_up : '',
                'delivered' => ($order->delivered != '') ? $order->delivered : '',
                'canceled' => ($order->canceled != '') ? $order->canceled : '',
                'refund_requested' => ($order->refund_requested != '') ? $order->refund_requested : '',
                'refunded' => ($order->refunded != '') ? $order->refunded : '',
                'transaction_id' => $order->transaction_id,
                'delivery_address' => $order->delivery_address,
                'scheduled' => $order->scheduled,
                'restaurant_discount_amount' => $order->restaurant_discount_amount,
                'original_delivery_charge' => $order->original_delivery_charge,
                'failed' => ($order->failed != '') ? $order->failed : '',
                'adjusment' => $order->adjusment,
                'edited' => $order->edited,
                'cart_details' => $cartDetails,
                'delivery_boy_details' => $dm
            );
            // }
            return response()->json(['state' => 0, 'message' => 'found', 'respData' => $orders_f], 200);
        } else {
            return response()->json(['state' => 0, 'message' => 'not found', 'respData' => []], 200);
        }
    }

    public function get_all_orders(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            // 'order_id' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'state' => 1,
                'errors' => Helpers::error_processor($validator)
            ], 200);
        }

        $dm = DeliveryMan::where(['id' => $request['user_id']])->first();
        // $dm = DeliveryMan::where(['auth_token' => $request['token']])->first();

        $orders = Order::with(['customer', 'restaurant'])
            ->where(['delivery_man_id' => $dm['id']])
            ->where('order_status', 'delivered')
            ->orderBy('schedule_at', 'desc')
            ->Notpos()
            ->get();

        if (isset($orders[0]->id)) {
            foreach ($orders as $key => $value) {

                $cartDetails = DB::table('cart')
                    ->select('cart.*', 'food.name AS food_name', 'food.image AS food_image')
                    ->join('food', 'food.id', '=', 'cart.food_id')
                    ->where('cart.order_id', $value->id)
                    ->where('cart.is_odered', 1)
                    ->get();

                $orders_f[] = array(
                    'id' => $value->id,
                    'user_id' => $value->user_id,
                    'food_id' => $value->food_id,
                    'quantity' => $value->quantity,
                    'order_amount' => $value->order_amount,
                    'coupon_discount_amount' => $value->coupon_discount_amount,
                    'coupon_discount_title' => $value->coupon_discount_title,
                    'payment_status' => $value->payment_status,
                    'order_status' => $value->order_status,
                    'total_tax_amount' => $value->total_tax_amount,
                    'payment_method' => $value->payment_method,
                    'transaction_reference' => ($value->transaction_reference != '') ? $value->transaction_reference : '',
                    'delivery_man_id' => ($value->delivery_man_id != '') ? (string)$value->delivery_man_id : '',
                    'coupon_code' => ($value->coupon_code != '') ? $value->coupon_code : '',
                    'order_note' => ($value->order_note != '') ? $value->order_note : '',
                    'order_type' => ($value->order_type != '') ? $value->order_type : '',
                    'checked' => $value->checked,
                    'restaurant_id' => $value->restaurant_id,
                    'created_at' => $value->created_at,
                    'updated_at' => $value->updated_at,
                    'delivery_charge' => $value->delivery_charge,
                    'schedule_at' => $value->schedule_at,
                    'callback' => ($value->callback != '') ? $value->callback : '',
                    'otp' => $value->otp,
                    'pending' => ($value->pending != '') ? $value->pending : '',
                    'accepted' => ($value->accepted != '') ? $value->accepted : '',
                    'confirmed' => ($value->confirmed != '') ? $value->confirmed : '',
                    'processing' => ($value->processing != '') ? $value->processing : '',
                    'handover' => ($value->handover != '') ? $value->handover : '',
                    'picked_up' => ($value->picked_up != '') ? $value->picked_up : '',
                    'delivered' => ($value->delivered != '') ? $value->delivered : '',
                    'canceled' => ($value->canceled != '') ? $value->canceled : '',
                    'refund_requested' => ($value->refund_requested != '') ? $value->refund_requested : '',
                    'refunded' => ($value->refunded != '') ? $value->refunded : '',
                    'transaction_id' => $value->transaction_id,
                    'delivery_address' => $value->delivery_address,
                    'scheduled' => $value->scheduled,
                    'restaurant_discount_amount' => $value->restaurant_discount_amount,
                    'original_delivery_charge' => $value->original_delivery_charge,
                    'failed' => ($value->failed != '') ? $value->failed : '',
                    'adjusment' => $value->adjusment,
                    'edited' => $value->edited,
                    'cart_details' => $cartDetails,
                    'delivery_boy_details' => $dm
                );
            }
            return response()->json(['state' => 0, 'message' => 'found', 'respData' => $orders_f], 200);
        } else {
            return response()->json(['state' => 0, 'message' => 'not found', 'respData' => []], 200);
        }
    }

    public function get_last_location(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $last_data = DeliveryHistory::where(['order_id' => $request['order_id']])->latest()->first();

        if ($last_data != '') {
            return response()->json(['state' => 0, 'respData' =>  $last_data], 200);
        } else {
            return response()->json(['state' => 0, 'respData' =>
            []], 200);
        }
    }

    public function order_payment_status_update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required',
            'status' => 'required|in:paid'
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $dm = DeliveryMan::where(['auth_token' => $request['token']])->first();

        if (Order::where(['delivery_man_id' => $dm['id'], 'id' => $request['order_id']])->Notpos()->first()) {
            Order::where(['delivery_man_id' => $dm['id'], 'id' => $request['order_id']])->update([
                'payment_status' => $request['status']
            ]);
            return response()->json(['message' => 'Payment status updated'], 200);
        }
        return response()->json([
            'errors' => [
                ['code' => 'order', 'message' => 'not found!']
            ]
        ], 404);
    }

    public function update_fcm_token(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'fcm_token' => 'required',
            'user_id' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }
        $dm = DeliveryMan::where(['id' => $request['user_id']])->first();

        DeliveryMan::where(['id' => $dm['id']])->update([
            'fcm_token' => $request['fcm_token']
        ]);

        return response()->json(['state' => 0, 'message' => 'successfully updated!'], 200);
    }

    public function get_notifications(Request $request)
    {

        $dm = DeliveryMan::where(['auth_token' => $request['token']])->first();

        $notifications = Notification::active()->where(function ($q) use ($dm) {
            $q->whereNull('zone_id')->orWhere('zone_id', $dm->zone_id);
        })->where('tergat', 'deliveryman')->where('created_at', '>=', \Carbon\Carbon::today()->subDays(7))->get();

        $user_notifications = UserNotification::where('delivery_man_id', $dm->id)->where('created_at', '>=', \Carbon\Carbon::today()->subDays(7))->get();

        $notifications->append('data');

        $notifications =  $notifications->merge($user_notifications);
        try {
            return response()->json($notifications, 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }
}
