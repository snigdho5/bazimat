<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\User;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\CentralLogics\Helpers;

class CustomerController extends Controller
{
    public function customer_list()
    {
        $customers = User::with(['orders'])->latest()->paginate(config('default_pagination'));
        return view('admin-views.customer.list', compact('customers'));
    }

    public function status(User $customer, Request $request)
    {
        $customer->status = $request->status;
        $customer->save();

        try
        {
            if($request->status == 0)
            {   $customer->tokens->each(function ($token, $key) {
                    $token->delete();
                });
                if(isset($customer->cm_firebase_token))
                {
                    $data = [
                        'title' => trans('messages.suspended'),
                        'description' => trans('messages.your_account_has_been_blocked'),
                        'order_id' => '',
                        'image' => '',
                        'type'=> 'block'
                    ];
                    Helpers::send_push_notif_to_device($customer->cm_firebase_token, $data);

                    DB::table('user_notifications')->insert([
                        'data'=> json_encode($data),
                        'user_id'=>$customer->id,
                        'created_at'=>now(),
                        'updated_at'=>now()
                    ]);
                }

            }

        }
        catch (\Exception $e) {
            Toastr::warning(trans('messages.push_notification_faild'));
        }

        Toastr::success(trans('messages.customer').trans('messages.status_updated'));
        return back();
    }
    
    public function agesave(User $customer, Request $request)
    {
        $customer->agestatus = $request->agestatus;
        $customer->save();

        /*try
        {
            if($request->agestatus == 0)
            {   $customer->tokens->each(function ($token, $key) {
                    $token->delete();
                });
                if(isset($customer->cm_firebase_token))
                {
                    $data = [
                        'title' => trans('messages.suspended'),
                        'description' => trans('messages.your_account_has_been_blocked'),
                        'order_id' => '',
                        'image' => '',
                        'type'=> 'block'
                    ];
                    Helpers::send_push_notif_to_device($customer->cm_firebase_token, $data);

                    DB::table('user_notifications')->insert([
                        'data'=> json_encode($data),
                        'user_id'=>$customer->id,
                        'created_at'=>now(),
                        'updated_at'=>now()
                    ]);
                }

            }

        }
        catch (\Exception $e) {
            Toastr::warning(trans('messages.push_notification_faild'));
        }*/

        Toastr::success(trans('messages.customer').trans('messages.status_updated'));
        return back();
    }

    

    public function search(Request $request){
        $key = explode(' ', $request['search']);
        $customers=User::where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('f_name', 'like', "%{$value}%")
                    ->orWhere('l_name', 'like', "%{$value}%")
                    ->orWhere('email', 'like', "%{$value}%")
                    ->orWhere('phone', 'like', "%{$value}%");
            }
        })->get();
        return response()->json([
            'view'=>view('admin-views.customer.partials._table',compact('customers'))->render()
        ]);
    }

    public function view($id)
    {
        $customer = User::find($id);
        
        $query = DB::table('ageverification')->select(['*'])->where('cid', $id)->get();
       // $query = DB::table('user')->select(['id','name'])
        $agedetails = $query->toArray();
       
      //  $agedetails=array($userlist[0]->id,$userlist[0]->cid,$userlist[0]->fontimg,$userlist[0]->backimg,$userlist[0]->db);
        
      /*  print"<pre>";
        print_r($userlist);
        exit();*/
        
      
        if (isset($customer)) {
            $orders = Order::latest()->where(['user_id' => $id])->paginate(config('default_pagination'));
            return view('admin-views.customer.customer-view', compact('customer', 'orders','agedetails'));
        }
        Toastr::error(trans('messages.customer_not_found'));
        return back();
    }
}
