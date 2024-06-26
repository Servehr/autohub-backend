<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Carbon\Carbon;

class DashboardController extends Controller
{
    //======================================================================
    // DASHBOARD STARTS HERE
    //======================================================================

     // Home Functions Starts Here
     public function index(){

        return response()->json(['success' => true, 'data' => $data], 200);
    }

    public function productDetails($slug){

        return response()->json(['success' => true, 'data' => $data], 200);
    }

    public function options(){

        return response()->json(['success' => true, 'data' => $data], 200);
    }


    //======================================================================
    // DASHBOARD ENDS HERE
    //======================================================================

}
