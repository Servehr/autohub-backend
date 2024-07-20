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

    public function conversations($receiver, $product_id)
    {
        // $contacted = Conversation_user::where('sender', $receiver)->orWhere('receiver', $receiver)->first();
        // if($contacted)
        // {
        //     $conversationId = $contacted->id;
        //     $conversations = Conversation::where('conversation_id', $conversationId)->get();
        //     return response()->json(['success' => 1, 'message' => 'converstaion between users', 'data'=> $conversations]);
        // }
        $conversation = DB::table('conversations')
                                ->join('users', 'conversations.sent_by', '=', 'users.id')
                                ->join('conversations_users', 'conversations.conversation_id', '=', 'conversations_users.conversation_id')
                                 ->select('users.id', 'users.avatar', 'conversations.product_id', 'conversations.message', 'conversations.sent_by', 'received_by', 'conversations_users.conversation_id')
                                 ->where('conversations.product_id', $product_id)
                                 ->get();
        return response()->json(['success' => 1, 'message' => 'message successfully sent', 'data'=> $conversation]);
    }

    public function sendMessage(Request $request)
    {
        $input = $request->all();
        // return response()->json(['success' => 1, 'message' => 'message successfully sent', 'data'=> $input]);
        $userId = (int)$input['receiver'];
        $contacted = Conversation_user::where('sender_id', $userId)->orWhere('receiver_id', $userId)->first();
        // return response()->json(['success' => 1, 'message' => 'converstaion between users', 'data'=> $contacted]);
        $theId = '';
        if(!$contacted)
        {
            $conversation['conversation_id'] = "kroijkfgffgfgfg";
            $conversation['sender_id'] = Auth::user()->id;
            $conversation['receiver_id'] = (int)$input['receiver'];
            $converse = Conversation_user::create($conversation);
            $theId = $converse->conversation_id;
        }

        $convo['product_id'] = (int)$input['productId'];
        $convo['message'] = $input['message'];
        $convo['sent_by'] = Auth::user()->id;
        $convo['received_by'] = (int)$input['receiver'];
        $convo['conversation_id'] = ($contacted->conversation_id === null) ?  '' : $contacted->conversation_id;
        $message = Conversation::create($convo);
        return response()->json(['success' => 1, 'message' => 'message successfully sent', 'data'=> $message]);
    }

    // public function conversations($id)
    // {
    //     $contacted = Conversation_user::where('sender', $id)->orWhere('receiver', $id)->first();
    //     if($contacted)
    //     {
    //         $conversationId = $contacted->id;
    //         $conversations = Conversation::where('conversation_id', $conversationId)->get();
    //         return response()->json(['success' => 1, 'message' => 'converstaion between users', 'data'=> $conversations]);
    //     }
    // }

    public function initiateConversation(Request $request)
    {

    }


}
