<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

//login / logout / reg
Route::controller(\App\Http\Controllers\UserController::class)->group(function () {
    Route::post('/login',  'login');
    Route::post('/reg', 'add');
    Route::middleware('auth:api')->get('/logout',  'logout');
    Route::middleware('auth:api')->get('/info',  'info');
});

//admin
Route::middleware(['auth:api', 'role:admin'])->group(function () {
    //user action
    Route::controller(\App\Http\Controllers\UserController::class)->group(function () {
        Route::get('/user', 'user');
        Route::get('/user/{id}/remove', 'remove');
        Route::post('/user/{id}/update', 'update');
    });
});

//admin / manager
Route::middleware(['auth:api', 'role:admin|manager'])->group(function () {
    //product action
    Route::controller(\App\Http\Controllers\ProductController::class)->group(function () {
        Route::post('/product/add', 'add');
    });
});

//all user
Route::controller(\App\Http\Controllers\ProductController::class)->group(function () {
    Route::get('/product', 'product');
    Route::get('/product/{category}', 'category');
});
Route::get('/category', [\App\Http\Controllers\TypeProductController::class, 'type']);

//auth
Route::middleware('auth:api')->group(function () {
   Route::controller(\App\Http\Controllers\UserController::class)->group(function () {
       Route::post('/user/avatar', 'avatar');
   });
});
