<?php

namespace App\Http\Controllers\Api\App;

use App\Http\Controllers\Controller;
use App\Models\Payment;
use App\Models\Plan;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class PaymentsnPlans extends Controller
{

    function plans(){
        $data=Plan::where("status", 1)->get();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    function boostPlans(){
        $data=Plan::where([["status", 1], ["action","sponsored"]])->get();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    function payments(){
        $data=Payment::where("user_id", Auth::id())->latest()->get();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    function paymentCheck($id){
        $data=Payment::where([["user_id", Auth::id()], ["id", $id]])->first();

        if(!$data){
            return response()->json(['success' => 0, 'message' => 'Payment not found']);
        }

        if($data->status == 0){
            return response()->json(['success' => 0, 'message' => 'Payment not received yet', 'data'=>$data]);
        }

        return response()->json(['success' => 1, 'message' => 'Payment successful', 'data'=>$data]);
    }

    function initiatePayment(Request $request){
        $input = $request->all();
        $rules = array(
            'product_id' => 'required',
            'plan_id' => 'required'
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

        $product=Product::find($input['product_id']);

        if(!$product){
            return response()->json(['success' => 0, 'message' => 'Invalid product ID']);
        }

        $plan=Plan::find($input['plan_id']);

        if(!$plan){
            return response()->json(['success' => 0, 'message' => 'Invalid plan ID']);
        }

        if($plan->amount < 1){
            return response()->json(['success' => 0, 'message' => 'Plan does not not require payment']);
        }

        $ref=$product->slug."_".uniqid();

        $payload='{
    "name":"AutoHub/PlanPayment/'.Auth::user()->name.'",
    "email":"'.Auth::user()->email.'",
    "amount":"'.$plan->amount.'",
    "currency":"NGN",
    "reference":"'.$ref.'",
    "phone":"'.Auth::user()->phoneno.'",
    "title":"Ad Payment",
    "description":"Payment for Ad on Autohub",
    "provider" : "vfd"
}';

        Log::info("Initiate Paylony Account for " . $product->id);
        Log::info($payload);

        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => env('PAYLONY_BASEURL') . 'v1/create_checkout_account',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_POSTFIELDS => $payload,
            CURLOPT_HTTPHEADER => array(
                'Authorization: Bearer ' . env('PAYLONY_SECRET_KEY'),
                'Content-Type: application/json'
            ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);

        Log::info("Response");
        Log::info($response);

        $rep = json_decode($response, true);

        if ($rep['success']) {
            $p=Payment::create([
                'data' => $response,
                'user_id' => Auth::id(),
                'product_id' => $input['product_id'],
                'plan_id' => $input['plan_id'],
                'provider' => 'Paylony',
                'reference' => $ref,
            ]);

            return response()->json(['success' => 1, 'message' => 'Payment request submitted successfully', 'data' => ["customer_name" => $rep['account_name'], "account_number" => $rep['account_number'], "bank_name" => $rep['bank_name'], "total_amount" => $rep['totalAmount'], "reference" => $rep['reference'], "id" =>$p->id ]]);
        }else{
            return response()->json(['success' => 0, 'message' => 'Payment can not be completed at this moment']);
        }
    }
}
