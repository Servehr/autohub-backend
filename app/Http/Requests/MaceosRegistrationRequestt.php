<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\ValidationException;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;


class MaceosRegistrationRequestt extends FormRequest
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
          'user_id' => 'integer|required',
          'companyName' => 'required',
          'companyAddress' => 'required',
          'specialization' => 'required',
          'yearsIn' => 'integer|required',
          'region' => 'required',
          'city' => 'required',
        //   'birth' => 'required|date_format:d-m-Y',
          'gender' => 'required|max:10',
          'academic' => 'required',
        ];
    }

    public function messages()
    {
        return [
            'user_id.required' => 'User Id is required',
            'companyName.required' => 'Company Name is required',
            'companyAddress.required' => 'Company Address is required',
            'specialization.required' => 'Your specialization is required',
            'yearsIn.required' => 'Your years of experience in automobile is required',
            'region.required' => 'Region is required',
            'city.required' => 'City is required',
            'birth.required' => 'Birth date is required',
            'gender.required' => 'Gender is required',
            'academic.required' => 'Academic qualification is required',
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
