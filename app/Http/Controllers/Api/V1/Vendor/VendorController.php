<?php

namespace App\Http\Controllers\Api\V1\Vendor;

use App\CentralLogics\Helpers;
use App\CentralLogics\OrderLogic;
use App\CentralLogics\RestaurantLogic;
use App\CentralLogics\CampaignLogic;
use App\Http\Controllers\Controller;
use App\Models\Vendor;
use App\Models\Order;
use App\Models\RestaurantWallet;
use App\Models\Restaurant;
use App\Models\Admin;
use App\Models\AdminWallet;
use App\Models\Notification;
use App\Models\UserNotification;
use App\Models\Campaign;
use App\Models\WithdrawRequest;
use App\Models\Food;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Config;
use App\Models\DeliveryMan;

class VendorController extends Controller
{
    public function get_profile(Request $request)
    {
        $vendor = $request['vendor'];
        $restaurant = Helpers::restaurant_data_formatting($vendor->restaurants[0], false);
        $restaurant['discount'] = $vendor->restaurants[0]->discount;

        $vendor['order_count'] = $vendor->orders->count();
        $vendor['todays_order_count'] = $vendor->todaysorders->count();
        $vendor['this_week_order_count'] = $vendor->this_week_orders->count();
        $vendor['this_month_order_count'] = $vendor->this_month_orders->count();
        $vendor['member_since_days'] = $vendor->created_at->diffInDays();
        $vendor['cash_in_hands'] = $vendor->wallet ? (float)$vendor->wallet->collected_cash : 0;
        $vendor['balance'] = $vendor->wallet ? (float)$vendor->wallet->balance : 0;
        $vendor['total_earning'] = $vendor->wallet ? (float)$vendor->wallet->total_earning : 0;
        $vendor['todays_earning'] = (float)$vendor->todays_earning()->sum('restaurant_amount');
        $vendor['this_week_earning'] = (float)$vendor->this_week_earning()->sum('restaurant_amount');
        $vendor['this_month_earning'] = (float)$vendor->this_month_earning()->sum('restaurant_amount');
        $vendor["restaurants"] = $restaurant;
        unset($vendor['orders']);
        unset($vendor['rating']);
        unset($vendor['todaysorders']);
        unset($vendor['this_week_orders']);
        unset($vendor['wallet']);
        unset($vendor['todaysorders']);
        unset($vendor['this_week_orders']);
        unset($vendor['this_month_orders']);

        return response()->json($vendor, 200);
    }

    public function active_status(Request $request)
    {
        $restaurant = $request->vendor->restaurants[0];
        $restaurant->active = $restaurant->active ? 0 : 1;
        $restaurant->save();
        return response()->json(['message' => $restaurant->active ? trans('messages.restaurant_opened') : trans('messages.restaurant_temporarily_closed')], 200);
    }

    public function get_earning_data(Request $request)
    {
        $vendor = $request['vendor'];
        $data = RestaurantLogic::get_earning_data($vendor->id);
        return response()->json($data, 200);
    }

