<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Follower extends Model
{
    public $timestamps = false;
    
    protected $table = 'followers';
    protected $fillable = [
          'id',
          'user',
          'vendor',
      ];

}
