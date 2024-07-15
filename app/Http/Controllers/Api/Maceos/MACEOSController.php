<?php

namespace App\Http\Controllers\Api\Maceos;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Http\Requests\MaceosRegistrationRequest;
use App\Http\Requests\MaceosRegistrationRequestt;

use App\Traits\ResponseTrait;
use App\Models\User;
use App\Models\Student;


class MACEOSController extends Controller
{
    use ResponseTrait;
    //
    public function ExistingUserRegistration(MaceosRegistrationRequestt $request)
    {
        try 
        {     
            $validated = $request->validated();   
            // return $this->sendSuccess(false, "User Information", $request->all(), "");   
            $input = $request->all();
            $id = $input['user_id'];
            $middlename = $input['middlename'];
            User::where('id', $id)->update(['middlename' => $middlename]);

            $student['user_id'] = $id;
            $student['company_name'] = $input['company_name'];
            $student['company_address'] = $input['company_address'];
            $student['specialization'] = $input['specialization'];
            $student['years_in'] = $input['years_in'];
            $student['region'] = $input['region'];
            $student['city'] = $input['city'];
            $student['birth'] = $input['birth'];
            $student['gender'] = $input['gender'];
            $student['academic'] = $input['academic'];
            Student::create($student);  
            return $this->sendSuccess(true, "Student Successfully Registered", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function NewRegistration(Request $request)
    {
        try 
        {   
            $validated = $request->validated();
            $input = $request->all();
            $user['name'] = $input['firstname'];
            $user['middlename'] = $input['middlename'];
            $user['lastname'] = $input['lastname'];
            $user['email'] = $input['email'];
            $user['phoneno'] = $input['phoneno'];
            $user["password"] = Hash::make($input['password']);
            $user['type'] = 'student';
            $user = User::create($user);
            if($user)
            {
                $student['user_id'] = $user->id;
                $student['company_name'] = $input['company_name'];
                $student['company_address'] = $input['company_address'];
                $student['specialization'] = $input['specialization'];
                $student['years_in'] = $input['years_in'];
                $student['region'] = $input['region'];
                $student['city'] = $input['city'];
                $student['birth'] = $input['birth'];
                $student['gender'] = $input['gender'];
                $student['academic'] = $input['academic'];
                Student::create($student);        
                return $this->sendSuccess(false, "Registration Successful", "", "");
            } else {
                return $this->sendSuccess(false, "Processing User Information Failed", "", "");
            }
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function UserInfo($id)
    {
        $userInfo = User::find($id);
        return $this->sendSuccess(false, "User Information", $userInfo, "");
    }

    // try
        //     {
        //         $user_data = $request->all();
        //         try
        //         {
        //             if(Mail::to($user_data['email'])->send(new Message($user_data['title'], $user_data['message'])))
        //             {
        //                 $message = 'Message successfully sent to '. $request->email;
        //                 return $this->sendSuccess(true, $message, "");
        //             } else {
        //                 $message = 'Sending email to '. $request->email . ' failed';
        //                 return $this->sendError('', "Failed", 500);
        //             }
        //         } catch (\Exception $ex) {
        //               return $ex;
        //         }
        //      } catch (\Throwable $ex) {
        //         return $ex;
        //     }
    //

}
