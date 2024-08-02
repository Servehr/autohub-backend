<?php

namespace App\Http\Controllers\Api\Maceos;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Carbon\Carbon;

use App\Http\Requests\Exam\AddExamQuestionaireRequest;
use App\Http\Requests\Exam\EditQuestionaireExamRequest;
use App\Http\Requests\Exam\DeleteQuestionaireExamRequest;

use App\Models\ExamQuestionaire;
use App\Models\ExamQuestionaireTheory;
use App\Models\ExamQuestionTheory;
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
            $exam_questionaires = ExamQuestionaire::where('type', 'obj')->whereNull('deleted_at')->get();
            return $this->sendSuccess(true, "All exam questionaireaire retrieved", $exam_questionaires, "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function create_exam_questionaire(Request $request)
    {
        try 
        {
            //code...
            $input = $request->all();
            $input['type'] = 'obj';
            $new_exam_questionaire = ExamQuestionaire::create($input);          
            return $this->sendSuccess(true, "Exam questionaire successfully created", $new_exam_questionaire, "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function edit_exam_questionaire(Request $request)
    {
        // return $this->sendSuccess(true, "Exam questionaire successfully updated", $request->all(), "");
            //code...
            $input = $request->all();      
            $id = $input['id'];
            $name = $input['name'];
            $description = $input['description'];
            ExamQuestionaire::where('id', $id)->update(['name' => $name, 'description' => $description]);    
            return $this->sendSuccess(true, "Exam questionaire successfully updated", "", "");
    }

    public function delete_exam_questionaire($id)
    {
        try 
        {
            //code...
            ExamQuestionaire::where('id', $id)->update(['deleted_at' => date("Y-m-d H:i:s")]);
            return $this->sendSuccess(true, "Exam questionaire successfully deleted", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function single_exam_questionaire($id)
    {
        try 
        {
            //code...
            $singleQuestionaire = ExamQuestionaire::where('id', $id)->first();
            return $this->sendSuccess(true, "overviews", $singleQuestionaire, "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    // theory
    public function all_exam_questionaire_theory()
    {
        //code...
        $exam_theory_questionaires = ExamQuestionaire::where('type', 'theory')->whereNull('deleted_at')->get();
        return $this->sendSuccess(true, "All theories exam questionaireaire retrieved", $exam_theory_questionaires, "++");
    }

    public function create_exam_questionaire_theory(Request $request)
    {
        // return $this->sendSuccess(true, "Exam theory questionaire successfully created", $request->all(), "");
        // try 
        // {
            //code...
            $input = $request->all();
            $input['type'] = 'theory';
            $new_theory_exam_questionaire = ExamQuestionaire::create($input);          
            return $this->sendSuccess(true, "Exam theory questionaire successfully created", $new_theory_exam_questionaire, "");
        // } catch (\Throwable $th) {
        //     return $this->sendError('', "Failed", 500);
        // }
    }

    public function edit_exam_questionaire_theory(Request $request)
    {
        try 
        {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            $name = $input['name'];
            $description = $input['description'];
            ExamQuestionaire::where('id', $id)->update(['name' => $name, 'description' => $description]);    
            return $this->sendSuccess(true, "Exam theory questionaire successfully updated", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function delete_exam_questionaire_theory($id)
    {
        try 
        {
            //code...
            ExamQuestionaire::where('id', $id)->update(['deleted_at' => date("Y-m-d H:i:s")]);
            return $this->sendSuccess(true, "Exam theory questionaire successfully deleted", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function single_exam_questionaire_theory($qid)
    {
        try 
        {
            //code...
            $singleQuestion = ExamQuestionaire::where('id', $qid)->first();
            return $this->sendSuccess(true, "Exam Theory Retrievied", $singleQuestion, "");
        } catch (\Throwable $th) {
            //throw $th;
            return $this->sendError('', "Failed", 500);
        }
    }

}
