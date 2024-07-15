<?php

namespace App\Http\Requests\Exam;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\ValidationException;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;


class AddExamRequest extends FormRequest
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
            'exam_questionaire_id' => 'integer|required',
            'question' => 'string|required',
            'option_a' => 'integer|required',
            'option_b' => 'integer|required',
            'option_c' => 'integer|required',
            'option_d' => 'integer|required',
            'answer' => 'integer|required'
        ];
    }

    public function messages()
    {
        return [
            'exam_questionaire_id.required' => 'Exam questionaire id is required',
            'question.required' => 'Exam question is required',
            'option_a.required' => 'Exam option a is required',
            'option_b.required' => 'Exam option_b is required',
            'option_c.required' => 'Exam option_c is required',
            'option_d.required' => 'Exam option_d is required',
            'answer.required' => 'Exam answer is required',
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
