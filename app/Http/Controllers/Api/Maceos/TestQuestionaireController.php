<?php

namespace App\Http\Controllers\Api\Maceos;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Http\Requests\TestQuestionaire\AddTestQuestionaireRequest;
use App\Http\Requests\TestQuestionaire\EditTestQuestionaireRequest;
use App\Http\Requests\TestQuestionaire\DeleteTestQuestionaireRequest;

use App\Models\TestQuestionaire;
use App\Models\TestQuestionaireTheory;
use App\Traits\ResponseTrait;

class TestQuestionaireController extends Controller
{   
    use ResponseTrait; 
    // objective
    public function all_test_questionaire()
    {
        try 
        {
            //code...
            $test_questionaires = TestQuestionaire::where('type', 'obj')->whereNull('deleted_at')->get();
            return $this->sendSuccess(true, "All tests questionaireaire retrieved", $test_questionaires, "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function create_test_questionaire(Request $request)
    {
        try 
        {
            //code...
            $input = $request->all();
            $input['type'] = 'obj';
            $new_test_questionaire = TestQuestionaire::create($input);          
            return $this->sendSuccess(true, "Test questionaire successfully created", $new_test_questionaire, "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function edit_test_questionaire(Request $request)
    {
        try 
        {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            $name = $input['name'];
            $description = $input['description'];
            TestQuestionaire::where('id', $id)->update(['name' => $name, 'description' => $description]);    
            return $this->sendSuccess(true, "Test questionaire successfully updated", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', "Failed", 500);
        }
    }

    public function delete_test_questionaire($id)
    {
        try 
        {
            //code...
            TestQuestionaire::where('id', $id)->update(['deleted_at' => date("Y-m-d H:i:s")]);
            return $this->sendSuccess(true, "Test questionaire successfully deleted", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
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
            return $this->sendError('', "Failed", 500);
        }
    }

    // theory
    public function all_test_questions_theory()
    {
        // try 
        // {
            //code...
            $test_theory_questionaires = TestQuestionaire::where('type', 'theory')->whereNull('deleted_at')->get();
            return $this->sendSuccess(true, "All theories tests questionaireaire retrieved", $test_theory_questionaires, "");
        // } catch (\Throwable $th) {
        //     return $this->sendError('', "Failed", 500);
        // }
    }

    public function create_test_questions_theory(Request $request)
    {
        // return $this->sendSuccess(true, "Test theory questionaire successfully created", $request->all(), "");
        // try 
        // {
            //code...
            $input = $request->all();
            $input['type'] = 'theory';
            $new_theory_test_questionaire = TestQuestionaire::create($input);          
            return $this->sendSuccess(true, "Test theory questionaire successfully created", $new_theory_test_questionaire, "");
        // } catch (\Throwable $th) {
        //     return $this->sendError('', "Failed", 500);
        // }
    }

    public function edit_test_theory_question(Request $request)
    { 
        // return $this->sendSuccess(true, "Test theory questionaire successfully updated", $request->all(), "");
        // try 
        // {
            //code...
            $input = $request->all();      
            $id = $input['id'];
            $name = $input['name'];
            $description = $input['description'];
            TestQuestionaire::where('id', $id)->update(['name' => $name, 'description' => $description]);    
            return $this->sendSuccess(true, "Test theory questionaire successfully updated", "", "");
        // } catch (\Throwable $th) {
        //     return $this->sendError('', "Failed", 500);
        // }
    }

    public function delete_test_theory_question($id)
    {
        try 
        {
            //code...
            TestQuestionaire::where('id', $id)->update(['deleted_at' => date("Y-m-d H:i:s")]);
            return $this->sendSuccess(true, "Test theory questionaire successfully deleted", "", "");
        } catch (\Throwable $th) {
            return $this->sendError('', $th, 500);
        }
    }

    public function single_test_questions_theory($qid)
    {
        try 
        {
            //code...
            $singleQuestion = TestQuestionaire::where('id', $qid)->first();
            return $this->sendSuccess(true, "Test Theory Retrievied", $singleQuestion, "");
        } catch (\Throwable $th) {
            //throw $th;
            return $this->sendError('', "Failed", 500);
        }
    }

}
