<?php

namespace App\Http\Controllers\Api\App;

use App\Http\Controllers\Controller;
use App\Models\CarMake;
use App\Models\CarModel;
use App\Models\Category;
use App\Models\Colour;
use App\Models\Condition;
use App\Models\Lga;
use App\Models\Plan;
use App\Models\Product;
use App\Models\State;
use App\Models\Transmission;
use App\Models\Trim;
use App\Models\User;
use App\Notifications\notifyUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Opcodes\LogViewer\Log;

class AdminManagementController extends Controller
{
    function list($status){

        $data=Product::where("status", $status)->with('lga', 'state')->latest()->paginate(20);

        return response()->json(['success' => 1, 'message' => 'Fetched products successfully', 'data'=>$data]);
    }

    function details($id){

        $data=Product::where("id", $id)->with('user', 'category', 'state', 'lga', 'make', 'model', 'messages', 'trans', 'trimD', 'color', 'plan')->first();

        return response()->json(['success' => 1, 'message' => 'Fetched product details successfully', 'data'=>$data]);
    }

    function viewDetails($slug){

        $data=Product::where("slug", $slug)->with('user', 'category', 'state', 'lga', 'make', 'model', 'messages', 'trans', 'trimD', 'color', 'plan')->first();

        return response()->json(['success' => 1, 'message' => 'Fetched product details successfully', 'data'=>$data]);
    }

    function sponsored(Request $request){

        $category_id = $input['category_id'] ?? '';

        if($category_id == '') {
            $data = Product::where(['featured' => 1])->with('lga', 'state')->latest()->paginate(20);
        }else{
            $data = Product::where(['featured' => 1, 'category_id' => $category_id])->with('lga', 'state')->latest()->paginate(20);
        }

        return response()->json(['success' => 1, 'message' => 'Fetched sponsored products successfully', 'data'=>$data]);
    }

    // function toppicks(){

    //     $data=Product::where(["status" => 'active', 'exhautic' => 1])->inRandomOrder()->limit(20)->get();

    //     return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    // }

    function stateList(){

        $data=State::with('lgas')->get();

        return response()->json(['success' => 1, 'message' => 'Fetched states successfully', 'data'=>$data]);
    }

    function stateLGAList(){

        $st=State::all();
        $lg=Lga::all();

        return response()->json(['success' => 1, 'message' => 'Fetched state and lgas successfully', 'data'=>['states'=>$st, 'lgas'=>$lg]]);
    }

    function makerList(){
        $data=CarMake::all();

        return response()->json(['success' => 1, 'message' => 'Fetched makers successfully', 'data'=>$data]);
    }

    function conditionList(){
        $data=Condition::all();

        return response()->json(['success' => 1, 'message' => 'Fetched conditions successfully', 'data'=>$data]);
    }

    function transmissionList(){
        $data=Transmission::all();

        return response()->json(['success' => 1, 'message' => 'Fetched transmissions successfully', 'data'=>$data]);
    }

    function modelList(){
        $data=CarModel::all();

        return response()->json(['success' => 1, 'message' => 'Fetched models successfully', 'data'=>$data]);
    }

    function trimList(){
        $data=Trim::where("status", 1)->get();

        return response()->json(['success' => 1, 'message' => 'Fetched trims successfully', 'data'=>$data]);
    }

    function categoryList(){
        $data=Category::where("status", 1)->get();

        return response()->json(['success' => 1, 'message' => 'Fetched categories successfully', 'data'=>$data]);
    }

    // COLORS
    function colourList(){
        $data=Colour::orderBy('name')->get();

        return response()->json(['success' => 1, 'message' => 'Fetched colors successfully', 'data'=>$data]);
    }

    function addColour(Request $request){
        $validator = Validator::make($request->all(), [
            'pin' => 'required|digits_between:0000,9999|numeric',
            'current_pin' => 'required|digits_between:0000,9999|numeric',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Incomplete request', 'error' => $validator->errors()], 401);
        }
        $data=Colour::orderBy('name')->get();

        return response()->json(['success' => 1, 'message' => 'Fetched colors successfully', 'data'=>$data]);
    }
}
