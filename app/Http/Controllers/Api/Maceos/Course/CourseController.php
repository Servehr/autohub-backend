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
            $all_courses = Course::get();
            return $this->sendSuccess(true, "Student Successfully Registered", $all_courses, "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function create_course(AddCourseRequest $request)
    {
        try 
        {
            //code...
            $input = $request->all();
            $new_course = Course::create($input);          
            return $this->sendSuccess(true, "Course Successfully Registered", $new_course, "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function edit_course(EditCourseRequest $request)
    {
        try 
        {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            $name = $input['name'];
            $description = $input['description'];
            Course::where('id', $id)->update(['name', $name, 'description' => $description]);    
            return $this->sendSuccess(true, "Course Successfully Updated", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function delete_course(DeleteCourseRequest $request)
    {
        try 
        {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            Course::where('id', $id)->update(['deleted_at' => Carbon::now()]);
            return $this->sendSuccess(true, "Course Successfully Deleted", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function upload_course(UploadCourseRequest $request)
    {
        try 
        {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            if ($request->hasFile('material'))
            {
                $image_path = url(env('APP_URL'));
                $picture = time().'-'.rand(1,1000000000000000).'-'.$request->product->getClientOriginalName();
                $path = "/course/";
                $request->product->move(public_path($path), $picture);
                // $image_url = url($path.$picture);
                Course::where('id', $id)->update(['file_name', $request->material]);
                return $this->sendSuccess(true, "Course Material Successfully Uploaded", "", "");
            } else {
                return $this->sendSuccess(false, "Kindly, select file to upload ", "", "");
            }
        } catch (\Throwable $th) {
            //throw $th;            
            return $this->sendError('', "Failed", 500);
        }
    }
    

}
