<?php

namespace App\Http\Controllers\Api\App;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\CarMake;
use App\Models\CarModel;
use App\Models\Category;
use App\Models\Colour;
use App\Models\Condition;
use App\Models\Lga;
use App\Models\Plan;
use App\Models\Product;
use App\Models\State;
use App\Models\Images;
use App\Models\Transmission;
use App\Models\Trim;
use App\Models\User;
use App\Models\Follower;
use App\Notifications\notifyUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Opcodes\LogViewer\Log;

use Intervention\Image\Laravel\Facades\Image;
// use Intervention\Image\ImageManager;
// use Intervention\Image\Drivers\Imagick\Driver;

class AdController extends Controller
{

    function sendImageToServer(Request $request)
    {
        $input = $request->all();
        $image_path = url(env('APP_URL'));
        $all_images = [];

        $imgSplits=explode("<=>", $input['avatar']);
        $imgs=[];
        $startName=Auth::id().rand();

        foreach ($imgSplits as $imgSplit)
        {
            $photo = $startName.uniqid() . ".jpg";
            $decodedImage = base64_decode($imgSplit);
            $path='/product/' . $photo;
            file_put_contents(public_path().'/product/'.$photo, $decodedImage);
            array_push($imgs, url($path));
        }
    }

    function createAd(Request $request)
    {
        // return response()->json(['success' => 0, 'message' => $request->all()]);
        // $hey = $this->checkIfItIsMainImage(1, $request->mainImage);
        // $clip = '';
        // $numbers =
        // if($hey === 1)
        // {
        //     $clip = "Yes";
        // } else {
        //     $clip = "Na wetin dey happen";
        // }
        // return response()->json(['success' => 1, 'message' => 'Ad created successfully', 'data' => $clip]);
        $input = $request->all();
        $rules = array(
            'state' => 'required',
            'category' => 'required',
            'colour' => 'required',
            'year_of_production' => 'required',
            'transmission' => 'required',
            'condition' => 'required',
            'chasis_number' => 'nullable',
            'trim' => 'required',
            'description' => 'required',
            'price' => 'required',
            'avatar' => 'required',
            'plan_id' => 'required',
        );
        $messages = [
            'same' => 'The :attribute and :other must match.',
            'size' => 'The :attribute must be exactly :size.',
            'min' => 'The :attribute value :input is below :min',
            'unique' => 'The :input already exist',
        ];

        $validator = Validator::make($input, $rules, $messages);

        if (!$validator->passes()) {
            return response()->json(['success' => 0, 'message' => implode(",", $validator->errors()->all())]);            
        }

        $plan=Plan::find($input['plan_id']);

        if(!$plan){
            return response()->json(['success' => 0, 'message' => 'Invalid plan ID']);
        }

        if($plan->amount > 0){
            $pid['status'] = "awaiting_payment";
        }

        $all_images = [];
        $imgSplits= $input['avatar'];
        $startName=Auth::id().rand();
        foreach ($imgSplits as $imgSplit)
        {
            $photo = $startName.uniqid() . ".jpg";
            $decodedImage = base64_decode($imgSplit);
            $path='/product/' . $photo;
            file_put_contents(public_path().'/product/'.$photo, $decodedImage);
            array_push($all_images, url($path));
        }

        if($input["others"] != "")
        {
            $newManufacturer = CarMake::create(
              [
                  'code' => $input['manufacturerName'],
                  'title' => $input['manufacturerName']
              ]
            );

            $newModel = CarModel::create(
              [
                  'make_id' => $newManufacturer->id,
                  'code' => $input['modelName'],
                  'title' => $input['modelName']
              ]
            );
        }
        // else {
        //     $pid['make_id']=$input['maker'];
        //     $pid['model_id']=$input['model'];
        // }

        $pid['slug']=uniqid();
        $pid['avatar']=json_encode($all_images);
        $pid['description']=$input['description'];
        $pid['category_id']=$input['category'];
        $pid['state_id']=$input['state'];
        $pid['colour']=$input['colour'];
        $pid['condition_id']=$input['condition'];
        $pid['year_of_production']=$input['year_of_production'];
        $pid['transmission_id']=$input['transmission'];
        $pid['chasis_no']=$input['chasis_number'] ?? '';
        $pid['trim']=$input['trim'];
        $pid['description']=$input['description'];
        $pid['price']=$input['price'];
        $pid['user_id']=Auth::id();
        $pid['plan_id']=$input['plan_id'];
        $pid['draft']=$input['draft'];
        $p=Product::create($pid);

        if($request->others != "")
        {
            $title= $p->year_of_production ." " . $p->colour ." ".$newManufacturer->title." ". $newModel->title;
            Product::where('id', $p->id)->update(["make_id" => $newManufacturer->id, "model_id" => $newModel->id]);
            Product::where('id', $p->id)->update(["title" => $title]);
        } else {
            $make=CarMake::find($input['maker']);
            $model=CarModel::find($input['model']);
            $title= $input['year_of_production'] ." " . $input['colour'] ." ".$make->title." ". $model->title;
            Product::where('id', $p->id)->update(["make_id" => $input['maker'], "model_id" => $input['model']]);
            Product::where('id', $p->id)->update(["title" => $title]);
        }

        $user=User::find(Auth::id());

        $inserted_image_id = [];
        foreach($all_images as $index => $image)
        {
            $img = Images::create([
                'user_id' => Auth::id(),
                'product_id' => $p->id,
                'image_url' => $image
            ]);
            array_push($inserted_image_id, $img->id);
        }

        // $is_cover_page_set = Images::where('user_id', Auth::id())->where('product_id', $p->id)->where('cover_page', 1)->exists();
        // if(!$is_cover_page_set)
        // {
        //     $set_cover_page = Images::where('user_id', Auth::id())->where('product_id', $p->id)->first();
        //     Images::where("id", $set_cover_page->id)->update(["cover_page" => 1]);
        // }
        $getFaceAdvert = Images::where('user_id', Auth::id())->where('product_id', $p->id)->pluck('image_url');
        $imageToUseAsCover = $getFaceAdvert[$request->mainImage];
        Images::where('image_url', $imageToUseAsCover)->where('product_id', $p->id)->update(['cover_page' => 1]);
        $new_cover_page = Images::where('image_url', $imageToUseAsCover)->where('product_id', $p->id)->where(['cover_page' => 1])->first();
        Product::where('id', $p->id)->update(['avatar' => $new_cover_page->image_url]);

        $notifyData['sender']="Autohub";
        $notifyData['message']="Your post has been submitted successfully and you will be notified when approved";

        $user->notify(new notifyUser($notifyData));
        return response()->json(['success' => 1, 'message' => 'Ad created successfully', 'data' =>$p->id, 'draft' => $p->draft]);
    }

