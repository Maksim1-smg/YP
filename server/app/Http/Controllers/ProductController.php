<?php

namespace App\Http\Controllers;

use App\Http\Resources\ProductResource;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;

class ProductController extends Controller
{
    public function product() {
        return ProductResource::collection(Product::all());
    }

    public function category($category) {
        return ProductResource::collection(Product::where('id_type_product', $category)->get());
    }
}
