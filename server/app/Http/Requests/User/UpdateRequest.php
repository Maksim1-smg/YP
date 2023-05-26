<?php

namespace App\Http\Requests\User;

use Illuminate\Foundation\Http\FormRequest;

class UpdateRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'name' => 'string|max:32',
            'surname' => 'string|max:32',
            'patronymic' => 'string|max:32',
            'login' => 'string|max:255',
            'password' => 'string|max:255',
            'telephone' => 'string|max:11',
            'photo_file' => 'image|mimes:jpeg,png',
            'role_id' => 'integer',
        ];
    }
}
