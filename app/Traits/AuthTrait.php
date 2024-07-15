<?php

    namespace App\Traits;

    trait AuthTrait
    {

        public function auth_response($user)
        {
            $response = [
                'id' => $user->id,
                'firstname' => $user->firstname,
                'surname' => $user->surname,
                'phone' => $user->phone,
                'email' => $user->email
            ];
            return $response;
        }

        public function auth_responses($user)
        {
            $response = [
                'id' => $user->id,
                'firstname' => $user->firstname,
                'surname' => $user->surname,
                'phone' => $user->phone,
                'email' => $user->email,
                'reviewed' => $user->reviewed
            ];
            return $response;
        }

        public function user_response($user)
        {
            $response = [
                'id' => $user->id,
                'firstname' => $user->firstname,
                'surname' => $user->surname,
                'phone' => $user->phone,
                'email' => $user->email
            ];
            return $response;
        }

        public function user_roles($permissions)
        {
            $user_permissions = [];
            foreach($permissions as $permission)
            {
               array_push($user_permissions, $permission);
            }
            return $user_permissions;
        }

        public function images($image)
        {
            $response = [
                'image_url' => $image->image_url,
            ];
            return $response;
        }

        public function login_response($user)
        {
            $response = [
                'id' => $user->id,
                'firstname' => $user->firstname,
                'surname' => $user->surname
            ];
            return $response;
        }

     }
