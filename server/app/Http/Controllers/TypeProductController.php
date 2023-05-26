<?php

namespace App\Http\Controllers;

use App\Models\TypeProduct;
use Illuminate\Http\Request;

class TypeProductController extends Controller
{
    public function type() {
        return response()->json(['data' => TypeProduct::all()]);
    }
}
