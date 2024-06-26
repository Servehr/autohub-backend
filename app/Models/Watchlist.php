<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Watchlist extends Model
{
    use HasFactory;

    protected $fillable=['product_id', 'user_id'];

    function product()
    {
        return $this->belongsTo(Product::class)->with('state');
    }
}
