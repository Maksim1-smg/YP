<?php

namespace App\Http\Controllers;

use App\Http\Requests\Product\AddProductRequest;
use App\Http\Resources\ProductResource;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;

class ProductController extends Controller
{
    public function product() {
        return ProductResource::collection(Product::all());
    }

    public function add(AddProductRequest $request)
    {
        $user = Product::create(
            [
                'photo_file' => $request->photo_file ?
                    'http://store/storage/app/' . $request->photo_file->store('public/images/users') :
                    'http://store/storage/app/public/images/users/default.png',
            ] + $request->all()
        );

        return response()->json([
            'data' => [
                'id' => $user->id,
                'status' => 'created'
            ]
        ])->setStatusCode(201, 'Created');
    }

    public function category($category) {
        return ProductResource::collection(Product::where('id_type_product', $category)->get());
    }
}
