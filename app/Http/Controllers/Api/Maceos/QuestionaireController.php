<?php

namespace App\Http\Controllers\Api\Maceos;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\TestQuestionaire;
use App\Models\ExamQuestionaire;

use App\Traits\ResponseTrait;


class QuestionaireController extends Controller
{
    //
    use ResponseTrait; 

    public function all_test_questionare()
    {
        try 
        {
            //code...            
            $test_questions = TestQuestionaire::all();
            return $this->sendSuccess(true, "overviews", $test_questions, "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function create_test_questionaire()
    {
        try 
        {
            //code...
            $testQuestion = TestQuestionaire::create($request->all());
            return $this->sendSuccess(true, "overviews", $testQuestion, "");           
        } catch (\Throwable $th) {
            //throw $th;
            return $this->sendError('', "Failed", 500);
        }
    }

    public function update_test_questionaire(Request $request)
    {
        try 
        {
            //code...
            $updateTestQuestion = TestQuestionaire::where("id", $request->qId)->update(
                [
                    "name" => $request->name, 
                    'description' => $request->description
                ]
            );
            $updatedTestQ = TestQuestionaire::where('id', $request->qId)->first();
            return $this->sendSuccess(true, "overviews", $updatedTestQ, ""); 
        } catch (\Throwable $th) {
            //throw $th;
            return $this->sendError('', "Failed", 500);
        }
    }

    public function single_test_questionaire($qid)
    {
        try 
        {
            //code...
            $singleQuestion = TestQuestionaire::where('id', $qid)->first();
            return $this->sendSuccess(true, "overviews", $singleQuestion, "");
        } catch (\Throwable $th) {
            //throw $th;
        }
    }

    public function delete_test_questionaire()
    {
        try 
        {
            //code...
        } catch (\Throwable $th) {
            //throw $th;
        }
    }

    public function search_test_questionaire()
    {
        try 
        {
            //code...
        } catch (\Throwable $th) {
            //throw $th;
        }
    }

    
    //
    public function all_exam_questionare()
    {
        try 
        {
            //code...            
            $exam_questions = ExamQuestionaire::all();
            return $this->sendSuccess(true, "overviews", $test_questions, "");
        } catch (\Throwable $th) {
            //throw $th;
        }
    }

    public function create_exam_questionaire()
    {
        try 
        {
            //code...
        } catch (\Throwable $th) {
            //throw $th;
        }
    }

    public function update_exam_questionaire()
    {
        try 
        {
            //code...
        } catch (\Throwable $th) {
            //throw $th;
        }
    }

    public function single_exam_questionaire()
    {
        try 
        {
            //code...
        } catch (\Throwable $th) {
            //throw $th;
        }
    }

    public function delete_exam_questionaire()
    {
        try 
        {
            //code...
        } catch (\Throwable $th) {
            //throw $th;
        }
    }

    public function search_exam_questionaire()
    {
        try 
        {
            //code...
        } catch (\Throwable $th) {
            //throw $th;
        }
    }

}
