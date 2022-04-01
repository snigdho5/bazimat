<?php

namespace App\Http\Controllers\Api\V1\Auth;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\DeliveryMan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use App\CentralLogics\SMS_module;

class DeliveryManLoginController extends Controller
{
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone' => 'required',
            'password' => 'required|min:6'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'state' => 1, 'errors' => Helpers::error_processor($validator)
            ], 200);
        }

        $data = [
            'phone' => $request->phone,
            'password' => $request->password
        ];


        if (auth('delivery_men')->attempt($data)) {
            $token = Str::random(120);

            if (!auth('delivery_men')->user()->status) {
                $errors = [];
                array_push($errors, ['code' => 'auth-003', 'message' => trans('messages.your_account_has_been_suspended')]);
                return response()->json([
                    'state' => 1,
                    'errors' => $errors
                ], 200);
            }
            $delivery_man =  DeliveryMan::where(['phone' => $request['phone']])->first();
            $delivery_man->auth_token = $token;
            $delivery_man->save();
            return response()->json([
                'state' => 0, 'token' => $token, 'zone_wise_topic' => $delivery_man->type == 'zone_wise' ? $delivery_man->zone->deliveryman_wise_topic : 'restaurant_dm_' . $delivery_man->restaurant_id
            ], 200);
        } else {
            $errors = [];
            array_push($errors, ['code' => 'auth-001', 'message' => 'Unauthorized.']);
            return response()->json([
                'state' => 1,
                'errors' => $errors
            ], 200);
        }
    }

    public function otp_login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone' => 'required|max:10',
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }


        $deliveryman = DeliveryMan::Where(['phone' => $request['phone']])->first();

        if (isset($deliveryman)) {
            if (env('APP_MODE') == 'demo') {
                return response()->json(['state' => 0, 'message' => trans('messages.otp_sent_successfull')], 200);
            }
            // $token = rand(1000, 9999);
            $token = 1234;
            DB::table('login_otp')->updateOrInsert([
                'phone' => $request['phone'],
                'email' => $deliveryman['email'],
                'token' => $token,
                'created_at' => now(),
            ]);
            $response = SMS_module::send($request['phone'], $token);
            if ($response == 'success') {
                return response()->json(['state' => 0, 'message' => trans('messages.otp_sent_successfull')], 200);
            } else {
                $errors = [];
                array_push($errors, ['code' => 'otp', 'message' => trans('messages.failed_to_send_sms')]);
                return response()->json([
                    'state' => 1,
                    'errors' => $errors
                ], 200);
            }
        }
        $errors = [];
        array_push($errors, ['code' => 'not-found', 'message' => 'Phone number not found!']);
        return response()->json(['state' => 1, 'errors' => $errors], 200);
    }

    public function verify_otp(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10',
            'entered_otp' => 'required|max:4'
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }
        $user = DeliveryMan::where('phone', $request->phone)->first();
        $user->image = url('storage/app/public/delivery-man/' . $user->image);
        if (!isset($user)) {
            $errors = [];
            array_push($errors, ['code' => 'not-found', 'message' => 'Phone number not found!']);
            return response()->json([
                'state' => 1,
                'errors' => $errors
            ], 200);
        }
        if (env('APP_MODE') == 'demo') {
            if ($request['entered_otp'] == '1234') {
                $token = Str::random(120);

                if (!$user->status) {
                    $errors = [];
                    array_push($errors, ['code' => 'auth-003', 'message' => trans('messages.your_account_has_been_suspended')]);
                    return response()->json([
                        'state' => 1,
                        'errors' => $errors
                    ], 200);
                }
                $delivery_man =  DeliveryMan::where(['phone' => $request['phone']])->first();
                $delivery_man->auth_token = $token;
                $delivery_man->save();
                return response()->json([
                    'state' => 0, 'token' => $token, 'zone_wise_topic' => $delivery_man->type == 'zone_wise' ? $delivery_man->zone->deliveryman_wise_topic : 'restaurant_dm_' . $delivery_man->restaurant_id, 'user_details' => $user
                ], 200);
                // return response()->json(['state' => 0, 'message' => "Token found, you can proceed"], 200);
            }
            $errors = [];
            array_push($errors, ['code' => 'token', 'message' => 'Invalid token.']);
            return response()->json([
                'state' => 1,
                'errors' => $errors
            ], 200);
        }
        $data = DB::table('login_otp')->where(['token' => $request['entered_otp'], 'phone' => $user->phone])->first();
        if (isset($data)) {

            $token = Str::random(120);

            if (!$user->status) {
                $errors = [];
                array_push($errors, ['code' => 'auth-003', 'message' => trans('messages.your_account_has_been_suspended')]);
                return response()->json([
                    'state' => 1,
                    'errors' => $errors
                ], 200);
            }
            $delivery_man =  DeliveryMan::where(['phone' => $request['phone']])->first();
            $delivery_man->auth_token = $token;
            $delivery_man->save();
            return response()->json([
                'state' => 0, 'token' => $token, 'zone_wise_topic' => $delivery_man->type == 'zone_wise' ? $delivery_man->zone->deliveryman_wise_topic : 'restaurant_dm_' . $delivery_man->restaurant_id, 'user_details' => $user
            ], 200);

            // return response()->json(['state' => 0, 'message' => "Token found, you can proceed"], 200);
        }
        $errors = [];
        array_push($errors, ['code' => 'token', 'message' => 'Invalid token.']);
        return response()->json([
            'state' => 1,
            'errors' => $errors
        ], 200);
    }
}
