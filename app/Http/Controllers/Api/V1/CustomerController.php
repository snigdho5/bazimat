<?php

namespace App\Http\Controllers\Api\V1;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\CustomerAddress;
use App\Models\Order;
use App\Models\Food;
use App\Models\OrderDetail;
use App\Models\User;

use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use App\Models\Zone;
use Grimzy\LaravelMysqlSpatial\Types\Point;

class CustomerController extends Controller
{

    public function agestatus(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'userID' => 'required',


        ]);
        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }


        $address = ['agestatus' => 1];
        $id = $request->userID;

        DB::table('users')->where('id', $id)->update($address);
        return response()->json(['state' => 0, 'message' => 'Age is verified'], 200);
    }


    public function address_list(Request $request)
    {
        /* DB::table('customer_addresses')->where('id',$id)->update($address);
        return response()->json(['state' =>1,'message' => trans('messages.updated_successfully'),'zone_id'=>$zone->id], 200);*/
        $add = CustomerAddress::where('user_id', $request->user()->id)->latest()->get();
        return response()->json(['state' => 0, 'error' => $add], 200);
    }
    public function age_detail(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'customerID' => 'required',


        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }
        $user = DB::table('ageverification')->where('cid', $request->customerID)->first();
        $s = DB::table('users')
            ->select('agestatus')
            ->where('id', $request->customerID)
            ->get();
        // print $s[0]->agestatus;
        //print_r($s);

        return response()->json(['state' => 0, 'errors' => $user, 'imagepath' => url('') . "/storage/app/public/age/", 'agestatus' => $s[0]->agestatus], 200);
    }

    public function add_new_address(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'contact_person_name' => 'required',
            'address_type' => 'required',
            'contact_person_number' => 'required',
            'address' => 'required',
            'latitude' => 'required',
            'longitude' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $point = new Point($request->latitude, $request->longitude);



        $zone = Zone::contains('coordinates', $point)->first();
        if (!$zone) {
            $errors = [];
            array_push($errors, ['code' => 'coordinates', 'message' => trans('messages.service_not_available_in_this_area')]);
            return response()->json([
                'state' => 1,
                'errors' => $errors
            ], 200);
        }

        // print  $zone->id;

        $address = [
            'user_id' => $request->user_id,
            'contact_person_name' => $request->contact_person_name,
            'contact_person_number' => $request->contact_person_number,
            'address_type' => $request->address_type,
            'address' => $request->address,
            'longitude' => $request->longitude,
            'latitude' => $request->latitude,
            'zone_id' => $zone->id,
            'created_at' => now(),
            'updated_at' => now()
        ];
        DB::table('customer_addresses')->insert($address);
        return response()->json(['message' => trans('messages.successfully_added'), 'zone_id' => $zone->id, 'state' => 0], 200);
    }


    public function serviceable_address(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'latitude' => 'required',
            'longitude' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $point = new Point($request->latitude, $request->longitude);

        $zone = Zone::contains('coordinates', $point)->first();
        if (!$zone) {
            $errors = [];
            array_push($errors, ['code' => 'coordinates', 'message' => trans('messages.service_not_available_in_this_area')]);
            return response()->json([
                'state' => 1,
                'errors' => $errors
            ], 200);
        }
        // print  $zone->id;

        return response()->json(['message' => 'Service is available', 'zone_id' => $zone->id, 'state' => 0], 200);
    }

    public function ageverification(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cid' => 'required',
            'fontimg' => 'required',
            'backimg' => 'required',
            'db' => 'required',

        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }


        $url = $request->fontimg;
        $url1 = $request->backimg;
        /* $name = rand(1,9999).time().basename($url);
			$name1 = rand(1,9999).time().basename($url1);
			 
			$fontpath = "storage/app/public/age/".$name;
			$backpath = "storage/app/public/age/".$name1;*/
        /*$f1=fopen($fontpath,"w");
			$b1=fopen($backpath,"w");*/
        $dob = $request->db;

        /*	$ch = curl_init($url);
            $fp = fopen($fontpath, 'wb');
            curl_setopt($ch, CURLOPT_FILE, $fp);
            curl_setopt($ch, CURLOPT_HEADER, 0);
            curl_exec($ch);
            curl_close($ch);
            fclose($fp);
            
            $ch1 = curl_init($url1);
            $fp1 = fopen($backpath, 'wb');
            curl_setopt($ch1, CURLOPT_FILE, $fp1);
            curl_setopt($ch1, CURLOPT_HEADER, 0);
            curl_exec($ch1);
            curl_close($ch1);
            fclose($fp1);*/


        // $url = 'https://tinyjpg.com/images/social/website.jpg';
        $ch = curl_init($url);
        $dir = "storage/app/public/age/";
        $file_name =  rand(1, 9999) . time() . basename($url);
        // Save file into file location
        $save_file_loc = $dir . $file_name;
        // Open file
        $fp = fopen($save_file_loc, 'wb');
        // It set an option for a cURL transfer
        curl_setopt($ch, CURLOPT_FILE, $fp);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        // Perform a cURL session
        curl_exec($ch);
        // Closes a cURL session and frees all resources
        curl_close($ch);
        // Close file
        fclose($fp);
        $ch = curl_init($url1);
        $dir = "storage/app/public/age/";
        $file_name1 = rand(1, 9999) . time() . basename($url1);
        // Save file into file location
        $save_file_loc = $dir . $file_name1;
        // Open file
        $fp = fopen($save_file_loc, 'wb');
        // It set an option for a cURL transfer
        curl_setopt($ch, CURLOPT_FILE, $fp);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        // Perform a cURL session
        curl_exec($ch);
        // Closes a cURL session and frees all resources
        curl_close($ch);
        // Close file
        fclose($fp);







        /* file_put_contents($f1,file_get_contents($url));
			file_put_contents($b1,file_get_contents($url1));*/
        $values = array('cid' => $request->cid, 'fontimg' => $file_name, 'backimg' => $file_name1, 'db' => $dob, 'created_at' => now(), 'updated_at' => now());
        DB::table('ageverification')->insert($values);
        $pending = ['agestatus' => 2];
        User::where(['id' => $request->cid])->update($pending);

        /*$user = DB::table('ageverification')->first();*/
        /*	DB::table('ageverification')->insert([
	    ['cid' =>$request->cid, 'fontimg' =>$name,'backimg' =>$name1, 'db' =>$dob, 'created_at' =>now(), 'updated_at' =>now()]
	]);*/

        return response()->json(['state' => 0, 'message' => "Added"], 200);
    }

    public function update_address(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'contact_person_name' => 'required',
            'address_type' => 'required',
            'contact_person_number' => 'required',
            'address' => 'required',
            'longitude' => 'required',
            'latitude' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }
        $point = new Point($request->latitude, $request->latitude);
        $zone = Zone::contains('coordinates', $point)->first();
        if (!$zone) {
            $errors = [];
            array_push($errors, ['code' => 'coordinates', 'message' => trans('messages.out_of_coverage')]);
            return response()->json([
                'state' => 1,
                'errors' => $errors
            ], 200);
        }
        $address = [
            'user_id' => $request->user()->id,
            'contact_person_name' => $request->contact_person_name,
            'contact_person_number' => $request->contact_person_number,
            'address_type' => $request->address_type,
            'address' => $request->address,
            'longitude' => $request->longitude,
            'latitude' => $request->latitude,
            'zone_id' => $zone->id,
            'created_at' => now(),
            'updated_at' => now()
        ];
        DB::table('customer_addresses')->where('id', $id)->update($address);
        return response()->json(['state' => 1, 'message' => trans('messages.updated_successfully'), 'zone_id' => $zone->id], 200);
    }

    public function delete_address(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'address_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        if (DB::table('customer_addresses')->where(['id' => $request['address_id'], 'user_id' => $request->user()->id])->first()) {
            DB::table('customer_addresses')->where(['id' => $request['address_id'], 'user_id' => $request->user()->id])->delete();
            return response()->json(['state' => 0, 'message' => trans('messages.successfully_removed')], 200);
        }
        return response()->json(['state' => 1, 'message' => trans('messages.not_found')], 200);
    }

    public function get_order_list(Request $request)
    {
        $orders = Order::where(['user_id' => $request->user()->id])->get();
        return response()->json($orders, 200);
    }

    public function get_order_details(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $details = OrderDetail::where(['order_id' => $request['order_id']])->get();
        foreach ($details as $det) {
            $det['product_details'] = Helpers::product_data_formatting(json_decode($det['product_details'], true));
        }

        return response()->json(['state' => 0, 'error' => $details], 200);
    }

    public function info(Request $request)
    {
        $data = $request->user();
        $data['order_count'] = (int)$request->user()->orders->count();
        $data['member_since_days'] = (int)$request->user()->created_at->diffInDays();
        unset($data['orders']);

        return response()->json(['state' => 0, 'error' => $data], 200);
    }

    public function update_profile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'f_name' => 'required',
            'l_name' => 'required',
            'email' => 'required|unique:users,email,' . $request->user()->id,
        ], [
            'f_name.required' => 'First name is required!',
            'l_name.required' => 'Last name is required!',
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $image = $request->file('image');

        if ($request->has('image')) {
            $imageName = Helpers::update('profile/', $request->user()->image, 'png', $request->file('image'));
        } else {
            $imageName = $request->user()->image;
        }

        if ($request['password'] != null && strlen($request['password']) > 5) {
            $pass = bcrypt($request['password']);
        } else {
            $pass = $request->user()->password;
        }

        $userDetails = [
            'f_name' => $request->f_name,
            'l_name' => $request->l_name,
            'email' => $request->email,
            'image' => $imageName,
            'password' => $pass,
            'updated_at' => now()
        ];

        User::where(['id' => $request->user()->id])->update($userDetails);

        return response()->json(['state' => 0, 'message' => trans('messages.successfully_updated')], 200);
    }
    public function update_interest(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'interest' => 'required|array',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 200);
        }

        $userDetails = [
            'interest' => json_encode($request->interest),
        ];

        User::where(['id' => $request->user()->id])->update($userDetails);

        return response()->json(['message' => trans('messages.interest_updated_successfully')], 200);
    }

    public function update_cm_firebase_token(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'fcm_token' => 'required',
            'user_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        DB::table('users')->where('id', $request['user_id'])->update([
            'cm_firebase_token' => $request['fcm_token']
        ]);

        return response()->json(['state' => 0, 'message' => trans('messages.updated_successfully')], 200);
    }

    public function get_suggested_food(Request $request)
    {
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => 'Zone id is required!']);
            return response()->json([
                'state' => 1,
                'errors' => $errors
            ], 200);
        }


        $zone_id = $request->header('zoneId');

        $interest = $request->user()->interest;
        $interest = isset($interest) ? json_decode($interest) : null;
        // return response()->json($interest, 200);

        $products =  Food::active()->whereHas('restaurant', function ($q) use ($zone_id) {
            $q->where('zone_id', $zone_id);
        })
            ->when(isset($interest), function ($q) use ($interest) {
                return $q->whereIn('category_id', $interest);
            })
            ->when($interest == null, function ($q) {
                return $q->popular();
            })->limit(5)->get();
        $products = Helpers::product_data_formatting($products, true);
        return response()->json($products, 200);
    }
}
