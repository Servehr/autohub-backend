<?php

namespace App\Http\Controllers\Api\App;

use App\Http\Controllers\Controller;
use App\Models\SalesType;
use App\Models\SalesTypes;
use App\Models\Swap;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class SwapController extends Controller
{
    function create(Request $request)
    {
        $input = $request->all();
        $rules = array(
            'brand_id' => 'required',
            'model_id' => 'required',
            'condition_id' => 'required',
            'colour_id' => 'required',
            'chasis_number' => 'required',
            'name' => 'required',
            'fault' => 'required',
            'rate' => 'required',
            'description' => 'required',
            'price' => 'required',
            'leave_vehicle_time' => 'required',
            'sale_type' => 'required',
            'images' => 'required',
        );

        $messages = [
            'same' => 'The :attribute and :other must match.',
            'size' => 'The :attribute must be exactly :size.',
            'min' => 'The :attribute value :input is below :min',
            'unique' => 'The :input already exist',
        ];

        $validator = Validator::make($input, $rules, $messages);

        if (!$validator->passes()) {
            return response()->json(['success' => 0, 'message' => implode(",", $validator->errors()->all())]);
        }

        $imgSplits=explode("<=>", $input['images']);
        $imgs=[];
        $startName=Auth::id().rand();

        foreach ($imgSplits as $imgSplit){
            $photo = $startName.uniqid() . ".jpg";
            $decodedImage = base64_decode($imgSplit);
            $path='public/swap/' . $photo;

            // Store a file on the FTP disk
            $s=Storage::disk('ftp')->put($path, $decodedImage);

            if(!$s){
                return response()->json(['success' => 0, 'message' => 'Unable to upload file']);
            }

            $imgs=array_merge($imgs,  ['https://'.env('FTP_HOST').'/'.$path]);
        }

        $input['user_id']=Auth::id();
        $input['images']=json_encode($imgs);
        Swap::create($input);

        return response()->json(['success' => 1, 'message' => 'Swap created successfully']);
    }


    function list(){
        $data=Swap::where("status", 1)->get();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    function saleList(){
        $data=SalesTypes::get();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }
}
