<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Notification;
use App\Models\UserNotification;
use Illuminate\Http\Request;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\Validator;

class NotificationController extends Controller
{
    public function get_notifications(Request $request){
        
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => 'Zone id is required!']);
            return response()->json([
                'state' => 1,
                'errors' => $errors
            ], 200);
        }
        $zone_id= $request->header('zoneId');
        try {
            // echo $zone_id;
            $notifications = Notification::active()->where('tergat', 'customer')->where(function($q)use($zone_id){
                $q->whereNull('zone_id')->orWhere('zone_id', $zone_id);
            })->where('created_at', '>=', \Carbon\Carbon::today()->subDays(15))->get();
            $notifications->append('data');

            $user_notifications = UserNotification::where('user_id', $request->user()->id)->where('created_at', '>=', \Carbon\Carbon::today()->subDays(15))->get();
            $notifications =  $notifications->merge($user_notifications);

            // print_r($notifications);die;
            return response()->json($notifications, 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }

    public function get_cm_notifications(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1,'errors' => Helpers::error_processor($validator)], 200);
        }

        try {
            $user_notifications = UserNotification::where('user_id', $request['user_id'])->where('created_at', '>=', \Carbon\Carbon::today()->subDays(15))->get();

            if($user_notifications){
                foreach ($user_notifications as $key => $value) {
                    $usr_notifications[] = array(
                        'id' => $value['id'],
                        'data' => $value['data'],
                        'status' => $value['status'],
                        'user_id' => $value['user_id'],
                        'vendor_id' => ($value['vendor_id'] != '')?$value['vendor_id']:'',
                        'delivery_man_id' => ($value['delivery_man_id'] != '')?$value['delivery_man_id']:'',
                        'created_at' => $value['created_at'],
                        'updated_at' => $value['updated_at']
                    );
                }
            }else{
                $usr_notifications = [];
            }

            // print_r($usr_notifications);die;
            return response()->json(['state' => 0,'message' => 'Found!', 'respData' => $usr_notifications], 200);
        } catch (\Exception $e) {
            return response()->json(['state' => 0,'message' => 'Not found!', 'respData' => []], 200);
        }
    }


}