    function checkIfItIsMainImage($position, $image)
    {
        return $position === $image ? 1 : 0;
    }


    function productAdvert(Request $request)
    {
        // Images::where('id', $request->imageId)->where('product_id', $request->productId)->update(['as_advert' => 1]);
        // return response()->json(['success' => 1, 'message' => 'Ad created successfully', 'data' => 'Done']);

        $advert_slider = Images::where('id', $request->imageId)->where('as_advert', 1)->get();
        if(count($advert_slider) > 0)
        {
            Images::where('id', $request->imageId)->where('product_id', $request->productId)->update(['as_advert' => 0]);
            return response()->json(['success' => 1, 'message' => 'Face cover successfully updated', 'data' => 'Done']);
        } else {
            Images::where('id', $request->imageId)->where('product_id', $request->productId)->update(['as_advert' => 1]);
            return response()->json(['success' => 1, 'message' => 'Nothing', 'data' => 'Done']);
        }
    }

    function faceAdvert(Request $request)
    {
        $check_for_cover_page = Images::where('product_id', $request->productId)->where('cover_page', 1)->get();
        $how_many = count($check_for_cover_page);
        if($how_many > 0)
        {
            $before_cover_page = $check_for_cover_page[0]->id;
            if($how_many > 1)
            {
                Images::where('productId', $request->productId)->update(['cover_page' => 0]);
            }
            Images::where('id', $before_cover_page)->where('product_id', $request->productId)->update(['cover_page' => 0]);
            Images::where('id', $request->imageId)->where('product_id', $request->productId)->update(['cover_page' => 1]);
            $new_cover_page = Images::where('id', $request->imageId)->where('product_id', $request->productId)->where(['cover_page' => 1])->first();
            Product::where('id', $request->productId)->update(['avatar' => $new_cover_page->image_url]);
            return response()->json(['success' => 1, 'message' => 'Face cover successfully updated', 'data' => $new_cover_page]);
        }
        return response()->json(['success' => 1, 'message' => 'Nothing', 'data' => $check_for_cover_page]);
        // Images::where('id', $request->imageId)->where('product_id', $request->productId)->update(['cover_page' => 1]);
        // $new_cover_page = Images::where('id', $request->imageId)->where('product_id', $request->productId)->where(['cover_page' => 1])->first();
        // return $this->sendSuccess(true, 'New Cover Page set', $new_cover_page);
    }

