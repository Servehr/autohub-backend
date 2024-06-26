<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Conversation_user extends Model
{
    protected $table = 'conversations_users';
    protected $fillable = [
          'id',
          'conversation_id',
          'sender_id',
          'receiver_id',
          'created_at',
          'updated_at',
      ];

}
