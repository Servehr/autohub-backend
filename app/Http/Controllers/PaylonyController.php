<?php

namespace App\Http\Controllers;

use App\Jobs\ResellerPaylonyJob;
use App\Models\Payment;
use App\Models\VirtualAccountClient;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class PaylonyController extends Controller
{

//{
//"status": "00",
//"currency": "NGN",
//"amount": "5000",
//"fee": "50",
//"receiving_account": "1010011220",
//"sender_account_name": "Tolulope Oyeniyi",
//"sender_account_number": "00012302099",
//"sender_bank_code": "999999",
//"sender_narration": "Gift bills deposit",
//"sessionId": "0000929120221226145000",
//"trx": "202212261450837964477",
//"reference": "Vfd-x-20221226145000",
//"channel": "bank_transfer",
//"type": "reserved_account",
//"domain": "test",
//"gateway": "vfd"
//}

    public function index(Request $request)
    {
        $input = $request->all();

        $data2 = json_encode($input);

        try {
            DB::table('tbl_webhook_paylony')->insert(['payment_reference' => $input['reference'], 'payment_id' => $input['trx'], 'status' => $input['status'], 'amount' => $input['amount'], 'fees' => $input['fee'], 'receiving_account' => $input['receiving_account'], 'paid_at' => Carbon::now(), 'channel' => $input['channel'], 'remote_address' => $_SERVER['REMOTE_ADDR'], 'extra' => $data2]);
        } catch (\Exception $e) {
            Log::info("Paylony crashed. - " . $data2);
        }

        if($input['status'] != "00"){
            return "invalid payment status";
        }

        // find ref match
        $vac = Payment::where('reference', $input['reference'])->first();

        if ($vac) {
            $vac->status=1;
            $vac->save();

            return "success";
        }

        return "success but acct not found";
    }
}
