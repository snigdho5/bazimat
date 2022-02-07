<?php

namespace App\Http\Controllers\Api\V1;

use App\CentralLogics\Helpers;
use App\CentralLogics\RestaurantLogic;
use App\Http\Controllers\Controller;
use App\Models\Restaurant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Review;
use DB;

class RestaurantController extends Controller
{

    public function get_searched_restaurantscat(Request $request)
    {
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => 'Zone id is required!']);
            return response()->json([
                'state' => 1,
                'errors' => $errors
            ], 200);
        }
        $validator = Validator::make($request->all(), [
            'catid' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }
        /*->where('restaurants.zone_id', $zone_id)*/

        $zone_id = $request->header('zoneId');

        $product =   DB::table('food')
            ->where('category_id', $request['catid'])
            ->first();

        if (!empty($product)) {
            $paginator = Restaurant::selectRaw('restaurants.*')->distinct()

                /* $paginator = Restaurant::select(DB::raw('count(food.category_id) as items'))->distinct()*/
                ->leftJoin("food", "restaurants.id", "=", "food.restaurant_id")->where([
                    ['restaurants.zone_id', '=', $zone_id],
                    ['food.category_id', '=', $request['catid']],
                    ['restaurants.status', '=', 1]
                ])->get();
            $restaurants_ = Helpers::restaurant_data_formatting($paginator, true);

            if (!empty($restaurants_)) {
                foreach ($restaurants_ as $key => $value) {
                    $restaurants_f['restaurants'][] = array(
                        'id' => $value->id,
                        'name' => $value->name,
                        'phone' => $value->phone,
                        'email' => $value->email,
                        'logo' => $value->logo,
                        'latitude' => $value->latitude,
                        'longitude' => $value->longitude,
                        'address' => $value->address,
                        'footer_text' => $value->footer_text,
                        'minimum_order' => $value->minimum_order,
                        'comission' => $value->comission,
                        'schedule_order' => $value->schedule_order,
                        'status' => $value->status,
                        'vendor_id' => $value->vendor_id,
                        'created_at' => $value->created_at,
                        'updated_at' => $value->updated_at,
                        'free_delivery' => $value->free_delivery,
                        'cover_photo' => $value->cover_photo,
                        'delivery' => $value->delivery,
                        'take_away' => $value->take_away,
                        'food_section' => $value->food_section,
                        'tax' => $value->tax,
                        'zone_id' => $value->zone_id,
                        'reviews_section' => $value->reviews_section,
                        'active' => $value->active,
                        'off_day' => $value->off_day,
                        'self_delivery_system' => $value->self_delivery_system,
                        'pos_system' => $value->pos_system,
                        'description' => $value->description,
                        'offerprice' => $value->offerprice,
                        'discount' => $value->discount,
                        'offertext' => $value->offertext,
                        'open' => $value->open,
                        'orders_count' => ($value->orders_count != '') ? $value->orders_count : '',
                        'available_time_starts' => $value->available_time_starts,
                        'available_time_ends' => $value->available_time_ends,
                        'avg_rating' => number_format((float)$value->avg_rating, 2, '.', ''),
                        'rating_count' => ($value->rating_count != '') ? $value->rating_count : '',
                        'gst_status' => $value->gst_status,
                        'gst_code' => $value->gst_code
                    );
                }
            }


            return response()->json([
                'state' => 0,
                'errors' => $restaurants_f,
                'coverimgpath' => url('') . "/storage/app/public/restaurant/cover/",
                'logoimgpath' => url('') . "/storage/app/public/restaurant/"
            ], 200);
        } else {
            return response()->json(['state' => 1, 'errors' => 'No restaurants have any foods for this category!'], 200);
        }
    }


    public function get_restaurants(Request $request, $filter_data = "all")
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
        $restaurants = RestaurantLogic::get_restaurants($request['limit'], $request['offset'], $zone_id, $filter_data);
        $restaurants_ = Helpers::restaurant_data_formatting($restaurants['restaurants'], true);

        foreach ($restaurants_ as $key => $value) {
            $restaurants_f['restaurants'][] = array(
                'id' => $value->id,
                'name' => $value->name,
                'phone' => $value->phone,
                'email' => $value->email,
                'logo' => $value->logo,
                'latitude' => $value->latitude,
                'longitude' => $value->longitude,
                'address' => $value->address,
                'footer_text' => ($value->footer_text != '') ? $value->footer_text : '',
                'minimum_order' => $value->minimum_order,
                'comission' => $value->comission,
                'schedule_order' => $value->schedule_order,
                'status' => $value->status,
                'vendor_id' => $value->vendor_id,
                'created_at' => $value->created_at,
                'updated_at' => $value->updated_at,
                'free_delivery' => $value->free_delivery,
                'cover_photo' => $value->cover_photo,
                'delivery' => $value->delivery,
                'take_away' => $value->take_away,
                'food_section' => $value->food_section,
                'tax' => $value->tax,
                'zone_id' => $value->zone_id,
                'reviews_section' => $value->reviews_section,
                'active' => $value->active,
                'off_day' => $value->off_day,
                'self_delivery_system' => $value->self_delivery_system,
                'pos_system' => $value->pos_system,
                'description' => $value->description,
                'offerprice' => $value->offerprice,
                'discount' => $value->discount,
                'offertext' => $value->offertext,
                'open' => $value->open,
                'orders_count' => ($value->orders_count != '') ? $value->orders_count : '',
                'available_time_starts' => $value->available_time_starts,
                'available_time_ends' => $value->available_time_ends,
                'avg_rating' => number_format((float)$value->avg_rating, 2, '.', ''),
                'rating_count' => ($value->rating_count != '') ? $value->rating_count : '',
                'gst_status' => $value->gst_status,
                'gst_code' => $value->gst_code
            );
        }

        $errors = [];
        array_push($errors, ['code' => 'zoneId', 'message' => 'Zone id is required!']);
        return response()->json([
            'state' => 0,
            'errors' => $restaurants_f,
            'coverimgpath' => url('') . "/storage/app/public/restaurant/cover/",
            'logoimgpath' => url('') . "/storage/app/public/restaurant/"
        ], 200);
    }

    public function get_latest_restaurants(Request $request, $filter_data = "all")
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
        $restaurants = RestaurantLogic::get_latest_restaurants($request['limit'], $request['offset'], $zone_id, $filter_data);
        $restaurants['restaurants'] = Helpers::restaurant_data_formatting($restaurants['restaurants'], true);

        return response()->json([
            'state' => 0,
            'errors' => $restaurants['restaurants'],
            'coverimgpath' => url('') . "/storage/app/public/restaurant/cover/",
            'logoimgpath' => url('') . "/storage/app/public/restaurant/"
        ], 200);
    }

    public function get_popular_restaurants(Request $request)
    {
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => 'Zone id is required!']);
            return response()->json([
                'state' => 1,
                'errors' => $errors,

            ], 200);
        }
        $zone_id = $request->header('zoneId');
        $restaurants = RestaurantLogic::get_popular_restaurants($request['limit'], $request['offset'], $zone_id);
        $restaurants_ = Helpers::restaurant_data_formatting($restaurants['restaurants'], true);

        // echo $restaurants['restaurants']->discount;
        // print_r($restaurants_);die;

        foreach ($restaurants_ as $key => $value) {
            $restaurants_f[] = array(
                'id' => $value->id,
                'name' => $value->name,
                'phone' => $value->phone,
                'email' => $value->email,
                'logo' => $value->logo,
                'latitude' => $value->latitude,
                'longitude' => $value->longitude,
                'address' => $value->address,
                'footer_text' => $value->footer_text,
                'minimum_order' => $value->minimum_order,
                'comission' => $value->comission,
                'schedule_order' => $value->schedule_order,
                'status' => $value->status,
                'vendor_id' => $value->vendor_id,
                'created_at' => $value->created_at,
                'updated_at' => $value->updated_at,
                'free_delivery' => $value->free_delivery,
                'cover_photo' => $value->cover_photo,
                'delivery' => $value->delivery,
                'take_away' => $value->take_away,
                'food_section' => $value->food_section,
                'tax' => $value->tax,
                'zone_id' => $value->zone_id,
                'reviews_section' => $value->reviews_section,
                'active' => $value->active,
                'off_day' => $value->off_day,
                'self_delivery_system' => $value->self_delivery_system,
                'pos_system' => $value->pos_system,
                'description' => $value->description,
                'offerprice' => $value->offerprice,
                'discount' => $value->discount,
                'offertext' => $value->offertext,
                'open' => $value->open,
                'orders_count' => $value->orders_count,
                'available_time_starts' => $value->available_time_starts,
                'available_time_ends' => $value->available_time_ends,
                'avg_rating' => number_format((float)$value->avg_rating, 2, '.', ''),
                'rating_count' => ($value->rating_count != '') ? $value->rating_count : '',
                'gst_status' => $value->gst_status,
                'gst_code' => $value->gst_code
            );
        }

        // print_r($restaurants_);die;

        return response()->json([
            'state' => 0,
            'errors' => $restaurants_f,
            'coverimgpath' => url('') . "/storage/app/public/restaurant/cover/",
            'logoimgpath' => url('') . "/storage/app/public/restaurant/"
        ], 200);
    }

    public function get_details($id)
    {
        $restaurant = RestaurantLogic::get_restaurant_details($id);
        if ($restaurant) {
            $restaurant = Helpers::restaurant_data_formatting($restaurant);
        }
        return response()->json([
            'state' => 0,
            'errors' =>  $restaurant,
            'coverimgpath' => url('') . "/storage/app/public/restaurant/cover/",
            'logoimgpath' => url('') . "/storage/app/public/restaurant/"
        ], 200);
    }

    public function get_searched_restaurants(Request $request)
    {
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => 'Zone id is required!']);
            return response()->json([
                'state' => 1,
                'errors' => $errors
            ], 200);
        }
        $validator = Validator::make($request->all(), [
            'name' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $zone_id = $request->header('zoneId');
        $restaurants = RestaurantLogic::search_restaurants($request['name'], $zone_id, $request['limit'], $request['offset']);
        $restaurants['restaurants'] = Helpers::restaurant_data_formatting($restaurants['restaurants'], true);
        return response()->json([
            'state' => 0,
            'errors' => $restaurants,
            'coverimgpath' => url('') . "/storage/app/public/restaurant/cover/",
            'logoimgpath' => url('') . "/storage/app/public/restaurant/"
        ], 200);
    }

    public function get_searched_restaurantspro(Request $request)
    {
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => 'Zone id is required!']);
            return response()->json([
                'state' => 1,
                'errors' => $errors
            ], 200);
        }
        $validator = Validator::make($request->all(), [
            'proid' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1, 'errors' => Helpers::error_processor($validator)], 200);
        }

        $zone_id = $request->header('zoneId');
        $paginator = Restaurant::select('restaurants.*')->distinct()
            ->leftJoin("food", "restaurants.id", "=", "food.restaurant_id")->where('restaurants.zone_id', $zone_id)->where('food.id', $request['proid'])->get();
        return response()->json([
            'state' => 0,
            'errors' => $paginator,
            'coverimgpath' => url('') . "/storage/app/public/restaurant/cover/",
            'logoimgpath' => url('') . "/storage/app/public/restaurant/"
        ], 200);
    }

    public function reviews(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'restaurant_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }
        $id = $request['restaurant_id'];


        $reviews = Review::with(['customer', 'food'])
            ->whereHas('food', function ($query) use ($id) {
                return $query->where('restaurant_id', $id);
            })
            ->get();

        $storage = [];
        foreach ($reviews as $item) {
            $item['attachment'] = json_decode($item['attachment']);
            $item['food_name'] = $item->food->name;
            unset($item['food']);
            array_push($storage, $item);
        }

        return response()->json($storage, 200);
    }

    // public function get_product_rating($id)
    // {
    //     try {
    //         $product = Food::find($id);
    //         $overallRating = ProductLogic::get_overall_rating($product->reviews);
    //         return response()->json(floatval($overallRating[0]), 200);
    //     } catch (\Exception $e) {
    //         return response()->json(['errors' => $e], 403);
    //     }
    // }

}
