<?php

namespace App\Http\Controllers\Api\App;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Collection;
use App\Models\Company;
use App\Models\Product;
use App\Models\User;
use App\Models\Follower;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

use App\Http\Requests\User\AddUserRequest;
use App\Http\Requests\User\EditUserRequest;
use App\Http\Requests\User\DeleteUserRequest;

use App\Traits\ResponseTrait;

class UserController extends Controller
{
    use ResponseTrait;
    
    function profile()
    {   
        $followers = Follower::where('vendor', Auth::id())->count();
        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>Auth::user(), 'company'=>Auth::user()->company, 'followers' => $followers]);
    }

    function updateProfile(Request $request){

        $input = $request->all();
        $rules = array(
            'name' => 'required',
            'phoneno' => 'required',
            'storeName' => 'nullable',
            'storeCac' => 'nullable',
            'storeAddress' => 'nullable'
        );

        $validator = Validator::make($input, $rules);

        if (!$validator->passes()) {
            return response()->json(['success' => 0, 'message' => implode(",", $validator->errors()->all())]);
        }


        $input = $request->all();

        $user=User::find(Auth::id());
        $user->name=$input['name'];
        $user->phoneno=$input['phoneno'];
        $user->save();

        if(isset($input['storeName'])) {
            $comp = Company::where('user_id', Auth::id())->first();

            if($comp){
                $comp->name = $input['storeName'];
                $comp->cac_number = $input['storeCac'];
                $comp->address = $input['storeAddress'];
                $comp->save();
            }
        }

        $user->refresh();

        return response()->json(['success' => 1, 'message' => 'Profile updated successfully', 'data'=>$user, 'company'=>$user->company]);
    }

    function changePassword(Request $request){

        $input = $request->all();
        $rules = array(
            'currentPassword' => 'required',
            'newPassword' => 'required'
        );

        $validator = Validator::make($input, $rules);

        if (!$validator->passes()) {
            return response()->json(['success' => 0, 'message' => implode(",", $validator->errors()->all())]);
        }


        $input = $request->all();


        if(!Hash::check($input['currentPassword'], Auth::user()->password)){
            return response()->json(['success' => 0, 'message' => 'Incorrect current password']);
        }

        $user=User::find(Auth::id());
        $user->password=Hash::make($input['newPassword']);
        $user->save();

        return response()->json(['success' => 1, 'message' => 'Password changed successfully']);
    }

    function updateAvatar(Request $request){
        // return response()->json(['success' => 0, 'message' => gettype($request->avatar)]);
        $imagg = $request->avatar;
        $input = $request->all();
        $rules = array(
            'avatar' => 'required'
        );

        $validator = Validator::make($input, $rules);

        if (!$validator->passes()) {
            return response()->json(['success' => 0, 'message' => implode(",", $validator->errors()->all())]);
        }


        $user=User::find($request->id);

        if(!$user){
            return response()->json(['success' => 0, 'message' => 'Kindly login']);
        }
        // return response()->json(['success' => 0, 'message' => $user]);

        // $imgSplits=explode(",", $input['avatar']);
        $startName=$request->id.rand();
        $photo = $startName.uniqid() . ".jpg";
        $decodedImage = base64_decode($input['avatar']);
        $path='/avatar/' . $photo;
        file_put_contents(public_path().'/avatar/'.$photo, $decodedImage);

        User::where('id', $request->id)->update(['avatar' => $photo]);


        // $user->avatar="https://".env('FTP_HOST')."/".$path;
        // $user->save();


        return response()->json(['success' => 1, 'message' => 'Image updated successfully', 'data'=>$user]);
    }

    public function AddUser(AddUserRequest $request)
    {
        // $validated = $request->validated();
        
    }

    public function UpdateUser(EditUserRequest $request)
    {
        // $validated = $request->validated();
    }

    public function DeleteUser(DeleteUserRequest $request)
    {
        // $validated = $request->validated();   
    }

    public function UserById(Request $request)
    {
        
    }

    public function UserByType(Request $request)
    {
        
    }

}
