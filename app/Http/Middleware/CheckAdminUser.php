<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\User;
use Illuminate\Http\Request;

class CheckAdminUser
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if (auth()->user()){
            if (auth()->user()->status != 'active') {
                return response()->json(['success' => 0, 'message' => 'Your Account is currently Inactive. Kindly Contact Support!']);
            }

            if(auth()->user()->admin == 1)
            {
                return $next($request);
            }else{
                return response()->json(['success' => 0, 'message' => 'Accessn Not Authorized.']);
            }

        }else{
            return response()->json(['success' => 0, 'message' => 'Unauthorized. Login Required.'], 401);
        }
    }
}
