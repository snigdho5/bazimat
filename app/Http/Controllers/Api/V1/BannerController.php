<?php

namespace App\Http\Controllers\Api\V1;

use App\Models\Campaign;
use App\CentralLogics\BannerLogic;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class BannerController extends Controller
{
    public function get_banners(Request $request)
    {
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => trans('messages.zone_id_required')]);
            return response()->json([
                'state'=>1,
                'errors' => $errors
            ], 200);
        }
        $zone_id= $request->header('zoneId');
        $banners = BannerLogic::get_banners($zone_id);
        $imagepath = url('')."/storage/app/public/restaurant/cover/";
        $logopath = url('')."/storage/app/public/restaurant/";
        $foodpath= url('')."/storage/app/public/product/";
        $bannerpath = url('')."/storage/app/public/banner/";
        $campaigns = Campaign::whereHas('restaurants', function($query)use($zone_id){
            $query->where('zone_id', $zone_id);
        })->running()->active()->get();
        try {
           // return response()->json(['campaigns'=>$campaigns,'banners'=>$banners,'bannerimgpath'=>$imagepath,'logoimgpath'=>$logopath], 200);
              return response()->json(['state'=>0,'banners'=>$banners,'coverimgpath'=>$imagepath,'logoimgpath'=>$logopath,'foodimgpath'=>$foodpath,'bannerimgpath'=>$bannerpath], 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }
}