    function updateAds(Request $request)
    {
        $color = Colour::find($request->colour);
        $carMake = CarMake::find($request->maker);
        $carModel = CarModel::find($request->model);
        $title= $request->year_of_production ." " . $color->name ." ".$carMake->title." ". $carModel->title;
        // return response()->json(['success' => 1, 'message' => 'Product successfully updated', 'data'=>$title]);
        Product::where('id', $request->productId)->update([
            'state_id' => $request->state,
            'category_id' => $request->category,
            'make_id' => $request->maker,
            'model_id' => $request->model,
            'year_of_production' => $request->year_of_production,
            'colour' => $request->colour,
            'transmission_id' => $request->transmission,
            'condition_id' => $request->condition,
            'trim' => $request->trim,
            'description' => $request->description,
            'chasis_no' => $request->chasis_number,
            'price' => $request->price,
            'title' => $title
        ]);
        $data = Product::find($request->productId);
        return response()->json(['success' => 1, 'message' => 'Product successfully updated', 'data'=>$data]);
    }

    function addAnotherProduct(Request $request)
    {
        // return Image::read('water/logo.png');
        // $manager = new ImageManager(new Driver());
        if ($request->hasFile('product'))
        {
            $image_path = url(env('APP_URL'));
            $picture = time().'-'.rand(1,1000000000000000).'-'.$request->product->getClientOriginalName();
            $path = "/product/";
            $request->product->move(public_path($path), $picture);

            // $waterMarkUrl = $manager->read(public_path('water/logo.png'));
            // $waterMarkUrl = public_path('water/logo.png');
            // $image = Image::make(public_path('water/'.$picture));
            // $image->insert($waterMarkUrl, 'bottom-left', 5, 5);
            // $image->save(public_path('water/'.$picture));

            $image_url = url($path.$picture);

            Images::create([
              'user_id' => Auth::id(),
              'product_id' => $request->productId,
              'image_url' => $image_url
            ]);
            $newlyAddedImage = Images::where('product_id', $request->productId)->get();
            return response()->json(['success' => 1, 'message' => 'Product Image successfully updated', 'data'=>$newlyAddedImage]);
        } else {
          return response()->json(['success' => 1, 'message' => 'No Image Found', 'data'=>'']);
        }
    }

    function ChangeProfilePicture(Request $request)
    {
        // return Image::read('water/logo.png');
        // $manager = new ImageManager(new Driver());
        if ($request->hasFile('product'))
        {
            $image_path = url(env('APP_URL'));
            $picture = time().'-'.rand(1,1000000000000000).'-'.$request->product->getClientOriginalName();
            $path = "/avatar/";
            $request->product->move(public_path($path), $picture);

            // $waterMarkUrl = $manager->read(public_path('water/logo.png'));
            // $waterMarkUrl = public_path('water/logo.png');
            // $image = Image::make(public_path('water/'.$picture));
            // $image->insert($waterMarkUrl, 'bottom-left', 5, 5);
            // $image->save(public_path('water/'.$picture));

            $image_url = url($path.$picture);

            User::where('id', Auth::id())->update(['avatar' => $image_url]);
            $changeImage = User::where('id', Auth::id())->pluck('avatar');
            return response()->json(['success' => 1, 'message' => 'Product Image successfully updated', 'data'=>$changeImage]);
        } else {
          return response()->json(['success' => 0, 'message' => 'No Image Found', 'data'=>'']);
        }
    }


    function allUserPrductAds($product_id)
    {
        $userProductImages = Images::where('product_id', $product_id)->get();
        return response()->json(['success' => 1, 'message' => 'operation is ok', 'data'=>$userProductImages]);
    }

