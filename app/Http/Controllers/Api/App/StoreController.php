<?php

namespace App\Http\Controllers\Api\App;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class StoreController extends Controller
{
    function overview(){
        $views=Product::where("user_id",Auth::id())->sum('views');
        $ads=Product::where("user_id",Auth::id())->count();
        $ords=Product::where([["user_id",Auth::id()], ['status','sold']])->count();
        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data' => ['views' =>$views, 'ads'=>$ads, 'ords'=>$ords]]);
    }

    function onSale(){
        $data=Product::with(['images', 'messages'])->
            withCount(
              ['messages']
            )->where([["user_id",Auth::id()], ['status','active']])->with('lga')
            ->get();
        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data' => $data]);
    }

    function userProduct($id)
    {
        $data=Product::where("id", $id)->with('images')->first();
        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data' => $data]);
    }

    function unposted(){
        $data=Product::where([["user_id",Auth::id()], ['status','pending']])->with('lga')->get();
        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data' => $data]);
    }

    function sold(){
        $data=Product::where([["user_id",Auth::id()], ['status','sold']])->with('lga')->get();
        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data' => $data]);
    }
}
