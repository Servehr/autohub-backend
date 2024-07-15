<?php

namespace App\Http\Controllers\Api\Maceos;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Http\Requests\Exam\AddExamQuestionaireRequest;
use App\Http\Requests\Exam\EditQuestionaireExamRequest;
use App\Http\Requests\Exam\DeleteQuestionaireExamRequest;

use App\Models\ExamQuestionaire;
use App\Traits\ResponseTrait;

class ExamQuestionaireController extends Controller
{  
    use ResponseTrait;  
    //
    public function all_exam_questionaire()
    {
        try 
        {
            //code...
            $exams_questionaire = ExamQuestionaire::get();
            return $this->sendSuccess(true, "All exams questionaire retrieved", $exams_questionaire, "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function create_exam_questionaire(AddExamQuestionaireRequest $request)
    {
        try 
        {
            //code...
            $input = $request->all();
            $new_exams_questionaire = ExamQuestionaire::create($input);          
            return $this->sendSuccess(true, "Exam questionaire successfully created", $new_exams_questionaire, "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function edit_exam_questionaire(EditExamQuestionaireRequest $request)
    {
        try 
        {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            $name = $input['name'];
            $description = $input['description'];
            ExamQuestionaire::where('id', $id)->update(['name', $name, 'description' => $description]);    
            return $this->sendSuccess(true, "Exam questionaire successfully updated", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function delete_exam_questionaire(DeleteExamQuestionaireRequest $request)
    {
        try 
        {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            ExamQuestionaire::where('id', $id)->update(['deleted_at' => Carbon::now()]);
            return $this->sendSuccess(true, "Exam question successfully deleted", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }


}
