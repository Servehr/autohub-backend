<?php

namespace App\Http\Controllers\Api\Maceos\Course;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Course;
use Carbon\Carbon;
use App\Http\Requests\Course\AddCourseRequest;
use App\Http\Requests\Course\EditCourseRequest;
use App\Http\Requests\Course\DeleteCourseRequest;
use App\Http\Requests\Course\UploadCourseRequest;

use App\Traits\ResponseTrait;

class CourseController extends Controller
{
    use ResponseTrait;
    //
    public function all_courses()
    {
        try 
        {
            //code...
            $all_courses = Course::whereNull('deleted_at')->get();
            return $this->sendSuccess(true, "Student Successfully Registered", $all_courses, "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function create_course(Request $request)
    {
        try 
        {
            //code...
            $input = $request->all();
            $new_course = Course::create($input);          
            return $this->sendSuccess(true, "Course Successfully Registered", $new_course, "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function edit_course(Request $request)
    {  
        // return $this->sendSuccess(true, "Course Successfully Updated", $request->all(), "");
        try 
        {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            $name = $input['name'];
            $description = $input['description'];
            Course::where('id', $id)->update(['name' => $name, 'description' => $description]);    
            return $this->sendSuccess(true, "Course Successfully Updated", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function delete_course(Request $request)
    {
        // return $this->sendSuccess(true, "Course Successfully Deleted", $request->id, "");
        try 
        {
            //code...     
            $id = (int)$request->id;
            Course::where('id', $id)->update(['deleted_at' => Carbon::now()]);
            return $this->sendSuccess(true, "Course Successfully Deleted", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function upload_course(Request $request)
    {
        try 
        {
            //code...
            $input = $request->all();    
            $id = $request->id;
            if ($request->hasFile('material'))
            {
                // $image_path = url(env('APP_URL'));
                $courseName = time().'-'.rand(1,1000000000000000).'-'.$request->material->getClientOriginalName();
                $path = "/course/";
                $request->material->move(public_path($path), $courseName);
                // $image_url = url($path.$picture);
                Course::where('id', $id)->update(['file_name' => $courseName]);
                $cxse = Course::find($id);
                return $this->sendSuccess(true, "Course Material Successfully Uploaded", $cxse, "");
            } else {
                return $this->sendSuccess(false, "Kindly, select file to upload ", "", "");
            }
        } catch (\Throwable $th) {   
            return $this->sendError('', $th, 500);
        }
    }
    
    public function remove_course(Request $request)
    {
        // try 
        // {
            //code...
            Course::where('id', $request->id)->update(['file_name' => NULL]);
            $cxse = Course::find($request->id);
            return $this->sendSuccess(true, "Course Material Successfully Uploaded", $cxse, "");
        // } catch (\Throwable $th) {   
        //     return $this->sendError('', $th, 500);
        // }
    }
    

}
