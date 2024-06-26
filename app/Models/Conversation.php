<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Conversation extends Model
{
    protected $table = 'conversations';
    protected $fillable = [
          'id',
          'conversation_id',
          'message',
          'sent_by',
          'created_at',
          'updated_at',
      ];

}
