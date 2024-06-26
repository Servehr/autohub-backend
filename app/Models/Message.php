<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    use HasFactory;

    protected $guarded=[];

    function product(){
        return $this->belongsTo(Product::class, "product_id")->select('id', 'user_id', 'avatar', 'title', 'description', 'category_id', 'views', 'featured', 'price', 'slug')->with('category');
    }

    function vendor(){
        return $this->belongsTo(User::class, "vendor_id");
    }

    function user(){
        return $this->belongsTo(User::class, "user_id");
    }
}
