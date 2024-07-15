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
    public function frequently_asked()
    {
        try 
        {
            //code...
            $all_questions_asked = Asked::get();
            return $this->sendSuccess(true, "Retrieved all questions", $all_questions_asked, "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }        
    }

    //
    public function create_asked_questions(AddFrequentQuestions $request)
    {
        try 
        {
            //code...
            $input = $request->all();
            $new_question = Asked::create($input);          
            return $this->sendSuccess(true, "Question Successfully Created", $new_question, "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
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
    public function edit_asked_questions(UpdateFrequentQuestionRequest $request)
    {
        try 
        {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            $question = $input['question'];
            $description = $input['description'];
            Asked::where('id', $id)->update(['name', $name, 'question' => $question]);    
            return $this->sendSuccess(true, "Question Successfully Updated", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }        
    }

    public function delete__asked_questions(DeleteFrequentQuestionRequest $request)
    {
        try 
        {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            Course::where('id', $id)->delete();
            return $this->sendSuccess(true, "Question Successfully Deleted", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

}
