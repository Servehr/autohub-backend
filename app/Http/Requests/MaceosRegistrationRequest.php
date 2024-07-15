<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\ValidationException;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;


class MaceosRegistrationRequest extends FormRequest
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
          'firstname' => 'required|string|max:20',
          'lastname' => 'required|string|max:20',
          'middlename' => 'required|string|max:20',
          'phoneno' => 'required|string|max:20',
          'email' => 'required|string|max:35|unique:users',
          'companyName' => 'required',
          'companyAddress' => 'required',
          'specialization' => 'required',
          'yearsIn' => 'integer|required',
          'region' => 'required',
          'city' => 'required',
          'birth' => 'required|date_format:Y-m-d',
          'gender' => 'required|max:10',
          'academic' => 'required',
          'agree' => 'required|boolean',
          'password' => 'required|min:6',
          'confirm_password' => 'required|same:password'
        ];
    }

    public function messages()
    {
        return [
            'firstname.required' => 'Firstname is required',
            'lastname.required' => 'Surname is required',
            'middlename.required' => 'Middlename is required',
            'phoneno.required' => 'Phone Number is required',
            'email.required' => 'Email is required',
            'companyName.required' => 'Company Name is required',
            'companyAddress.required' => 'Company Address is required',
            'specialization.required' => 'Your specialization is required',
            'yearsIn.required' => 'Your years of experience in automobile is required',
            'region.required' => 'Region is required',
            'city.required' => 'City is required',
            'birth.required' => 'Birth date is required',
            'gender.required' => 'Gender is required',
            'academic.required' => 'Academic qualification is required',
            'agree.required' => 'Agree with us to continue',
            'password.required' => 'Provide your password',
            'confirm_password.same' => 'Password do not match'
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
