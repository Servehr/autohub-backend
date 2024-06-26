<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Carbon\Carbon;

class FrontendController extends Controller
{
    //======================================================================
    // FRONTEND STARTS HERE
    //======================================================================

     // Home Functions Starts Here
     public function index(){
        $data['sliders'] = HomeSlider::where('status',1)->get();
        $data['category'] = Category::where('status',1)->get();
        $data['brands'] = Brand::where('status',1)->get();
        $data['location'] = State::select('id','name','status')->with('lgas')->get();
        $data['featured'] = Product::where(['featured'=>1,'status'=>'active'])->latest()->get();
        $data['exhautic'] = Product::where(['exhautic'=>1,'status'=>'active'])->latest()->get();
        $data['newly_added'] = Product::where(['status'=>'active'])->latest()->take(10)->get();
        $data['everything'] = Product::where(['status'=>'active'])->latest()->paginate(20);

        // Log::notice("Home data fetched from API ".json_encode($data));

        return response()->json(['success' => true, 'data' => $data], 200);
    }

    public function productDetails($slug){
        $data['details'] = Product::where(['slug'=>$slug,'status'=>'active'])->with('user')->first();
        $data['blog_post'] = [];

        // Log::notice("Home data fetched from API ".json_encode($data));

        return response()->json(['success' => true, 'data' => $data], 200);
    }

    public function options(){
        $data['condition'] = ['New','Toks','Used'];
        $data['body_type'] = ['Saloon','Sedan','Hatchback'];
        $data['fuel_type'] = ['Petrol','Diesel','hybrid'];
        $data['drive_train'] = ['All Wheel','Front Wheel'];
        $data['engine_size'] = ['3500 cc'];
        $data['car_features'] = ['Alloy Wheels','AM/FM Radio','CD Player','Air Conditioning','DVD Player'];
        $data['cylinder'] = [1.2,1.5,2,4,6,8,12];
        $data['seat'] = [1,2,3,4,5,6,7,8,12,14,18,21];
        $data['color'] = ['White','Black','Green','Red','Blue','Yellow','Brown','Tan','Grey','Maroon','Orange','Purple','Gold','Silver','Burgandy'];

        return response()->json(['success' => true, 'data' => $data], 200);
    }


    //======================================================================
    // FRONTEND ENDS HERE
    //======================================================================

}
