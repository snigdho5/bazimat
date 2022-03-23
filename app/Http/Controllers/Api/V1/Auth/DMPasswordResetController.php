<?php

namespace App\Http\Controllers\Api\V1\Auth;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\DeliveryMan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use App\CentralLogics\SMS_module;

class DMPasswordResetController extends Controller
{
    public function reset_password_request(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone' => 'required',
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
            DB::table('password_resets')->updateOrInsert([
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

    public function verify_token(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10',
            'reset_token' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }
        $user = DeliveryMan::where('phone', $request->phone)->first();
        if (!isset($user)) {
            $errors = [];
            array_push($errors, ['code' => 'not-found', 'message' => 'Phone number not found!']);
            return response()->json([
                'state' => 1,
                'errors' => $errors
            ], 200);
        }
        if (env('APP_MODE') == 'demo') {
            if ($request['reset_token'] == '1234') {
                return response()->json(['state' => 0, 'message' => "Token found, you can proceed"], 200);
            }
            $errors = [];
            array_push($errors, ['code' => 'reset_token', 'message' => 'Invalid token.']);
            return response()->json([
                'state' => 1,
                'errors' => $errors
            ], 200);
        }
        $data = DB::table('password_resets')->where(['token' => $request['reset_token'], 'email' => $user->email])->first();
        if (isset($data)) {
            return response()->json(['state' => 0, 'message' => "Token found, you can proceed"], 200);
        }
        $errors = [];
        array_push($errors, ['code' => 'reset_token', 'message' => 'Invalid token.']);
        return response()->json([
            'state' => 1,
            'errors' => $errors
        ], 200);
    }

    public function reset_password_submit(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10',
            'reset_token' => 'required',
            'password' => 'required|min:6',
            'confirm_password' => 'required|same:password',
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1,'errors' => Helpers::error_processor($validator)], 200);
        }
        if (env('APP_MODE') == 'demo') {
            if ($request['reset_token'] == "1234") {
                DB::table('delivery_men')->where(['phone' => $request['phone']])->update([
                    'password' => bcrypt($request['confirm_password'])
                ]);
                return response()->json(['state' => 0,'message' => 'Password changed successfully.'], 200);
            }
            $errors = [];
            array_push($errors, ['code' => 'invalid', 'message' => 'Invalid token.']);
            return response()->json(['state' => 1,'errors' => $errors], 200);
        }
        $data = DB::table('password_resets')->where(['token' => $request['reset_token']])->first();
        if (isset($data)) {
            if ($request['password'] == $request['confirm_password']) {
                DB::table('delivery_men')->where(['email' => $data->email])->update([
                    'password' => bcrypt($request['confirm_password'])
                ]);
                DB::table('password_resets')->where(['token' => $request['reset_token']])->delete();
                return response()->json(['state' => 0,'message' => 'Password changed successfully.'], 200);
            }
            $errors = [];
            array_push($errors, ['code' => 'mismatch', 'message' => 'Password did,t match!']);
            return response()->json(['state' => 1,'errors' => $errors], 200);
        }

        $errors = [];
        array_push($errors, ['code' => 'invalid', 'message' => 'Invalid token.']);
        return response()->json(['state' => 1,'errors' => $errors], 200);
    }
}
