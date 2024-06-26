<?php

use App\Models\GeneralSettings;
// use App\Models\User;
// use Illuminate\Support\Str;
use Carbon\Carbon;

if (!function_exists('send_email')) {

    function send_email($to, $name, $subject, $message)
    {
        $gnl = GeneralSettings::first();
        if ($gnl->email_notification == 1) {
            $details = [
                'title' => $name,
                'body' => $message,
                'subject' => $subject
            ];
            \Mail::to($to)->send(new \App\Mail\GiftbillsMail($details));

        }
    }
}

if (! function_exists('convertYmdToMdy')) {
    function convertYmdToMdy($date)
    {
        return Carbon::createFromFormat('Y-m-d', $date)->format('m-d-Y');
    }
}

if (! function_exists('convertMdyToYmd')) {
    function convertMdyToYmd($date)
    {
        return Carbon::createFromFormat('m-d-Y', $date)->format('Y-m-d');
    }
}
