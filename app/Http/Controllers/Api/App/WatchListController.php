<?php

namespace App\Http\Controllers\Api\App;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Watchlist;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class WatchListController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        $data=Watchlist::where("user_id", Auth::id())->with('product')->get();

        return response()->json(['success' => 1, 'message' => 'Action successful', 'data'=>$data]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $input = $request->all();
        $rules = array(
            'product_id' => 'required',
        );

        // return $request->all();

        $validator = Validator::make($input, $rules);

        if (!$validator->passes()) {
            return response()->json(['success' => 0, 'message' => implode(",", $validator->errors()->all())]);
        }

        $pcheck=Product::find($input['product_id']);

        if(!$pcheck){
            return response()->json(['success' => 0, 'message' => "Kindly use valid product ID"]);
        }

        $find=Watchlist::where("product_id",$input['product_id'])->where("user_id",Auth::id())->first();

        if($find){
            Watchlist::where("product_id",$input['product_id'])->where("user_id",Auth::id())->delete();
            return response()->json(['success' => 1, 'message' => 'Item removed from watch list']);
        } else {
            $input['user_id']=Auth::id();
            Watchlist::create($input);
            return response()->json(['success' => 1, 'message' => 'Added successfully']);
        }

    }

    public function product($product_id)
    {

        $find=Watchlist::where([["product_id",$product_id], ["user_id",Auth::id()]])->first();

        if(!$find){
            return response()->json(['success' => 0, 'message' => 'Does not exist yet']);
        }

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data' =>$find]);

    }

    public function userWatchList($currentPage, $perPage)
    {
         $allUserProductWatchList = WatchList::where('user_id', Auth::id())->pluck('product_id');
        //  return response()->json(['success' => 1, 'message' => 'All Wish List', 'data'=> $allUserProductWatchList]);

        //  $products = Product::with('images')->whereIn('id', $allUserProductWatchList)->get();
        //  return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data' =>$products]);
        
        $perPagee = intval($perPage);
        $currentPagee = intval($currentPage);
        $wishLists = WatchList::where('user_id', Auth::id())->get();
        $totalPages = $wishLists->count();
        $noOfPages = (($totalPages/$perPage) > $currentPagee) ? $currentPagee + 1 : round($totalPages/$perPage);
        $hasPreviousPage = (((($currentPagee * $perPagee)/$perPagee) - 1) > 0);
        $hasNextPage = (($totalPages/$perPage) >= (($currentPagee * $perPagee)/$perPagee));

        // if(((($currentPagee * $perPagee)/$perPagee) < 1) || ($currentPagee > 0))
        // {
        //    return response()->json(['success' => 0, 'message' => 'invalid parameter passed', 'data'=> []]);
        // }
        $wishes = Product::with('images')->whereIn('id', $allUserProductWatchList)->skip(($currentPagee - 1) * $perPagee)->limit($perPagee)->orderBy('id', 'DESC')->get();
        $pagination['product_advert']['currentPage'] = $currentPagee;
        $pagination['product_advert']['perPage']     =  $perPagee;
        $pagination['product_advert']['totalPages']  = $totalPages;
        $pagination['product_advert']['noOfPages']   = $noOfPages;
        $pagination['product_advert']['hasPreviousPage']   = $hasPreviousPage;
        $pagination['product_advert']['hasNextPage']   = $hasNextPage;
        $pagination['product_advert']['wishList'] = $wishes;  //$this->allProductSelectedColumn($product);
        return response()->json(['success' => 1, 'message' => 'All Wish List', 'data'=> $pagination]);
    
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        $data=Watchlist::where([["user_id", Auth::id()], ["id", $id]])->with('product')->first();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        $wcheck=Watchlist::where([["user_id", Auth::id()], ["product_id", $id]])->first();

        if(!$wcheck){
            return response()->json(['success' => 0, 'message' => "Watchlist not found"]);
        }

        $wcheck->delete();

        return response()->json(['success' => 1, 'message' => 'Removed successfully']);
    }

    public function removeWishList($id)
    {
        $wcheck=Watchlist::where([["user_id", Auth::id()], ["product_id", $id]])->first();

        if(!$wcheck){
            return response()->json(['success' => 0, 'message' => "Watchlist not found"]);
        }

        $wcheck->delete();

        return response()->json(['success' => 1, 'message' => 'Removed successfully']);
    }

}
