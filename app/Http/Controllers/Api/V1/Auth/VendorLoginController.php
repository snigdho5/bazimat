<?php

namespace App\Http\Controllers\Api\V1\Auth;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\Vendor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class VendorLoginController extends Controller
{
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required',
            'password' => 'required|min:6'
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $data = [
            'email' => $request->email,
            'password' => $request->password
        ];

        if (auth('vendor')->attempt($data)) {
            $token = $this->genarate_token($request['email']);
            $vendor = Vendor::where(['email' => $request['email']])->first();
            if (!$vendor->status) {
                return response()->json([
                    'state' => 1,
                    'errors' => [
                        ['code' => 'auth-002', 'message' => trans('messages.inactive_vendor_warning')]
                    ]
                ], 200);
            }
            $vendor->auth_token = $token;
            $vendor->save();
            return response()->json(['state' => 0,'message' => 'Successfully logged in!.', 'token' => $token, 'zone_wise_topic' => $vendor->restaurants[0]->zone->restaurant_wise_topic], 200);
        } else {
            $errors = [];
            array_push($errors, ['code' => 'auth-001', 'message' => 'Unauthorized.']);
            return response()->json([
                'state' => 1, 
                'errors' => $errors
            ], 200);
        }
    }

    private function genarate_token($email)
    {
        $token = Str::random(120);
        $is_available = Vendor::where('auth_token', $token)->where('email', '!=', $email)->count();
        if ($is_available) {
            $this->genarate_token($email);
        }
        return $token;
    }
}
