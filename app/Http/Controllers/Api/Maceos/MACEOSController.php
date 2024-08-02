<?php

namespace App\Http\Controllers\Api\Maceos;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Http\Requests\MaceosRegistrationRequest;
use App\Http\Requests\MaceosRegistrationRequestt;

use App\Traits\ResponseTrait;
use App\Models\User;
use App\Models\Persin;
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
            $student['company_name'] = $input['companyName'];
            $student['company_address'] = $input['companyAddress'];
            $student['specialization'] = $input['specialization'];
            $student['years_in'] = $input['yearsIn'];
            $student['region'] = $input['region'];
            $student['city'] = $input['city'];
            $student['birth'] = $input['birth'];
            $student['gender'] = $input['gender'];
            $student['academic'] = $input['academic'];
            $user = Student::create($student);  

            $person['user_id'] = $input['user_id'];
            $person['name'] = 'student';
            $userPerson = Persin::create($person);

            return $this->sendSuccess(true, "Student Successfully Registered", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function NewRegistration(Request $request)
    {
        // try 
        // {   
            // $validated = $request->validated();
            $input = $request->all();
            $user['name'] = $input['firstname'];
            $user['middlename'] = $input['middlename'];
            $user['lastname'] = $input['surname'];
            $user['email'] = $input['email'];
            $user['phoneno'] = $input['phoneno'];
            $user["password"] = Hash::make($input['password']);
            $user['type'] = 'student';
            $user = User::create($user);
            // return $this->sendSuccess(false, "Registration Successful", $user, "");
            if($user)
            {
                $student['user_id'] = $user->id;
                $student['company_name'] = $input['companyName'];
                $student['company_address'] = $input['companyAddress'];
                $student['specialization'] = $input['specialization'];
                $student['years_in'] = $input['yearsIn'];
                $student['region'] = $input['region'];
                $student['city'] = $input['city'];
                $student['birth'] = $input['birth'];
                $student['gender'] = $input['gender'];
                $student['academic'] = $input['academic'];
                Student::create($student);        

                $person['user_id'] = $user->id;
                $person['name'] = 'student';
                $userPerson = Persin::create($person);
                return $this->sendSuccess(false, "Registration Successful",  $userPerson, "");
            } else {
                return $this->sendSuccess(false, "Processing User Information Failed", "", "");
            }
        // } catch (\Throwable $th) {
        //     return $this->sendError('', "Failed", 500);
        // }
    }

    public function UserInfo($id)
    {
        $userInfo = User::select(['users.id', 'users.name',  'users.lastname', 'users.middlename', 'users.email', 'users.phoneno', 'students.user_id', 'students.id'])
            ->join('students', 'students.user_id', '=', 'users.id')
            ->where('students.user_id', '=', $id)
            ->first();
        if($userInfo)
        {
            return $this->sendSuccess(true, "User Information", $userInfo, "student");
        } else {
            $userInformation = User::where('id', $id)->first();
            if($userInformation)
            {
                return $this->sendSuccess(false, "User Information", $userInformation, "member");
            } else {
                return $this->sendSuccess(false, "User Information", 'none', "member");
            }
        }
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
