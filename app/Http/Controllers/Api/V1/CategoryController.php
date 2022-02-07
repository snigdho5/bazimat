<?php

namespace App\Http\Controllers\Api\V1;
use App\CentralLogics\CategoryLogic;
use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CategoryController extends Controller
{
    public function get_categories()
    {
        try {
            $categorypath = url('')."/storage/app/public/category/";
            $categories = Category::where(['position'=>0,'status'=>1])->orderBy('priority','desc')->get();
            return response()->json(['state' => 0, 'errors' => $categories, 'categoryimgpath'=> $categorypath], 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }

    public function get_childes($id)
    {
        try {
             $categorypath = url('')."/storage/app/public/category/";
            $categories = Category::where(['parent_id' => $id,'status'=>1])->orderBy('priority','desc')->get();
              return response()->json(['state' => 0, 'errors' => $categories, 'categoryimgpath'=> $categorypath], 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }

    public function get_products($id, Request $request)
    {
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            $productimgpath = url('')."/storage/app/public/product/";
            array_push($errors, ['code' => 'zoneId', 'message' => 'Zone id is required!']);
            return response()->json([
                'state' => 1,
                'errors' => $errors
            ], 200);
        }
        $validator = Validator::make($request->all(), [
            'limit' => 'required',
            'offset' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['state' => 1,'errors' => Helpers::error_processor($validator)], 200);
        }

        $zone_id= $request->header('zoneId');
        $data = CategoryLogic::products($id, $zone_id, $request['limit'], $request['offset']);
        $data['products'] = Helpers::product_data_formatting($data['products'] , true);
        return response()->json(['state' => 0, 'errors' => $data, 'productimgpath'=> $productimgpath], 200);
    }

    public function get_all_products($id,Request $request)
    {
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
             $allpro=Helpers::product_data_formatting(CategoryLogic::all_products($id, $zone_id), true);
             $productimgpath = url('')."/storage/app/public/product/";
            return response()->json(['state' => 0, 'errors' => $allpro, 'productimgpath'=> $productimgpath], 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }
}
