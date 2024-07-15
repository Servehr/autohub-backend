<?php

namespace App\Http\Controllers\Api\Maceos;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Http\Requests\Exam\AddExamQuestionRequest;
use App\Http\Requests\Exam\EditExamQuestionRequest;
use App\Http\Requests\Exam\DeleteExamQuestionRequest;

use App\Models\ExamQuestion;
use App\Traits\ResponseTrait;

class ExamQuestionController extends Controller
{   
    use ResponseTrait; 
    //
    public function all_exam_question()
    {
        try 
        {
            //code...
            $exams_questions = ExamQuestion::get();
            return $this->sendSuccess(true, "All exams questions retrieved", $exams_questions, "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function create_exam_question(AddExamQuestionRequest $request)
    {
        try 
        {
            //code...
            $input = $request->all();
            $new_exam_question = ExamQuestion::create($input);          
            return $this->sendSuccess(true, "Exam question successfully created", $new_exam_question, "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function edit_exam_question(EditExamQuestionRequest $request)
    {
        try 
        {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            $name = $input['name'];
            $description = $input['description'];
            ExamQuestion::where('id', $id)->update(['name', $name, 'description' => $description]);    
            return $this->sendSuccess(true, "Exam question successfully updated", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function delete_exam_question(DeleteExamQuestionRequest $request)
    {
        try 
        {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            ExamQuestion::where('id', $id)->update(['deleted_at' => Carbon::now()]);
            return $this->sendSuccess(true, "Exam question successfully deleted", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }


}

