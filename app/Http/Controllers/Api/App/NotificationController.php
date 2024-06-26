<?php

namespace App\Http\Controllers\Api\App;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Watchlist;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NotificationController extends Controller
{
    function index(){
        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>Auth::user()->notifications]);
    }
}
