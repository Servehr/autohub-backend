<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\ValidationException;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;


class ChangeEmailRequest extends FormRequest
{
  /**
   * Determine if the user is authorized to make this request.
   *
   * @return bool
   */
  public function authorize()
  {
      return true;
  }

  /**
   * Get the validation rules that apply to the request.
   *
   * @return array<string, mixed>
   */
  public function rules()
  {
      return [
          //
          'email' => 'required|string|max:35',
          'password' => 'required|min:8'
      ];
  }

  public function messages()
  {
      return [
        'email.required' => 'Email is required',
        'password.required' => 'Password is required',
      ];
  }

  public function failedValidation(Validator $validator)
  {
      throw new HttpResponseException(response()
      ->json(
              [
                 'status' => 400,
                 'message' => 'Validation Errors',
                 'data' => $validator->errors()
             ]
           )
      );
  }


}
