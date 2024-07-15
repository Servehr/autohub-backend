<?php

namespace App\Traits;

use App\Models\User;
use App\Models\UserType;
use App\Traits\ResponseTrait;

trait UserTrait
{

     use ResponseTrait;

     public function all_users()
     {
         $users = User::all();
         if(!is_null($users) || $users->count() > 0)
         {
            $message = "User(s) found";
            $all_user = $users->map(function($user, $key)
            { return $this->user_response($user); });
            return $all_user;
         } else {
            return false;
         }
     }

     public function create_user($user_data)
     {
           // $user = UserType::where("id", $type)->exist();
           // if($user){ return true; } else { return false; }
     }

     public function user_type_exist($type)
     {
           $user = UserType::where("id", $type)->exist();
           if($user){ return true; } else { return false; }
     }

     public function find_user($user)
     {
           $user = User::where('id', $user->id)->first();
           if(!is_null($user))
           {
               return $user;
           } else {
               return false;
           }
     }

     public function remove_user($user)
     {
         $find = $this->find_user($user->id);
          if($find)
          {
              $return_user = $find;
              $find->delete();
              return $return_user;
          } else {
              return false;
          }
     }

     public function change_status($id, $status)
     {
         $user = User::where('id', $id)->first();
         if(!is_null($user))
         {
            User::where('id', $id)->update(['status' => $status ]);
            return true;
         } else {
            return false;
         }
     }

     public function change_user_type($id, $user_type)
     {
          $user = User::where('id', $id)->first();
          if(!is_null($user))
          {
             $user_type = UserType::where("id", $user_type);
             User::where('id', $id)->update(['user_type' => $user_type->id ]);
             return true;
          } else {
             return false;
          }
     }




}
