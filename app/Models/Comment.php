<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    protected $table = 'comments';
    protected $fillable = [
          'id',
          'post_id',
          'user_id',
          'message',
          'created_at',
          'updated_at',
      ];
    

    function user()
    {
        return $this->hasOne(User::class, 'id', 'user_id');
    }

}
