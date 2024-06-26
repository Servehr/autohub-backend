<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Faq;
use App\Models\User;
use App\Models\Conversation_user;
use App\Models\Conversation;
use App\Models\GeneralSettings;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;


class ChatController extends Controller
{

    public function chatList()
    {
        $list = [];
        $sender = DB::table('conversations_users')->where('sender', '=', Auth::user()->id)->select('receiver')->get();
        $receiver = DB::table('conversations_users')->where('receiver', '=', Auth::user()->id)->select('sender')->get();
        foreach ($sender as $value)
        {
            array_push($list, $value->receiver);
        }
        foreach ($receiver as $value)
        {
            array_push($list, $value->sender);
        }
        $result = array();
        foreach ($list as $key => $value)
        {
          if(!in_array($value, $result))
          {
             array_push($result, $value);
           }
        }
        $user = User::whereIn('id', $list)->select('id', 'name')->get();

        // $conversations = User::select(['users.id', 'users.name', 'users.avatar', 'conversations.message', 'conversations.sent_by', 'conversations_users.sender', 'conversations_users.receiver'])
        //           ->join('conversations_users', 'conversations_users.sender', '=', 'users.id')
        //           ->join('conversations', 'conversations.to', '=', 'users.id')
        //           ->where('offers.to', $user->id)
        //           ->get();
        return response()->json(['success' => 1, 'message' => 'operation is ok', 'data'=> $user]);
    }

    public function conversations($id)
    {
        $contacted = Conversation_user::where('sender', $id)->orWhere('receiver', $id)->first();
        if($contacted)
        {
            $conversationId = $contacted->id;
            $conversations = Conversation::where('conversation_id', $conversationId)->get();
            return response()->json(['success' => 1, 'message' => 'converstaion between users', 'data'=> $conversations]);
        }
    }

    public function sendMessage(Request $request)
    {
        $chatMate = DB::table('conversations_users')->where('sender', '=', Auth::user()->id)->Where('receiver', '=', $request->reciever)->first();
        if($chatMate)
        {
            if($chatMate->sender === Auth::user()->id)
            {
               $toUser = $chatMate->receiver;
            } else {
               $toUser = $chatMate->sender;
            }
        } else {
            $chatMate = DB::table('conversations_users')->where('sender', '=', $request->reciever)->Where('receiver', '=', Auth::user()->id)->first();
            if($chatMate->sender === Auth::user()->id)
            {
               $toUser = $chatMate->receiver;
            } else {
               $toUser = $chatMate->sender;
            }
        }
        $input = $request->all();
        $input['conversation_id'] = $chatMate->id;
        $input['sent_by'] = Auth::user()->id;
        $message = Conversation::create($input);
        return response()->json(['success' => 1, 'message' => 'message successfully sent', 'data'=> $message]);
    }

    public function initiateConversation(Request $request)
    {

    }


}