    function products($current_page,  $per_page)
    {
        $currentPage = intval($current_page);
    	  $perPage = intval($per_page);
        $totalPages = DB::table('products')->count();
        $noOfPages = round($totalPages/$perPage);
        $hasPreviousPage = (((($currentPage * $perPage)/$perPage) - 1) > 0);
        $hasNextPage = ($noOfPages >= (($currentPage * $perPage)/$perPage) + 1);

        if(((($currentPage * $perPage)/$perPage) < 1) || ($currentPage > $noOfPages))
        {
           return response()->json(['success' => 0, 'message' => 'invalid parameter passed', 'data'=> []]);
        }

        $products = Product::with('lga', 'state', 'category', 'make', 'model', 'condition')->skip(($currentPage - 1) * $perPage)->limit($perPage)->get();
        $pagination['product_advert']['currentPage'] = $currentPage;
        $pagination['product_advert']['perPage']     =  $perPage;
        $pagination['product_advert']['totalPages']  = $totalPages;
        $pagination['product_advert']['noOfPages']   = $noOfPages;
        $pagination['product_advert']['hasPreviousPage']   = $hasPreviousPage;
        $pagination['product_advert']['hasNextPage']   = $hasNextPage;
        $pagination['product_advert']['product']   = $this->allProductSelectedColumn($products);
        return response()->json(['success' => 1, 'message' => 'all products', 'data'=> $pagination]);
        // return response()->json(['success' => 1, 'message' => 'all products', 'data'=> $products]);
    }

    function allProduct()
    {
       $products = Product::with('lga', 'state', 'category', 'make', 'model', 'condition')->latest()->paginate(20);
       return response()->json(['success' => 1, 'message' => 'all products', 'data'=>$this->allProductSelectedColumn($products)]);
    }

    public function allProductSelectedColumn($data)
    {
        if(!is_null($data) || $data->count() > 0)
        {
           $all_faq = $data->map(function($d, $key)
             { return $this->product_response($d); });
           return $all_faq;
        } else {
           return false;
        }
    }

    function singleProduct($product_id)
    {
        $products = Product::where("id", $product_id)->with('images', 'user')->first();
        return response()->json(['success' => 1, 'message' => 'operation is ok', 'data'=>$products]);
    }

    function activateProduct(Request $request)
    {
        $products = Product::where("id", $request->product_id)->update(["status" => "active"]);
        $productStatus = Product::select('status')->where("id", $request->product_id)->first();
        return response()->json(['success' => 1, 'message' => 'operation is ok', 'data'=> $productStatus]);
    }

    function DeActivateProduct(Request $request)
    {
        $products = Product::where("id", $request->product_id)->update(["status" => "inactive"]);
        $productStatus = Product::select('status')->where("id", $request->product_id)->first();
        return response()->json(['success' => 1, 'message' => 'operation is ok', 'data'=> $productStatus]);
    }

    public function product_response($data)
    {
        $response = [
            'id' => $data->id,
            'user' => $data->user->name,
            'title' => $data->title,
            'price' => $data->price,
            'state' => $data->state->name,
            'condition' => $data->condition->name,
            'views' => $data->views,
            'status' => $data->status
        ];
        return $response;
    }

    public function searchProduct($current_page, $per_page, $keyword)
    {
        $query = Product::query();
        $query->where('title', 'LIKE', '%'.$keyword.'%')
              ->orWhere('price', 'LIKE', '%'.$keyword.'%');

        $query->orWhereHas('user', function($q) use ($keyword)
        {
           $q->where('name', 'LIKE', '%'.$keyword.'%');
        });
        $query->orWhereHas('state', function($q) use ($keyword)
        {
           $q->where('name', 'LIKE', '%'.$keyword.'%');
        });
        $query->orWhereHas('condition', function($q) use ($keyword)
        {
           $q->where('name', 'LIKE', '%'.$keyword.'%');
        });

        $perPage = intval($per_page);
        $currentPage = intval($current_page);
        $product = $query->skip(($currentPage - 1) * $perPage)->limit($perPage)->get();
        $totalPages = $product->count();
        $noOfPages = round($totalPages/$perPage);
        $hasPreviousPage = (((($currentPage * $perPage)/$perPage) - 1) > 0);
        $hasNextPage = ($noOfPages >= (($currentPage * $perPage)/$perPage) + 1);


        // if(((($currentPage * $perPage)/$perPage) < 1) || ($currentPage > 0))
        // {
        //    return response()->json(['success' => 0, 'message' => 'invalid parameter passed', 'data'=> []]);
        // }

        // $products = Product::with('lga', 'state', 'category', 'make', 'model', 'condition')->skip(($currentPage - 1) * $perPage)->limit($perPage)->get();
        $pagination['product_advert']['currentPage'] = $currentPage;
        $pagination['product_advert']['perPage']     =  $perPage;
        $pagination['product_advert']['totalPages']  = $totalPages;
        $pagination['product_advert']['noOfPages']   = $noOfPages;
        $pagination['product_advert']['hasPreviousPage']   = $hasPreviousPage;
        $pagination['product_advert']['hasNextPage']   = $hasNextPage;
        $pagination['product_advert']['product']   = $this->allProductSelectedColumn($product);
        return response()->json(['success' => 1, 'message' => 'all products', 'data'=> $pagination]);
    }

