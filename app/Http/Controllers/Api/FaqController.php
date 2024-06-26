<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Faq;
use App\Models\GeneralSettings;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;


class FaqController extends Controller
{

    public function allFaq()
    {
        $faqs = Faq::all();
        return response()->json(['success'=>false, 'message'=>'All Faqs', 'data'=> $this->dataWorked($faqs)], 200);
    }

    public function dataWorked($faqs)
    {
        if(!is_null($faqs) || $faqs->count() > 0)
        {
           $all_faq = $faqs->map(function($faq, $key)
           { return $this->user_response($faq); });
           return $all_faq;
        } else {
           return false;
        }
    }

    public function user_response($faq)
    {
        $response = [
            'id' => $faq->id,
            'title' => $faq->title,
            'content' => substr($faq->content, 0, 70). " ...", // $faq->content,
            'isOpened' => $faq->isOpened
        ];
        return $response;
    }

    public function faqById($faq_id)
    {
        $newFaq = Faq::where('id', $faq)->first();
        return response()->json(['success'=>false, 'message'=>'Faq successfully fetched', 'data'=> $newFaq], 200);
    }

    public function createFaq(Request $request)
    {
        $newFaq = Faq::create($request->all());
        return response()->json(['success'=>false, 'message'=>'Faq successfully created', 'data'=> $newFaq], 200);
    }

    public function updateFaq(Request $request)
    {
        $updateFaq = Faq::where("id", $request->faqId)->update(["title" => $request->title, 'content' => $request->content, 'isOpened' => $request->isOpened]);;
        $updatedFaq = Faq::where('id', $request->faqId)->first();
        return response()->json(['success'=>false, 'message'=>'Faq successfully updated', 'data'=> $updatedFaq], 200);
    }

    public function deletFaq($id)
    {
        $deletedFaq = Faq::where('id', $id)->first();
        Faq::where('id', $id)->delete();
        return response()->json(['success'=>false, 'message'=>'Faq successfully deleted', 'data'=> $deletedFaq], 200);
    }

    public function chatlist()
    {

    }

    public function conversation()
    {

    }

    public function conversations()
    {

    }

}
