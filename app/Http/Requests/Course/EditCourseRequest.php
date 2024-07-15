<?php

namespace App\Http\Requests\Course;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\ValidationException;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;


class EditCourseRequest extends FormRequest
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
            'id' => 'integer|required',
            'course_name' => 'string|required',
            'description' => 'string|required'
        ];
    }

    public function messages()
    {
        return [
            'id.required' => 'Course id is required',
            'course_name.required' => 'Course name is required',
            'description.required' => 'Course description is required',
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