    public function publishedPost($currentPage, $perPage)
    {
        $perPagee = intval($perPage);
        $currentPagee = intval($currentPage);
        $products = Product::where('user_id', Auth::id())->where('status', 'active')->where('draft', 'no')->get();
        $totalPages = $products->count();
        $noOfPages = (($totalPages/$perPage) > $currentPagee) ? $currentPagee + 1 : round($totalPages/$perPage);
        $hasPreviousPage = (((($currentPagee * $perPagee)/$perPagee) - 1) > 0);
        $hasNextPage = (($totalPages/$perPage) >= (($currentPagee * $perPagee)/$perPagee));

        // if(((($currentPagee * $perPagee)/$perPagee) < 1) || ($currentPagee > 0))
        // {
        //    return response()->json(['success' => 0, 'message' => 'invalid parameter passed', 'data'=> []]);
        // }
        $product = Product::withCount('messages')->with('lga', 'state', 'category', 'make', 'model', 'condition', 'images', 'messages')->where('user_id', Auth::id())->where('status', 'active')->where('draft', 'no')->skip(($currentPagee - 1) * $perPagee)->limit($perPagee)->orderBy('id', 'DESC')->get();
        $pagination['product_advert']['currentPage'] = $currentPagee;
        $pagination['product_advert']['perPage']     =  $perPagee;
        $pagination['product_advert']['totalPages']  = $totalPages;
        $pagination['product_advert']['noOfPages']   = $noOfPages;
        $pagination['product_advert']['hasPreviousPage']   = $hasPreviousPage;
        $pagination['product_advert']['hasNextPage']   = $hasNextPage;
        $pagination['product_advert']['product'] = $product;  //$this->allProductSelectedColumn($product);
        return response()->json(['success' => 1, 'message' => 'all products', 'data'=> $pagination]);
    }

    public function inActivePost($currentPage, $perPage)
    {
        $perPagee = intval($perPage);
        $currentPagee = intval($currentPage);
        $products = Product::where('user_id', Auth::id())->where('status', 'pending')->where('draft',  'no')->get();
        $totalPages = $products->count();
        $noOfPages = (($totalPages/$perPage) > $currentPagee) ? $currentPagee + 1 : round($totalPages/$perPage);
        $hasPreviousPage = (((($currentPagee * $perPagee)/$perPagee) - 1) > 0);
        $hasNextPage = (($totalPages/$perPage) >= (($currentPagee * $perPagee)/$perPagee));

        // if(((($currentPagee * $perPagee)/$perPagee) < 1) || ($currentPagee > 0))
        // {
        //    return response()->json(['success' => 0, 'message' => 'invalid parameter passed', 'data'=> []]);
        // }
        $product = Product::withCount('messages')->with('lga', 'state', 'category', 'make', 'model', 'condition', 'images', 'messages')->where('user_id', Auth::id())->where('status', 'pending')->where('draft', 'no')->skip(($currentPagee - 1) * $perPagee)->limit($perPagee)->orderBy('id', 'DESC')->get();
        $pagination['product_advert']['currentPage'] = $currentPagee;
        $pagination['product_advert']['perPage']     =  $perPagee;
        $pagination['product_advert']['totalPages']  = $totalPages;
        $pagination['product_advert']['noOfPages']   = $noOfPages;
        $pagination['product_advert']['hasPreviousPage']   = $hasPreviousPage;
        $pagination['product_advert']['hasNextPage']   = $hasNextPage;
        $pagination['product_advert']['product'] = $product;  //$this->allProductSelectedColumn($product);
        return response()->json(['success' => 1, 'message' => 'all inactive product successfully feteched', 'data'=> $pagination]);
    }

