<?php

    namespace App\Traits;
    

    trait ResponseTrait
    {

        public function sendSuccess($trueOrFalse, $message, $response, $additions = '')
        {
            $response = [
                'status' => 200,
                'success' => $trueOrFalse,
                'message' => $message,
                'data' => $response,
                'plus' => $additions
            ];
            return response()->json($response, 200);
        }

        public function sendStackError($error, $code = 404)
        {
        	   $response = [
                'status' => $code,
                'success' => false,
                'message' => $error,
                'stack' => $error
            ];
            return response()->json($response, $code);
        }

        public function sendError($error = '', $message, $code = 404)
        {
        	   $response = [
                'status' => $code,
                'message' => $message,
                'error' => $error
            ];
            return response()->json($response, $code);
        }

}
