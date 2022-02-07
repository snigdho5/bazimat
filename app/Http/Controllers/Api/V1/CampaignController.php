<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Campaign;
use App\Models\ItemCampaign;
use Illuminate\Http\Request;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\Validator;

class CampaignController extends Controller
{
    public function get_basic_campaigns(Request $request){
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => 'Zone id is required!']);
            return response()->json([
                'state' =>1,
                'errors' => $errors
            ], 200);
        }
        $zone_id= $request->header('zoneId');
        try {
            $campaigns = Campaign::whereHas('restaurants', function($query)use($zone_id){
                $query->where('zone_id', $zone_id);
            })->running()->active()->get();
            $campaigns=Helpers::basic_campaign_data_formatting($campaigns, true);
            return response()->json([
                'state' =>0,
                'errors' => $campaigns,
                'campaign_image_url'=>url('')."/storage/app/public/campaign/"
            ], 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }
    public function basic_campaign_details(Request $request){
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => 'Zone id is required!']);
            return response()->json([
                'errors' => $errors
            ], 200);
        }
        $zone_id= $request->header('zoneId');

        $validator = Validator::make($request->all(), [
            'basic_campaign_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['state' =>1,'errors' => Helpers::error_processor($validator)], 200);
        }
        try {
            $campaign = Campaign::with(['restaurants'=>function($q)use($zone_id){
                $q->where('zone_id', $zone_id);
            }])->running()->active()->whereId($request->basic_campaign_id)->first();
            $campaign['restaurants'] = Helpers::restaurant_data_formatting($campaign['restaurants'], true);
            return response()->json([
                'state' =>0,
                'errors' => $campaign,
                'campaign_image_url'=>url('')."/storage/app/public/campaign/",
                'restaurant_logo_imge'=>url('')."/storage/app/public/restaurant/",
                'restaurant_cover_imge'=>url('')."/storage/app/public/restaurant/cover/"
                
            ], 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }
    public function get_item_campaigns(Request $request){
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => 'Zone id is required!']);
            return response()->json([
                'state' =>0,
                'errors' => $errors
            ], 200);
        }
        $zone_id= $request->header('zoneId');
        try {
            $campaigns = ItemCampaign::active()->whereHas('restaurant', function($query)use($zone_id){
                $query->where('zone_id', $zone_id);
            })->running()->active()->get();
            $campaigns= Helpers::product_data_formatting($campaigns, true);
            return response()->json($campaigns, 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }
}
