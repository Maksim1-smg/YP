<?php

namespace App\Http\Controllers;

use App\Exceptions\ApiException;
use App\Http\Requests\User\LoginRequest;
use App\Http\Requests\User\RegistrationRequest;
use App\Http\Requests\User\UpdateRequest;
use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function info() {
        return UserResource::collection([auth()->user()]);
    }

    public function login(LoginRequest $request)
    {
        $user = User::where($request->all())->first();

        if ($user) {
            Auth::login($user);
            return response()->json(['data' => ['user_token' => Auth::user()->login()]]);
        } else {
            throw new ApiException(401, 'Authentication failed');
        }
    }

    public function logout()
    {
        Auth::user()->logout();
        return response()->json(['data' => ['message' => 'logout']]);
    }

    public function user()
    {
        return UserResource::collection(User::all());
    }

    public function add(RegistrationRequest $request)
    {
        $user = User::create(
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

    public function remove($id) {
        User::find($id)->delete();

        return response()->json([
            'data' => [
                'id' => $id,
                'status' => 'removed'
            ]
        ])->setStatusCode(202, 'Removed');
    }

    public function update(UpdateRequest $request, $id) {
        $user = User::find($id)->update(
            [
                'photo_file' => $request->photo_file ? $request->photo_file->store('photos') : null,
            ] + $request->all()
        );

        return response()->json([
            'data' => [
                'id' => $user->id,
                'status' => 'updated'
            ]
        ])->setStatusCode(204, 'Updated');
    }
}
