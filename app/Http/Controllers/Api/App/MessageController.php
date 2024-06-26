<?php

namespace App\Http\Controllers\Api\App;

use App\Http\Controllers\Controller;
use App\Models\Message;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class MessageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        $data=Message::where("vendor_id", Auth::id())->with('user')->get();

        return response()->json(['success' => 1, 'message' => 'My Message fetched successfully', 'data' =>$data]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $input = $request->all();
        $rules = array(
            'product_id' => 'required',
            'message' => 'required',
        );

        $validator = Validator::make($input, $rules);

        if (!$validator->passes()) {
            return response()->json(['success' => 0, 'message' => implode(",", $validator->errors()->all())]);
        }

        $pcheck=Product::find($input['product_id']);

        if(!$pcheck){
            return response()->json(['success' => 0, 'message' => "Kindly use valid product ID"]);
        }

        $input['user_id']=Auth::id();
        $input['vendor_id']=$pcheck->user_id;

        Message::create($input);

        return response()->json(['success' => 1, 'message' => 'Message posted successfully']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function showProduct($id)
    {
        $productCheck=Product::find($id);

        if(!$productCheck){
            return response()->json(['success' => 0, 'message' => "Kindly use valid product ID"]);
        }

        return response()->json(['success' => 1, 'message' => "Fetched successfully", 'data' => $productCheck->messages]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