    public function draftPost($currentPage, $perPage)
    {
        $perPagee = intval($perPage);
        $currentPagee = intval($currentPage);
        $products = Product::where('user_id', Auth::id())->where('draft', 'yes')->get();
        $totalPages = $products->count();
        $noOfPages = (($totalPages/$perPage) > $currentPagee) ? $currentPagee + 1 : round($totalPages/$perPage);
        $hasPreviousPage = (((($currentPagee * $perPagee)/$perPagee) - 1) > 0);
        $hasNextPage = (($totalPages/$perPage) >= (($currentPagee * $perPagee)/$perPagee));

        // if(((($currentPagee * $perPagee)/$perPagee) < 1) || ($currentPagee > 0))
        // {
        //    return response()->json(['success' => 0, 'message' => 'invalid parameter passed', 'data'=> []]);
        // }
        $product = Product::withCount('messages')->with('lga', 'state', 'category', 'make', 'model', 'condition', 'images', 'messages')->where('user_id', Auth::id())->where('draft', 'yes')->skip(($currentPagee - 1) * $perPagee)->limit($perPagee)->orderBy('id', 'DESC')->get();
        $pagination['product_advert']['currentPage'] = $currentPagee;
        $pagination['product_advert']['perPage']     =  $perPagee;
        $pagination['product_advert']['totalPages']  = $totalPages;
        $pagination['product_advert']['noOfPages']   = $noOfPages;
        $pagination['product_advert']['hasPreviousPage']   = $hasPreviousPage;
        $pagination['product_advert']['hasNextPage']   = $hasNextPage;
        $pagination['product_advert']['product'] = $product;  //$this->allProductSelectedColumn($product);
        return response()->json(['success' => 1, 'message' => 'all inactive product successfully feteched', 'data'=> $pagination]);
    }

    function removeUserProductImage($image_id, $product_id)
    {
        Images::where('id', $image_id)->where('product_id', $product_id)->delete();
        $userProductImages = Images::where('product_id', $product_id)->get();
        return response()->json(['success' => 1, 'message' => 'operation is ok', 'data'=>$userProductImages]);
    }

