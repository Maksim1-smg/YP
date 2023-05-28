<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $table= 'product';

    protected $fillable = [
        'name',
        'model',
        'photo_file',
        'rate',
        'price',
        'amount',
        'description',
        'id_type_product',
    ];

    public function type() {
        return $this->belongsTo(TypeProduct::class, 'id_type_product');
    }
}
