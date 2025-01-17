<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Images extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'user_id',
        'product_id',
        'image_url',
        'cover_page'
    ];

    protected $dates = ['deleted_at'];


    public function user()
    {
       return $this->belongsTo(User::class);
    }

    public function product()
    {
       return $this->belongsTo(Product::class);
    }

}
