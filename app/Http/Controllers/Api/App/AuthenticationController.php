<?php

namespace App\Http\Controllers\Api\App;

use App\Http\Controllers\Controller;
use App\Mail\EmailReset;
use App\Models\Company;
use App\Models\Qualification;
use App\Models\Service;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use App\Http\Requests\changeEmailRequest;
use App\Http\Requests\changePhoneNumberRequest;
use Illuminate\Support\Str;

class AuthenticationController extends Controller
{
    public function login(Request $request)
    {
        $input = $request->all();
        $rules = array(
            'email' => 'required|email',
            'password' => 'required'
        );

        $validator = Validator::make($input, $rules);

        $input = $request->all();

        Log::info("Login endpoint: " . json_encode($input));

        if (!$validator->passes()) {

            return response()->json(['success' => 0, 'message' => implode(",", $validator->errors()->all())]);
        }

        $user = User::where('email', $input['email'])->first();
        if (!$user) {
            return response()->json(['success' => 0, 'message' => 'User does not exist']);
        }
        if (!Hash::check($input['password'], $user->password)) {
            return response()->json(['success' => 0, 'message' => 'Incorrect password attempt']);
        }

        if ($user->status != 'active') {
            return response()->json(['success' => 0, 'message' => 'Inactive User']);
        }

        $token = $user->createToken("app")->plainTextToken;
        User::where('id', $user->id)->update(['online' => 1 ]);

        $x = User::where('id', $user->id)->first();

        return response()->json(['success' => 1, 'message' => 'Login successfully', 'token' => $token, 'data' => $x]);
    }

