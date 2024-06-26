<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $table = 'posts';
    protected $fillable = [
          'id',
          'title',
          'user_id',
          'keypoint',
          'content',
          'photos',
          'views',
          'created_at',
          'updated_at',
      ];

  function comments()
  {
      return $this->hasMany(Comment::class, 'post_id', 'id')->with('user')->select('post_id',  'user_id', 'message');
        // return $this->hasMany(Comment::class, 'post_id', 'id')->('user');
  }

  function user()
  {
      return $this->belongsTo(User::class, 'user_id', 'id');
  }

}
