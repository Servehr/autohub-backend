<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\UserLogin;
use App\Models\GeneralSettings;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;


class AuthController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    //Login
    public function login_user(Request $request)
    {
        $user = User::where('username', $request->username)->orWhere('phone', $request->username)->orWhere('email', $request->username)->first();

        if (! $user || ! Hash::check($request->password, $user->password)) {
            return response()->json(['success'=>false, 'status'=>'invalid_credentials', 'message'=>'Wrong Login Details'], 401);
        }

        $token = $user->createToken($request->device_name)->plainTextToken;
        if($user->image != NULL){
            $image = $user->email;
        }else{
            $image = "https://ui-avatars.com/api/?name=".$user->firstname."&color=7F9CF5&background=EBF4FF";
        }
        if($user->address != NULL){
            $address = $user->address;
        }else{
            $address = " ";
        }
        if($user->city != NULL){
            $city = $user->city;
        }else{
            $city = " ";
        }
        if($user->state != NULL){
            $state = $user->state;
        }else{
            $state = " ";
        }
        if($user->acc_details != NULL){
            $acc_details = $user->acc_details;
        }else{
            $acc_details = " ";
        }
        // User::where('id', $user->id)->update(['live' => 'yes' ]);
        // $user = new User();
        // $user->online = "yes";
        // $user->save();

        $x = User::find($user->id);
        $x->update([ 'live' => 'yes' ]);

        // $dbrecord = DB::table('users')->where('id',$user->id)->first();
        // $dbrecord->online = 'yes'
        // $dbrecord->save();


        // return response()->json(['success'=>true, 'status'=>'ok', 'token'=>$token, 'data'=>['id' => $x, 'firstname' => $user->firstname, 'lastname' => $user->lastname, 'email' => $user->email, 'username' => $user->username, 'phone' => $user->phone, 'image' => $image, 'address' => $address, 'city' => $city, 'state' => $state, 'acc_details' => $acc_details, 'balance' => $user->balance, 'earning' => $user->earning, 'cashback' => $user->cashback, 'point' => $user->point, 'sms_units' => $user->sms_units, 'level' => $user->level, 'mtn_cg' => $user->mtn_cg, 'airtel_cg' => $user->airtel_cg, 'referral' => $user->referral, 'email_verified' => $user->email_verified, 'email_code' => $user->email_code, 'bvn' => $user->bvn, 'bvn_status' => $user->bvn_status, 'acc_status' => $user->acc_status, 'status' => $user->status]], 200);
        return response()->json(['success'=>true], 200);
    }

    //Registration
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'firstname' => 'required|string|max:255',
            'lastname' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'username' => 'required|string|max:30|unique:users',
            'phone' => 'required|numeric|min:11|unique:users',
            'password' => 'required|string|min:8',
        ]);

        if($validator->fails()){
            return response()->json(['success'=>false, 'status'=>'validation_error', 'message'=>'Validation Error', 'error' => $validator->errors()], 401);
        }

        $setting = GeneralSettings::first();
        if ($setting->email_verification == 1) {
            $email_verified = 0;
        } else {
            $email_verified = 1;
        }

        //find referral
        $ref = User::where('username', $request->referral)->first();
        if(!$ref){
            $referral = NULL;
            $point = 0;
        }else{
            $referral = $request->referral;
            $point = 10;
        }

        $email_code  = rand(100000,999999);
        $api_key  = generateApiKey();
        $encrypt  = generateEncrypt();

        Auth::login($user = User::create([
            'firstname' => $request->firstname,
            'lastname' => $request->lastname,
            'email' => $request->email,
            'username' => $request->username,
            'phone' => $request->phone,
            'point' => $point,
            'referral' => $referral,
            'encrypt' => $encrypt,
            'api_key' => $api_key,
            'password' => Hash::make($request->password),
            'email_verified' => $email_verified,
            'email_code' => $email_code,
        ]));

        if ($setting->email_verification == 1) {
            $email_code = $user->email_code;
            $text = "Your Verification Code Is: <b>".$email_code."</b>";
            send_email($user->email, $user->firstname, 'Email Verification', $text);
            if($user->phone !="" || $user->phone !=NULL){
                send_sms($user->phone, $text);
            }
        }

        $user_ip = request()->ip();
            // Use JSON encoded string and converts
            // it into a PHP variable


                $baseUrl = "http://www.geoplugin.net/";
                $endpoint = "json.gp?ip=" . $user_ip."";
                $httpVerb = "GET";
                $contentType = "application/json"; //e.g charset=utf-8
                $headers = array (
                    "Content-Type: $contentType",

                );

                $ch = curl_init();
                curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
                curl_setopt($ch, CURLOPT_URL, $baseUrl.$endpoint);
                curl_setopt($ch, CURLOPT_HTTPGET, true);
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

                $content = json_decode(curl_exec( $ch ),true);
                $err     = curl_errno( $ch );
                $errmsg  = curl_error( $ch );
                curl_close($ch);


                 $conti = $content['geoplugin_continentName'];
                 $country = $content['geoplugin_countryName'];
                 $city = $content['geoplugin_city'];



            $ul['user_id'] = $user->id;
            $ul['user_ip'] =  request()->ip();
           if($city){
            $ul['location'] = ''.$conti.', '.$country.' , '.$city.'';
            }
            else{
            $ul['location'] = 'Unknown';
            }
            $ul['details'] = $_SERVER['HTTP_USER_AGENT'];
            UserLogin::create($ul);

        $token =  $user->createToken($request->device_name)->plainTextToken;
        return response()->json(['success'=>true, 'status'=>'ok', 'message'=>'Registration Successful', 'token'=>$token, 'data'=>$user->makeHidden(["id"])], 200);
    }

    // Email Verification
    public function emailVerify(Request $request){
        $validator = Validator::make($request->all(), [
            'code' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success'=>false, 'status'=>'validation_error', 'message'=>'Verification Code Required'], 401);
        }

        $user = User::find(auth()->user()->id);

        if($user->email_code == $request->code){
            $user->email_verified = 1;
            $user->save();
            return response()->json(['success'=>true, 'status'=>'ok', 'message'=>'Email Verified Successfully', 'email_verified'=>$user->email_verified], 200);
        }else{
            return response()->json(['success'=>false, 'status'=>'verification_failed', 'message'=>'Wrong Email Verification Code'], 400);
        }
    }

    //Forgot Password
    public function reset_password_request(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
        ]);

        if ($validator->fails()) {
            return response()->json(['success'=>false, 'status'=>'validation_error', 'message'=>'Email Required for Password Reset'], 401);
        }

        $user = User::Where(['email' => $request['email']])->first();

        if (isset($user)) {
            $token = Str::random(120);
            $code = rand(100000,999999);
            DB::table('password_resets')->insert([
                'email' => $user['email'],
                'token' => $token,
                'code' => $code,
                'created_at' => now(),
            ]);
            $reset_url = url('/') . '/user/auth/reset-password?token=' . $token;
            $text = "Your password reset code is <b>".$code."</b> to complete password reset on your mobile app. <br> Or Click below button to reset your password now <br> <a style='background: darkblue' class='btn btn-primary' href='".$reset_url."'>Click to Reset</a><br> or copy the link <b>".$reset_url."</b> to reset your password via web browser.";
            send_email_verification($user->email, $user->firstname, 'Reset Password Link', $text);
            return response()->json(['success'=>true, 'status'=>'ok', 'message' => 'Email sent successfully.', 'data'=>$code], 200);
        }
        return response()->json(['success'=>false, 'code' => 'not-found', 'message' => 'Email not found!'], 404);
    }

    //Password Reset
    public function reset_password_submit(Request $request)
    {
        $data = DB::table('password_resets')->where(['email' => $request['email'], 'code' => $request['code']])->first();
        if (isset($data)) {
            if ($request['password'] == $request['confirm_password']) {
                DB::table('users')->where(['email' => $data->email])->update([
                    'password' => bcrypt($request['confirm_password'])
                ]);
                DB::table('password_resets')->where(['email' => $request['email'], 'code' => $request['code']])->delete();
                return response()->json(['success'=>true, 'message' => 'Password reset successfully.'], 200);
            }
            return response()->json(['success'=>false, 'code' => 'mismatch', 'message' => 'Password did,t match!'], 401);
        }
        return response()->json(['success'=>false, 'code' => 'invalid', 'message' => 'Invalid code'], 400);
    }

    // Create Passcode
    public function createPasscode(Request $request){
        $validator = Validator::make($request->all(), [
            'passcode' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success'=>false, 'status'=>'validation_error', 'message'=>'Validation Error', 'error' => $validator->errors()], 401);
        }

        $user = User::where('id',auth()->user()->id)->first();
        $user->passcode = Hash::make($request->passcode);
        $user->save();

        return response()->json(['success'=>true, 'message' => 'Passcode set successfully.'], 200);
    }

    public function resendCode(){
        $setting = GeneralSettings::first();
        $user = User::find(auth()->user()->id);
        if ($setting->email_verification == 1) {
            $email_code = $user->email_code;
            $text = "Your Verification Code Is: <b>".$email_code."</b>";
            send_email($user->email, $user->firstname, 'Email Verification', $text);
            if($user->phone !="" || $user->phone !=NULL){
                send_sms($user->phone, $text);
            }
            return response()->json(['success'=>true, 'message' => 'Verification code sent successfully.'], 200);
        }else{
            return response()->json(['success'=>false, 'message' => 'Code not sent, Try again later.'], 400);
        }
    }
}