    function list(){

        $data=Product::where("status", 'active')->with('lga', 'state')->latest()->paginate(20);
        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    function sellablePrice(Request $request)
    {
        Product::where('id', $request->id)->update(["min_price" => $request->minimumPrice, "max_price" => $request->maximumPrice]);
        return response()->json(['success' => 1, 'message' => 'operation is ok', 'data'=> "Update Successful"]);        
    }

    function unpublish(Request $request)
    {
        Product::where('id', $request->id)->update(["status" => "inactive"]);
        return response()->json(['success' => 1, 'message' => 'Product stutus set to unpublushed', 'data'=>'']);
    }

    function categoryWithProductCount()
    {
        return $category = Category::withCount(
            [
               'products'
            ])->get();
    }

    function listByCat($cat_id)
    {
        $data=Category::where("id", $cat_id)->first();
        $data=Product::where(["category_id" => $cat_id, "status" => 'active'])->with('lga', 'state')->latest()->paginate(20);
        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    function allProductsUploaded()
    {
        $data=Product::with('state', 'lga')->where('status', 'active')->where('draft', 'no')->orderBy('id', 'desc')->paginate(8);
        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    function details($id)
    {
        $data=Product::where("id", $id)->with('user', 'category', 'state', 'lga', 'make', 'model', 'messages', 'trans', 'trimD', 'color', 'plan')->first();
        // analytic
        $data->views += 1;
        $data->save();
        $product['product']['detail'] = $data;
        $product['product']['images'] = Images::where('product_id', $data->id)->pluck('image_url');
        $product['product']['vendor_followers'] = $this->following($data->user_id);
        return response()->json(['success' => 1, 'message' => $data->user_id, 'data'=>$product]);

        // $data=Product::where("id", $id)->with('user', 'category', 'state', 'lga', 'make', 'model', 'messages', 'trans', 'trimD', 'color', 'plan')->first();

        // // analytic
        // $data->views += 1;
        // $data->save();

        // return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
        // return "+++++++++++++++99999999999999999";
        //
        // $data=Product::where("id", $id)->with('user', 'category', 'state', 'lga', 'make', 'model', 'messages', 'trans', 'trimD', 'color', 'plan')->first();
        // // analytic
        // $data->views += 1;
        // $data->save();
        // $product['product']['detail'] = $data;
        // $product['product']['images'] = Images::where('product_id', $data->id);
        //
        // return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$product]);
    }

    function deleteAdvert($id)
    {
       Product::where('id', $id)->delete();
       Images::where('product_id', $id)->delete();
       return response()->json(['success' => 1, 'message' => 'Product successfully deleted']);
    }

    function viewDetails($slug)
    {
        // $data=Product::where("slug", $slug)->with('user', 'category', 'state', 'lga', 'make', 'model', 'messages', 'trans', 'trimD', 'color', 'plan')->first();
        // // analytic
        // $data->views += 1;
        // $data->save();
        // return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);

        $data=Product::where("slug", $slug)->with('user', 'category', 'state', 'lga', 'make', 'model', 'messages', 'trans', 'trimD', 'color', 'plan')->first();
        // analytic
        $data->views += 1;
        $data->save();
        $product['product']['detail'] = $data;
        $product['product']['images'] = Images::where('product_id', $data->id)->pluck('image_url');
        $product['product']['vendor_followers'] = $this->following($data->user_id);
        $product['product']['products'] = Product::where(["status" => 'active', 'featured' => 1])->inRandomOrder()->limit(5)->with('lga', 'state', 'category')->get();
        return response()->json(['success' => 1, 'message' => $data->user_id, 'data'=>$product]);
    }

    function userToFollow(Request $request)
    {
        // return response()->json(['success' => 1, 'message' => "Really", 'data'=> "Great"]);
        $input['user'] = Auth::id();
        $input['vendor'] = $request->vendor;
        // return response()->json(['success' => 1, 'message' => "Really", 'data'=> $this->following($request->vendor)]);
        if($this->following($request->vendor) === "Yes")
        {
           Follower::where('user', Auth::id())->where('vendor', $request->vendor)->delete();
           return response()->json(['success' => 1, 'message' => 'Unfollow', 'data'=>$this->following($request->vendor)]);
        } else {
               Follower::create($input);
            // $follow = new Follower();
            // $follow->user = Auth::id();
            // $follow->vendor = $request->vendor;
            // $follow->save();
           return response()->json(['success' => 1, 'message' => 'Following', 'data'=>$this->following($request->vendor)]);
        }
    }

    function following($vendor)
    {
        $isFollowing = DB::table('followers')->where('user', Auth::id())->where('vendor', $vendor)->exists();
        if($isFollowing)
        {
           return "Yes";
        } else {
           return "No";
        }
    }



    function moreFromVendor($id){

        $find=Product::find($id);

        if(!$find){
            return response()->json(['success' => 0, 'message' => 'Invalid Product']);
        }

        $data=Product::where([["status", 'active'], ['user_id', $find['user_id']], ['id', '!=', $id]])->with('lga', 'state')->get();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    function moreFromModel($id){

        $find=Product::find($id);

        if(!$find){
            return response()->json(['success' => 0, 'message' => 'Invalid Product']);
        }

        $data=Product::where([["status", 'active'], ['make_id', $find['make_id']], ['id', '!=', $id]])->with('lga', 'state')->get();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    function search(Request $request){

        $input = $request->all();
        $price = $input['price'] ?? '';
        $category_id = $input['category_id'] ?? '';
        $make_id = $input['make_id'] ?? '';
        $year_of_production = $input['year_of_production'] ?? '';
        $state_id = $input['state_id'] ?? '';
        $featured = $input['featured'] ?? '';
        $description = $input['description'] ?? '';
        $vendor_id = $input['vendor_id'] ?? '';


        $query = Product::OrderBy('id', 'desc')
            ->when(isset($vendor_id) && $vendor_id!='', function ($query) use ($vendor_id) {
                $query->where('user_id', $vendor_id);
            })
            ->when(isset($price) && $price!='', function ($query) use ($price) {
                $query->where('price', 'LIKE', $price);
            })
            ->when(isset($category_id) && $category_id != '', function ($query) use ($category_id) {
                $query->where('category_id', '=', $category_id);
            })
            ->when(isset($make_id) && $make_id!='', function ($query) use ($make_id) {
                $query->where('make_id', '=', $make_id);
            })
            ->when(isset($year_of_production) && $year_of_production!='', function ($query) use ($year_of_production) {
                $query->where('year_of_production', '=', "$year_of_production");
            })
            ->when(isset($state_id) && $state_id!='', function ($query) use ($state_id) {
                $query->where('state_id', $state_id);
            })
            ->when(isset($featured) && $featured!='', function ($query) use ($featured) {
                $query->where('featured', '=', $featured);
            })
            ->when(isset($description) && $description!='', function ($query) use ($description) {
                $query->where('description', 'LIKE', "%$description%")->orwhere('title', 'LIKE', "%$description%");
            })
            ->with('lga', 'state')
            ->where('status','active')
            // ->limit(100)
            // ->get();
            ->paginate(20);

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data' => $query]);
    }

    function imageSlider()
    {
          $sliderImage = Images::with('product')->where('as_advert', 1)->get();
          $response = [];
          for($i = 0; $i < count($sliderImage); $i++)
          {
              $data = [];
              $data['slider']['url'] = $sliderImage[$i];
              $data['slider']['state'] = $this->get_state($sliderImage[$i]->product->state_id);
              $data['slider']['lga'] = $this->get_lga($sliderImage[$i]->product->lga_id);
              array_push($response, $data);
          }
          return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data' => $response]);
    }

    function get_state($id)
    {
        $state = State::where('id', $id)->first();
        return $state->name;
    }

    function get_lga($id)
    {
        $lga = Lga::where('id', $id)->first();
        return $lga->name;
    }

    function sponsored(Request $request){

        $category_id = $input['category_id'] ?? '';

        if($category_id == '') {
            $data = Product::where(["status" => 'active', 'featured' => 1])->inRandomOrder()->limit(20)->with('lga', 'state')->get();
        }else{
            $data = Product::where(["status" => 'active', 'featured' => 1, 'category_id' => $category_id])->inRandomOrder()->limit(20)->with('lga', 'state')->get();
        }
        //  if($category_id == '') {
        //      $data['sponsored'] = Product::where(["status" => 'active', 'featured' => 1])->inRandomOrder()->limit(20)->with('lga', 'state')->get();
        //      $data['category'] = Category::withCount(['products'])->get();
        // }else{
        //      $data['sponsored'] = Product::where(["status" => 'active', 'featured' => 1, 'category_id' => $category_id])->inRandomOrder()->limit(20)->with('lga', 'state')->get();
        //      $data['category'] = Category::withCount(['products'])->get();
        // }

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    function toppicks(){

        $data=Product::where(["status" => 'active', 'exhautic' => 1])->inRandomOrder()->limit(20)->get();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    function stateList(){

        $data=State::where("status", 1)->get();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    function stateLGAList(){

        $st=State::where("status", 1)->get();
        $lg=Lga::get();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>['states'=>$st, 'lgas'=>$lg]]);
    }

    function makerList(){
        $data=CarMake::get();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    function allEnpointForAdvert($product_id)
    {
        $data['maker'] = CarMake::get();
        $data['model'] = CarModel::get();
        $data['userProductDetail'] = Product::where("id", $product_id)->with('images')->first();
        $data['state'] = State::where("status", 1)->get();
        $data['category'] = Category::where("status", 1)->get();
        $data['colour'] = Colour::where("status", 1)->orderBy('name')->get();
        $data['transmission'] = Transmission::where("status", 1)->get();
        $data['condition'] = Condition::where("status", 1)->get();
        $data['trim'] = Trim::where("status", 1)->get();
        return response()->json(['success' => 1, 'message' => 'data successfully fetched', 'data'=>$data]);
    }

    function conditionList(){
        $data=Condition::where("status", 1)->get();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    function transmissionList(){
        $data=Transmission::where("status", 1)->get();
        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    function selectedModel($id)
    {
       $selectedMembers = CarModel::where('make_id', $id);
       return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=> $selectedMembers]);
    }

    function modelList(){
        $data=CarModel::get();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    function trimList(){
        $data=Trim::where("status", 1)->get();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    function categoryList(){
        $data=Category::where("status", 1)->get();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

    function colourList(){
        $data=Colour::where("status", 1)->orderBy('name')->get();

        return response()->json(['success' => 1, 'message' => 'Fetched successfully', 'data'=>$data]);
    }

}