    public function vendorRegister(RegisterRequest $request)
    {
        $input = $request->all();
        $rules = array(
            'company_name' => 'required|min:4',
            'company_address' => 'required|min:9',
            'company_cac' => 'required',
            'name' => 'required|min:4',
            'password' => 'required|min:6',
            'phoneno' => 'required:unique:users',
            'email' => 'required|email|unique:users',
            'company_nata' => 'required',
            'year_of_experience' => 'required',
            'avatar' => 'nullable',
            'id_card_front' => 'required',
            'id_card_back' => 'required',
            'service_id' => 'required'
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

        //values gotten

        $create["type"] = "vendor";
        $create["email"] = $input["email"];
        $create["name"] = $input["name"];
        $create["phoneno"] = $input["phoneno"];
        $create["password"] = Hash::make($input['password']);
        $create['year_of_experience']=$input["year_of_experience"];
        $create['specialization']=$input["service_id"];


        if($input['avatar'] == null){
            $create['avatar']="";
        }else{
            // $photo = rand().rand() . ".jpg";
            // $decodedImage = base64_decode($input["avatar"]);
            // $path='public/avatar/' . $photo;

            // Store a file on the FTP disk
            // $s=Storage::disk('ftp')->put($path, $decodedImage);

            // if(!$s){
            //     return response()->json(['success' => 0, 'message' => 'Unable to upload file']);
            // }

            // $create['avatar']="https://".env('FTP_HOST')."/".$path;
        }

        ##uploading front ID
        // $photo = "id_front_".rand().rand() . ".jpg";
        // $decodedImage = base64_decode($input["id_card_front"]);
        // $path='public/kyc/' . $photo;

        // Store a file on the FTP disk
        // $s=Storage::disk('ftp')->put($path, $decodedImage);

        // if(!$s){
        //     return response()->json(['success' => 0, 'message' => 'Unable to upload file']);
        // }

        // $create['id_card_front']="https://".env('FTP_HOST')."/".$path;

        ##uploading Back ID
        // $photo = "id_back_".rand().rand() . ".jpg";
        // $decodedImage = base64_decode($input["id_card_back"]);
        // $path='public/kyc/' . $photo;

        // Store a file on the FTP disk
        // $s=Storage::disk('ftp')->put($path, $decodedImage);

        // if(!$s){
        //     return response()->json(['success' => 0, 'message' => 'Unable to upload file']);
        // }

        // $create['id_card_back']="https://".env('FTP_HOST')."/".$path;


        $user=User::create($create);

        $biz['user_id']=$user->id;
        $biz['name']=$input["company_name"];
        $biz['address']=$input["company_address"];
        $biz['cac_number']=$input["company_cac"];
        $biz['nata']=$input["company_nata"];

        if (Company::create($biz)) {
            // successfully inserted into database
            $token = $user->createToken("app")->plainTextToken;

            return response()->json(['success' => 1, 'message' => 'Account created successfully', 'token'=>$token]);
        } else {
            return response()->json(['success' => 0, 'message' => 'Oops! An error occurred.']);
        }

    }

    public function changeEmail(changeEmailRequest $request)
    {
        $validated = $request->validated();
        $input = $request->all();
        $user = Auth::user();
        if (!Hash::check($input['password'], $user->password)) {
            return response()->json(['success' => 0, 'message' => 'Incorrect password attempt']);
        }
        User::where('id', Auth::user()->id)->update(
              ['email' => $input['email']]
        );
        return response()->json(['success' => 1, 'message' => 'Email successfully changed']);
    }

    public function changePhoneNumber(changePhoneNumberRequest $request)
    {
        $validated = $request->validated();
        $input = $request->all();
        $user = Auth::user();
        if (!Hash::check($input['password'], $user->password)) {
            return response()->json(['success' => 0, 'message' => 'Incorrect password attempt']);
        }
        User::where('id', Auth::user()->id)->update(
              ['phoneno' => $input['phone']]
        );
        return response()->json(['success' => true, 'message' => 'Phone Number successfully changed']);
    }

    public function deleteAdvert(Request $request)
    {
        $validated = $request->validated();
        $product = Product::where('id', $request->id)->delete();
        return response()->json(['success' => 1, 'message' => 'Product successfully deleted']);
    }

    public function logOut()
    {
        User::where('id', Auth::user()->id)->update(['online' => 0 ]);
        return response()->json(['success' => 1, 'message' => 'User successfully set offline', 'x' => Auth::user()->id]);
    }

    public function setUserNewPassword(Request $request)
    {
          $user = User::where('email', $request->email)->update(['password' => Hash::make($request['password'])]);
          if($user)
          {
              return response()->json(['success' => true, 'message' => 'Password successfully changed.']);
          } else {
              return response()->json(['success' => false, 'message' => 'Changing password failed.']);
          }
    }

    public function affiliateRegister(Request $request)
    {
        $input = $request->all();
        $rules = array(
            'company_name' => 'required|min:4',
            'company_address' => 'required|min:9',
            'company_cac' => 'required',
            'name' => 'required|min:4',
            'password' => 'required|min:6',
            'phoneno' => 'required:unique:users',
            'email' => 'required|email|unique:users',
            'avatar' => 'nullable'
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

        //values gotten

        $create["type"] = "affiliate";
        $create["email"] = $input["email"];
        $create["name"] = $input["name"];
        $create["phoneno"] = $input["phoneno"];
        $create["password"] = Hash::make($input['password']);
//        $create['year_of_experience']=$input["year_of_experience"];
//        $create['specialization']=$input["specialization"];
//        $create['id_card_front']=$input["id_card_front"];
        $user=User::create($create);

        $biz['user_id']=$user->id;
        $biz['name']=$input["company_name"];
        $biz['address']=$input["company_address"];
        $biz['cac_number']=$input["company_cac"];
//        $biz['nata']=$input["company_nata"];

        if (Company::create($biz)) {
            // successfully inserted into database
            $token = $user->createToken("app")->plainTextToken;

            return response()->json(['success' => 1, 'message' => 'Account created successfully', 'token'=>$token, 'id' => $user->id]);
        } else {
            return response()->json(['success' => 0, 'message' => 'Oops! An error occurred.']);
        }

    }

    public function buyerRegister(Request $request)
    {
        $input = $request->all();
        $rules = array(
            'name' => 'required|min:4',
            'password' => 'required|min:6',
            'phoneno' => 'required:unique:users',
            'email' => 'required|email|unique:users',
            'avatar' => 'nullable',
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

        //values gotten

        $create["email"] = $input["email"];
        $create["name"] = $input["name"];
        $create["phoneno"] = $input["phoneno"];
        $create["password"] = Hash::make($input['password']);
        $user=User::create($create);

        if ($user) {
            // successfully inserted into database
            $token = $user->createToken("app")->plainTextToken;

            return response()->json(['success' => 1, 'message' => 'Account created successfully', 'token'=>$token, 'id' => $user->id]);
        } else {
            return response()->json(['success' => 0, 'message' => 'Oops! An error occurred.']);
        }

    }

    //Forgot Password
    public function forget_password_request(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
        ]);

        if ($validator->fails()) {
            return response()->json(['success'=>false, 'message'=>'Email Required for Password Reset']);
        }

        $user = User::Where(['email' => $request['email']])->first();

        if(!empty($user) || $user === "")
        {
            $code = substr(rand(), 0, 4);
            DB::table('password_resets')->insert(
                [
                    'email' => $user['email'],
                    'token' => $code,
                    'created_at' => now(),
                ]
            );
            // Mail::to($request['email'])->send(new EmailReset($code));
            $encrypted = Hash::make($user->id);
            $userData['id'] = $user->id;
            $userData['email'] = $user->email;
            return response()->json(['success'=>true, 'message' => 'Email sent successfully.', 'user' => $userData]);
        }
        return response()->json(['success'=>false, 'message' => 'Email not found!']);
    }

    //Forgot Password Complete
    public function forget_password_complete(Request $request)
    {
         $validator = Validator::make($request->all(), [
              'code' => 'required'
         ]);

          if ($validator->fails()) {
              return response()->json(['success'=>false, 'message'=> implode(",", $validator->errors()->all())]);
          }

          $data = DB::table('password_resets')->where(['token' => $request['code']])->first();
          if (isset($data))
          {
              DB::table('password_resets')->where(['token' => $request['code']])->delete();
              return response()->json(['success'=>true, 'message' => 'Password changed successfully.']);
          }
          return response()->json(['success'=>false, 'message' => 'Invalid code']);
    }

    public function new_password(Request $request)
    {
         $validator = Validator::make($request->all(), [
              'id' => 'required|number',
              'password' => 'required',
              'confirm_password' => 'required'
         ]);

          if ($validator->fails()) {
              return response()->json(['success'=>false, 'message'=> implode(",", $validator->errors()->all())]);
          }
          if (isset($data))
          {
              DB::table('users')->where(
                  ['id' => $data->id])->update([
                  'password' => Hash::make($request['password'])
                ]
              );
              return response()->json(['success'=>true, 'message' => 'Password changed successfully.']);
          }
          return response()->json(['success'=>false, 'message' => 'Invalid code']);
    }

    public function qualifications()
    {
        $data=Qualification::where("status", 1)->get();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    public function services()
    {
        $data=Service::where("status", 1)->get();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }
}