    public function update_profile(Request $request)
    {
        // $vendor = $request['vendor'];
        $validator = Validator::make($request->all(), [
            // 'f_name' => 'required',
            // 'l_name' => 'required',
            // 'phone' => 'required|unique:vendors,phone,'.$vendor->id,
            'email' => 'required|exists:vendors,email',
            'old_password' => 'required|min:6',
            'new_password' => 'required|min:6',
            'confirm_password' => 'required|same:new_password',
        ], [
            // 'f_name.required' => 'First name is required!',
            // 'l_name.required' => 'Last name is required!',
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        // $image = $request->file('image');

        // if ($request->has('image')) {
        //     $imageName = Helpers::update('vendor/', $vendor->image, 'png', $request->file('image'));
        // } else {
        //     $imageName = $vendor->image;
        // }

        $old_pass = bcrypt($request['old_password']);
        $new_pass = bcrypt($request['new_password']);

        // $vendor->f_name = $request->f_name;
        // $vendor->l_name = $request->l_name;
        // $vendor->phone = $request->phone;
        // $vendor->image = $imageName;
        // $vendor->password = $pass;
        // $vendor->updated_at = now();
        // $vendor->save();

        $get_vendor = Vendor::where(['email' => $request['email'], 'password' => $old_pass])->first();

        // print_r($get_vendor);die;

        // if (!empty($get_vendor)) {
        if ($request['new_password'] == $request['confirm_password']) {
            Vendor::where(['email' => $request['email']])->update([
                'password' => $new_pass
            ]);
            return response()->json(['state' => 0, 'message' => 'Password updated successfully'], 200);
        } else {
            return response()->json(['state' => 1, 'message' => 'New and confirm password did not match!'], 200);
        }
        // } else {
        //     return response()->json(['state' => 1, 'message' => 'Old password did not match!'], 200);
        // }
    }

    public function get_current_orders(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'restaurant_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }
        $vendor = $request['vendor'];

        $orders = Order::where('restaurant_id', $request['restaurant_id'])
            // ->where('order_status', 'pending')
            ->whereIn('order_status', ['pending', 'accepted', 'accepted_by_delivery_agent', 'confirmed', 'rejected', 'processing'])
            ->whereDate('created_at', date('Y-m-d'))
            ->Notpos()
            ->orderBy('schedule_at', 'desc')
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
                    'cart_details' => $cartDetails
                );
            }
            return response()->json(['state' => 0, 'message' => 'found', 'respData' => (array)$orders_f], 200);
        } else {
            return response()->json(['state' => 0, 'message' => 'not found', 'respData' => []], 200);
        }
    }

    public function get_completed_orders(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'restaurant_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }
        $vendor = $request['vendor'];

        $orders = Order::where('restaurant_id', $request['restaurant_id'])
            ->where('order_status', 'handover')
            // ->whereIn('order_status', ['handover', 'picked_up'])
            ->Notpos()
            ->orderBy('schedule_at', 'desc')
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

                $dm = DeliveryMan::where(['id' => $value->delivery_man_id])->get();

                if (isset($dm) && isset($dm[0])) {
                    $dm[0]->image = url('storage/app/public/delivery-man/' . $dm[0]->image);
                } else {
                    $dm = [];
                }

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

    public function get_current_orders_old(Request $request)
    {
        $vendor = $request['vendor'];

        $orders = Order::whereHas('restaurant.vendor', function ($query) use ($vendor) {
            $query->where('id', $vendor->id);
        })
            ->with('customer')

            ->where(function ($query) {
                if (config('order_confirmation_model') == 'restaurant') {
                    $query->whereIn('order_status', ['accepted', 'pending', 'confirmed', 'processing', 'handover', 'picked_up']);
                } else {
                    $query->whereIn('order_status', ['confirmed', 'processing', 'handover', 'picked_up'])
                        ->orWhere(function ($query) {
                            $query->where('payment_status', 'paid')->where('order_status', 'accepted');
                        })
                        ->orWhere(function ($query) {
                            $query->where('order_status', 'pending')->where('order_type', 'take_away');
                        });
                }
            })
            ->Notpos()
            ->orderBy('schedule_at', 'desc')
            ->get();
        $orders = Helpers::order_data_formatting($orders, true);
        return response()->json($orders, 200);
    }

    public function get_completed_orders_old(Request $request)
    {
        $vendor = $request['vendor'];

        $orders = Order::whereHas('restaurant.vendor', function ($query) use ($vendor) {
            $query->where('id', $vendor->id);
        })
            ->with('customer')
            ->whereIn('order_status', ['refunded', 'delivered'])
            ->Notpos()
            ->latest()
            ->get();
        $orders = Helpers::order_data_formatting($orders, true);
        return response()->json($orders, 200);
    }

    public function update_order_status(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required',
            'status' => 'required|in:accepted,confirmed,rejected,processing,handover'
        ]);

        $validator->sometimes('otp', 'required', function ($request) {
            return (Config::get('order_delivery_verification') == 1 && $request['status'] == 'delivered');
        });

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $vendor = $request['vendor'];

        $order = Order::whereHas('restaurant.vendor', function ($query) use ($vendor) {
            $query->where('id', $vendor->id);
        })
            ->where('id', $request['order_id'])
            ->Notpos()
            ->first();

        if ($request['status'] == "confirmed" && config('order_confirmation_model') == 'deliveryman' && $order->order_type != 'take_away') {
            return response()->json([
                'state' => 1,
                'errors' => [
                    [
                        'code' => 'order-confirmation-model',
                        'message' => trans('messages.order_confirmation_warning')
                    ]
                ]
            ], 200);
        }

        if ($order->picked_up != null) {
            return response()->json([
                'state' => 1,
                'errors' => [
                    ['code' => 'status', 'message' => trans('messages.You_can_not_change_status_after_picked_up_by_delivery_man')]
                ]
            ], 200);
        }

        if ($request['status'] == 'delivered' && $order->order_type != 'take_away') {
            return response()->json([
                'state' => 1,
                'errors' => [
                    ['code' => 'status', 'message' => trans('messages.you_can_not_delivered_delivery_order')]
                ]
            ], 200);
        }
        if (Config::get('order_delivery_verification') == 1 && $request['status'] == 'delivered' && $order->otp != $request['otp']) {
            return response()->json([
                'state' => 1,
                'errors' => [
                    ['code' => 'otp', 'message' => 'Not matched']
                ]
            ], 200);
        }

        if ($request->status == 'delivered' && $order->transaction == null) {
            $ol = OrderLogic::create_transaction($order, 'restaurant', null);
            $order->payment_status = 'paid';
        }

        if ($request->status == 'delivered') {
            $order->details->each(function ($item, $key) {
                if ($item->food) {
                    $item->food->increment('order_count');
                }
            });
            $order->customer->increment('order_count');
        }

        if ($request['status'] == 'rejected') {
            $order->order_status = $request['status'];
            $order['canceled'] = now();
        } else if ($request['status'] == 'processing') {
            if ($order->order_status == 'accepted_by_delivery_agent') {
                $order->order_status = $request['status'];
                $order[$request['status']] = now();
            } else {
                return response()->json([
                    'state' => 1,
                    'errors' => [
                        ['code' => 'not_accepted_by_delivery_agent', 'message' => 'Cannot process order, delivery agent not accepted yet!']
                    ]
                ], 200);
            }
        } else {
            $order->order_status = $request['status'];
            $order[$request['status']] = now();
        }

        $order->save();

        // $fcm_token=$order->customer->cm_firebase_token;

        // $value = Helpers::order_status_update_message($request['status']);

        // try {
        //     if ($value){
        //         $data=[
        //             'title'=>'Order',
        //             'description'=>$value,
        //             'order_id'=>$order['id'],
        //             'image'=>'',
        //             'type'=>'order_status'
        //         ];

        //         Helpers::send_push_notif_to_device($fcm_token,$data);

        //         DB::table('user_notifications')->insert([
        //             'data'=> json_encode($data),
        //             'user_id'=>$order->customer->id,
        //             'created_at'=>now(),
        //             'updated_at'=>now()
        //         ]);
        //     }
        // } catch (\Exception $e) {

        // }
        Helpers::send_order_notification($order);

        return response()->json(['state' => 0, 'message' => 'Status updated'], 200);
    }

    public function get_order_details(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 403);
        }
        $vendor = $request['vendor'];

        $order = Order::whereHas('restaurant.vendor', function ($query) use ($vendor) {
            $query->where('id', $vendor->id);
        })                 
            ->with(['customer', 'details'])
            ->where('id', $request['order_id'])
            ->Notpos()
            ->first();
        $details = $order->details;

        $details = Helpers::order_details_data_formatting($details);
        return response()->json($details, 200);
    }

    public function get_all_orders(Request $request)
    {
        $vendor = $request['vendor'];

        $orders = Order::whereHas('restaurant.vendor', function ($query) use ($vendor) {
            $query->where('id', $vendor->id);
        })
            ->with('customer')
            ->Notpos()
            ->orderBy('schedule_at', 'desc')
            ->get();
        $orders = Helpers::order_data_formatting($orders, true);
        return response()->json($orders, 200);
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

        Restaurant::where(['id' => $request['user_id']])->update([
            'firebase_token' => $request['fcm_token']
        ]);

        // Vendor::where(['id' => $request['user_id']])->update([
        //     'firebase_token' => $request['fcm_token']
        // ]);

        return response()->json(['state' => 0, 'message' => 'successfully updated!'], 200);
    }

    public function get_notifications(Request $request)
    {
        $vendor = $request['vendor'];

        $notifications = Notification::active()->where(function ($q) use ($vendor) {
            $q->whereNull('zone_id')->orWhere('zone_id', $vendor->restaurants[0]->zone_id);
        })->where('tergat', 'restaurant')->where('created_at', '>=', \Carbon\Carbon::today()->subDays(7))->get();

        $notifications->append('data');

        $user_notifications = UserNotification::where('vendor_id', $vendor->id)->where('created_at', '>=', \Carbon\Carbon::today()->subDays(7))->get();

        $notifications =  $notifications->merge($user_notifications);

        try {
            return response()->json($notifications, 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }

    public function get_basic_campaigns(Request $request)
    {
        $vendor = $request['vendor'];
        $campaigns = Campaign::with('restaurants')->latest()->get();
        $data = [];
        $restaurant_id = $vendor->restaurants[0]->id;
        foreach ($campaigns as $item) {
            $variations = [];
            $restaurant_ids = count($item->restaurants) ? $item->restaurants->pluck('id')->toArray() : [];
            if ($item->start_date) {
                $item['available_date_starts'] = $item->start_date->format('Y-m-d');
                unset($item['start_date']);
            }
            if ($item->end_date) {
                $item['available_date_ends'] = $item->end_date->format('Y-m-d');
                unset($item['end_date']);
            }
            $item['is_joined'] = in_array($restaurant_id, $restaurant_ids) ? true : false;
            unset($item['restaurants']);
            array_push($data, $item);
        }
        // $data = CampaignLogic::get_basic_campaigns($vendor->restaurants[0]->id, $request['limite'], $request['offset']);
        return response()->json($data, 200);
    }

    public function remove_restaurant(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'campaign_id' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }
        $campaign = Campaign::where('status', 1)->find($request->campaign_id);
        if (!$campaign) {
            return response()->json([
                'errors' => [
                    ['code' => 'campaign', 'message' => 'Campaign not found or upavailable!']
                ]
            ]);
        }
        $restaurant = $request['vendor']->restaurants[0];
        $campaign->restaurants()->detach($restaurant);
        $campaign->save();
        return response()->json(['message' => trans('messages.you_are_successfully_removed_from_the_campaign')], 200);
    }
    public function addrestaurant(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'campaign_id' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }
        $campaign = Campaign::where('status', 1)->find($request->campaign_id);
        if (!$campaign) {
            return response()->json([
                'errors' => [
                    ['code' => 'campaign', 'message' => 'Campaign not found or upavailable!']
                ]
            ]);
        }
        $restaurant = $request['vendor']->restaurants[0];
        $campaign->restaurants()->attach($restaurant);
        $campaign->save();
        return response()->json(['message' => trans('messages.you_are_successfully_joined_to_the_campaign')], 200);
    }

    public function get_products(Request $request)
    {
        $limit = $request->limit ? $request->limit : 25;
        $offset = $request->offset ? $request->offset : 1;
        $paginator = Food::where('restaurant_id', $request['vendor']->restaurants[0]->id)->latest()->paginate($limit, ['*'], 'page', $offset);
        $data = [
            'total_size' => $paginator->total(),
            'limit' => $limit,
            'offset' => $offset,
            'products' => Helpers::product_data_formatting($paginator->items(), true)
        ];

        return response()->json($data, 200);
    }

    public function update_bank_info(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'bank_name' => 'required',
            'branch' => 'required',
            'holder_name' => 'required',
            'account_no' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $bank = $request['vendor'];
        $bank->bank_name = $request->bank_name;
        $bank->branch = $request->branch;
        $bank->holder_name = $request->holder_name;
        $bank->account_no = $request->account_no;
        $bank->save();

        return response()->json(['message' => trans('messages.bank_info_updated_successfully'), 200]);
    }

    public function withdraw_list(Request $request)
    {
        // $limit=$request->limit?$request->limit:25;
        // $offset=$request->offset?$request->offset:1;
        $withdraw_req = WithdrawRequest::where('vendor_id', $request['vendor']->id)->latest()->get();
        // ->paginate($limit, ['*'], 'page', $offset);
        $temp = [];
        $status = [
            0 => 'Pending',
            1 => 'Approved',
            2 => 'Denied'
        ];
        foreach ($withdraw_req as $item) {
            $item['status'] = $status[$item->approved];
            $item['requested_at'] = $item->created_at->format('Y-m-d H:i:s');
            $item['bank_name'] = $request['vendor']->bank_name;
            unset($item['created_at']);
            unset($item['approved']);
            $temp[] = $item;
        }
        // $data = [
        //     'total_size' => $withdraw_req->total(),
        //     'limit' => $limit,
        //     'offset' => $offset,
        //     'withdraw_requests' => $temp
        // ];
        return response()->json($temp, 200);
    }

    public function request_withdraw(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'amount' => 'required|numeric|min:0.01'
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $w = $request['vendor']->wallet;
        if ($w->balance >= $request['amount']) {
            $data = [
                'vendor_id' => $w->vendor_id,
                'amount' => $request['amount'],
                'transaction_note' => null,
                'approved' => 0,
                'created_at' => now(),
                'updated_at' => now()
            ];
            try {
                DB::table('withdraw_requests')->insert($data);
                $w->increment('pending_withdraw', $request['amount']);
                return response()->json(['message' => trans('messages.withdraw_request_placed_successfully')], 200);
            } catch (\Exception $e) {
                return response()->json($e);
            }
        }
        return response()->json([
            'errors' => [
                ['code' => 'amount', 'message' => trans('messages.insufficient_balance')]
            ]
        ], 200);
    }


    public function get_dashboard(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'restaurant_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        //all
        $count_orders_all = Order::where('restaurant_id', $request['restaurant_id'])
            ->Notpos()
            ->orderBy('schedule_at', 'desc')
            ->count();

        $sum_orders_all = Order::where('restaurant_id', $request['restaurant_id'])
            ->Notpos()
            ->orderBy('schedule_at', 'desc')
            ->sum('order_amount');

        $cancelled_orders_all = Order::where('restaurant_id', $request['restaurant_id'])
            // ->where('order_status', 'canceled')
            ->whereIn('order_status', ['canceled', 'rejected'])
            ->Notpos()
            ->orderBy('schedule_at', 'desc')
            ->count();

        //today
        $count_orders_today = Order::where('restaurant_id', $request['restaurant_id'])
            ->whereDate('created_at', date('Y-m-d'))
            ->Notpos()
            ->orderBy('schedule_at', 'desc')
            ->count();

        $sum_orders_today = Order::where('restaurant_id', $request['restaurant_id'])
            ->whereDate('created_at', date('Y-m-d'))
            ->Notpos()
            ->orderBy('schedule_at', 'desc')
            ->sum('order_amount');


        $cancelled_orders_today = Order::where('restaurant_id', $request['restaurant_id'])
            ->whereDate('created_at', date('Y-m-d'))
            // ->where('order_status', 'canceled')
            ->whereIn('order_status', ['canceled', 'rejected'])
            ->Notpos()
            ->orderBy('schedule_at', 'desc')
            ->count();

        // print_r($count_orders_all);die;

        // $details = Helpers::order_details_data_formatting($details);
        $rData = array(
            'total_earnings' => (string)$sum_orders_all,
            'total_orders' => (string)$count_orders_all,
            'total_cancelled_orders' => (string)$cancelled_orders_all,
            'todays_total_orders' => (string)$count_orders_today,
            'todays_total_earnings' => (string)$sum_orders_today,
            'todays_cancelled_orders' => (string)$cancelled_orders_today
        );
        return response()->json(['state' => 0, 'respData' => $rData], 200);
    }
}
