<?php

namespace App\Http\Controllers\Api\Maceos\Course;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Asked;
use Carbon\Carbon;

use App\Http\Requests\Question\AddFrequentQuestions;
use App\Http\Requests\Question\GetFrequentQuestionRequest;
use App\Http\Requests\Question\UpdateFrequentQuestionRequest;
use App\Http\Requests\Question\DeleteFrequentQuestionRequest;

use App\Traits\ResponseTrait;

class FrequentlyAskedController extends Controller
{
    use ResponseTrait;
    //
    public function frequently_asked($id)
    {
        try 
        {
            //code...
            $all_questions_asked = Asked::where('course_id', $id)->whereNull('deleted_at')->get();
            return $this->sendSuccess(true, "Retrieved all questions", $all_questions_asked, "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }        
    }

    //
    public function create_asked_questions(AddFrequentQuestions $request)
    {
        // try 
        // {
            //code...
            $input = $request->all();
            $new_question = Asked::create($input);          
            return $this->sendSuccess(true, "Question Successfully Created", $new_question, "");
        // } catch (\Throwable $th) {
        //     return $this->sendError('', "Failed", 500);
        // }
    }

    //
    public function get_questions_for_a_course(GetFrequentQuestionRequest $request)
    {
        try 
        {
            //code...
            $input = $request->all();
            $course_question = Asked::where('id', $id)->get();          
            return $this->sendSuccess(true, "Questions Successfully Retrieved", $course_question, "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }        
    }

    //
    public function edit_asked_questions(Request $request)
    {
        // return $this->sendSuccess(true, "Question Successfully Updated", $request->all(), "");
        try 
        {
            //code...
            $input = $request->all();      
            $id = (int)($input['id']);
            $question = $input['question'];
            Asked::where("id", $id)->update(["question" => $question]); 
            return $this->sendSuccess(true, "Question Successfully Updated", $request->question, "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }        
    }

    public function delete_asked_questions($id)
    {
        try 
        {
            //code...;  
            Asked::where('id', $id)->update(['deleted_at' => Carbon::now()]);
            return $this->sendSuccess(true, "Question Successfully Deleted", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

}
