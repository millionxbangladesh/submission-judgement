<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class NewApplicationRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'team_name' => 'required|max:25',
            'team_leader_name' => 'required|max:120',
            'team_leader_mobile' => 'required|digits:11',
            'team_leader_email' => 'required|email',
            'location' => 'required',
            'image' => 'nullable|mimes:png,jpeg,jpg|max:3400',
            'team_members' => 'required|array',
            'team_members.*.name' => 'required|max:150',
            'team_members.*.email' => 'required|email',
            'team_members.*.mobile' => 'required|digits:11',
        ];
    }

    public function messages(): array
    {
        return [
            'team_members.*.name.required' => 'The team member name field is required.',
            'team_members.*.email.required' => 'The team member email field is required.',
            'team_members.*.mobile.required' => 'The team member mobile field is required.',
        ];
    }
}
