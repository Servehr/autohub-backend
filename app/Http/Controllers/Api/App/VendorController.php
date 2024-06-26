<?php

namespace App\Http\Controllers\Api\App;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class VendorController extends Controller
{
    function search(Request $request){

        $input = $request->all();
        $service = $input['service'] ?? '';
        $address = $input['address'] ?? '';
        $vendor_id = $input['vendor_id'] ?? '';


        $query = User::OrderBy('id', 'desc')->where("type", "vendor")
            ->when(isset($vendor_id) && $vendor_id!='', function ($query) use ($vendor_id) {
                $query->where('user_id', 'LIKE', $vendor_id);
            })
            ->when(isset($service) && $service!='', function ($query) use ($service) {
                $query->where('specialization', $service);
            })
            ->when(isset($address) && $address != '', function ($query) use ($address) {
                $query->whereHas('company', function ($query) use ($address) {
                    $query->where('address', 'LIKE', "%$address%");
                });
            })
//            ->where('status','active')
            ->with('company', 'service')
            ->limit(100)
            ->get();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data' => $query]);
    }
}
