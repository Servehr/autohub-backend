<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Faq;
use App\Models\User;
use App\Models\Post;
use App\Models\Product;
use App\Models\Comment;
use App\Models\Conversation_user;
use App\Models\Conversation;
use App\Models\Message;
use App\Models\Talks;
use App\Models\GeneralSettings;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;


class PostController extends Controller
{

    public function postBlog(Request $request)
    {
        $input = $request->all();
        if ($request->hasFile('postImage'))
        {
            $image_path = url(env('APP_URL'));
            $postImage = time().'-'.rand(1,1000000000000000).'-'.$request->postImage->getClientOriginalName();
            $path = "/posts/";
            $request->postImage->move(public_path($path), $postImage);
            $image_url = url($path.$postImage);

            $input['photos'] = $image_url;
            $input['user_id'] = Auth::id();

            Post::create($input);
            return response()->json(['success' => 1, 'message' => 'Product successfully creeated', 'data'=> 'Post successfully created']);
        } else {
          return response()->json(['success' => 1, 'message' => 'No Image Found', 'data'=>'']);
        }
        // $conversations = User::select(['users.id', 'users.name', 'users.avatar', 'conversations.message', 'conversations.sent_by', 'conversations_users.sender', 'conversations_users.receiver'])
        //           ->join('conversations_users', 'conversations_users.sender', '=', 'users.id')
        //           ->join('conversations', 'conversations.to', '=', 'users.id')
        //           ->where('offers.to', $user->id)
        //           ->get();
    }

    public function editBlog(Request $request)
    {
        $input = $request->all();
        if ($request->hasFile('postImage'))
        {
            $image_path = url(env('APP_URL'));
            $postImage = time().'-'.rand(1,1000000000000000).'-'.$request->postImage->getClientOriginalName();
            $path = "/posts/";
            $request->postImage->move(public_path($path), $postImage);
            $image_url = url($path.$postImage);

            Post::where('id', $request->postId)->update([
                "title" => $request->title,
                "photos" => $image_url ,
                "point" => $request->point,
                "content" => $request->content
            ]);
            return response()->json(['success' => 1, 'message' => 'Product Image successfully updated', 'data'=> 'Post successfully updated']);
        } else {
          return response()->json(['success' => 1, 'message' => 'No Image Found', 'data'=>'']);
        }
        // $conversations = User::select(['users.id', 'users.name', 'users.avatar', 'conversations.message', 'conversations.sent_by', 'conversations_users.sender', 'conversations_users.receiver'])
        //           ->join('conversations_users', 'conversations_users.sender', '=', 'users.id')
        //           ->join('conversations', 'conversations.to', '=', 'users.id')
        //           ->where('offers.to', $user->id)
        //           ->get();

    }

    public function deleteBlog($id)
    {
        $postToDelete = Post::find($id);
        Post::where('id', $id)->delete();
        return response()->json(['success' => 1, 'message' => 'post successfully deleted', 'data'=> $postToDelete]);
    }

    public function viewBlogs()
    {
        $allBlogs = Post::withCount('comments')->with('comments', 'user')->paginate(20);
        return response()->json(['success' => 1, 'message' => 'All posts', 'data'=> $allBlogs]);
    }

    public function viewBlog($current_page,  $per_page)
    {
        $currentPage = intval($current_page);
    	  $perPage = intval($per_page);
        $totalPages = DB::table('posts')->count();
        $noOfPages = round($totalPages/$perPage);
        $hasPreviousPage = (((($currentPage * $perPage)/$perPage) - 1) > 0);
        $hasNextPage = ($noOfPages >= (($currentPage * $perPage)/$perPage) + 1);

        // if(((($currentPage * $perPage)/$perPage) < 1) || ($currentPage > $noOfPages))
        // {
        //    return response()->json(['success' => 0, 'message' => 'invalid parameter passed', 'data'=> []]);
        // }

        $posts = Post::withCount('comments')->with('comments', 'user')->skip(($currentPage - 1) * $perPage)->limit($perPage)->get();
        // return $posts;
        $pagination['data']['currentPage'] = $currentPage;
        $pagination['data']['perPage']     =  $perPage;
        $pagination['data']['totalPages']  = $totalPages;
        $pagination['data']['noOfPages']   = $noOfPages;
        $pagination['data']['hasPreviousPage']   = $hasPreviousPage;
        $pagination['data']['hasNextPage']   = $hasNextPage;
        $pagination['data']['posts']   = $this->allProductSelectedColumn($posts); //substr($posts, 1, 50); //Str::words($posts, '50');
        return response()->json(['success' => 1, 'message' => 'all products', 'response'=> $pagination]);
    }

    public function faqAndProduct()
    {
        $data['product'] = Product::where(["status" => 'active', "featured" => 1])->inRandomOrder()->limit(5)->with('lga', 'state', 'category')->get();
        $data['faq'] = Faq::inRandomOrder()->limit(5)->get();
        $data['comments'] = Message::with('product')->inRandomOrder()->limit(10)->get();
        return response()->json(['success' => 1, 'message' => 'blog page', 'response'=> $data]);
    }

    public function blogDetail($post_id)
    {
        $data['post'] = Post::withCount(['comments'])->where('id', $post_id)->with('comments', 'user')->first();
        $data['product'] = Product::where(["status" => 'active', "featured" => 1])->inRandomOrder()->limit(5)->with('lga', 'state', 'category', 'image')->get();
        $data['faq'] = Faq::inRandomOrder()->limit(5)->get();
        $data['comments'] = Message::with('product')->inRandomOrder()->limit(10)->get();
        return response()->json(['success' => 1, 'message' => 'blog page', 'response'=> $data]);
    }

    public function blogComment(Request $request)
    {
        $data['post_id'] = $request->id;
        $data['user_id'] = Auth::id();
        $data['message'] = $request->comment;
        Comment::create($data) ;
        return response()->json(['success' => 1, 'message' => 'user commented on a post', 'response'=> $data]);
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

    public function product_response($data)
    {
        $response = [
            'id' => $data->id,
            'photos' => $data->photos,
            'title' => $data->title,
            'keypoint' => Str::words($data->keypoint, '50'), // $data->keypoint, // $this->breadWord($data->keypoint), //$data->keypoint, //Str::words($data, '50'), //$this->breadWord($data->content),
            'point' => Str::words($data->keypoint, '3'),
            'views' => $data->views,
            'user' => $data->user->name,
            'comment_count' => $data->comments_count,
            'created_at' => $this->theDate($data),
            'updated_at' => $this->theDate($data)
        ];
        return $response;
    }

    public function theDate($data)
    {
       $date = new Carbon($data->created_at);
       return $date->toDateString();
    }

    public function breadWord($data)
    {
       $limitedWord = Str::words($data, '20');
       return wordwrap($limitedWord, 35, " </br>", TRUE);
    }

    public function viewSingleBlog($post_id)
    {
        $singleBlog = Post::withCount(['comments'])->where('id', $post_id)->with('comments', 'user')->first();
        // return $singleBlog;
        return response()->json(['success' => 1, 'message' => 'post successfully retrieved', 'data'=> $singleBlog]);
    }

    public function postComment(Request $request)
    {
        $postedComment = new Comment();
        $postedComment->post_id = $request->postId;
        $postedComment->message = $request->message;
        $postedComment->user_id = Auth::id();
        $postedComment->save();
        return response()->json(['success' => 1, 'message' => 'comment successfully sent', 'data'=> $postedComment]);
    }

    public function getPostComments($post_id)
    {
        $postedComment = Comment::where('post_id', $post_id)->get();
        return response()->json(['success' => 1, 'message' => 'All comment on post', 'data'=> $postedComment]);
    }

    public function searchPosts($current_page, $per_page, $keyword)
    {
        $query = Post::query();
        $query->where('title', 'LIKE', '%'.$keyword.'%')
              ->orWhere('content', 'LIKE', '%'.$keyword.'%')
              ->with('comments');
        // return response()->json(['success' => 1, 'message' => 'all products', 'data'=> $query->get()]);

        $perPage = intval($per_page);
        $currentPage = intval($current_page);
        $product = $query->skip(($currentPage - 1) * $perPage)->limit($perPage)->get();
        $totalPages = $product->count();
        $noOfPages = round($totalPages/$perPage);
        $hasPreviousPage = (((($currentPage * $perPage)/$perPage) - 1) > 0);
        $hasNextPage = ($noOfPages >= (($currentPage * $perPage)/$perPage) + 1);

        $pagination['product_advert']['currentPage'] = $currentPage;
        $pagination['product_advert']['perPage']     =  $perPage;
        $pagination['product_advert']['totalPages']  = $totalPages;
        $pagination['product_advert']['noOfPages']   = $noOfPages;
        $pagination['product_advert']['hasPreviousPage']   = $hasPreviousPage;
        $pagination['product_advert']['hasNextPage']   = $hasNextPage;
        $pagination['product_advert']['product']   = $this->postSelectedColumn($product);
        return response()->json(['success' => 1, 'message' => 'all products', 'data'=> $pagination]);
    }

    public function postSelectedColumn($data)
    {
        if(!is_null($data) || $data->count() > 0)
        {
           $all_faq = $data->map(function($d, $key)
             { return $d; });
           return $all_faq;
        } else {
           return false;
        }
    }

    public function post_response($data)
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

    public function fetchDataFrom($current_page, $per_page, $from)
    {
        if($from === 'blog')
        {
            // if($keyword != "" || $keyword != undefined || $keyword != null)
            // {
            //
            // } else {
                  $currentPage = intval($current_page);
                  $perPage = intval($per_page);
                  $totalPages = DB::table('posts')->count();
                  $noOfPages = round($totalPages/$perPage);
                  $hasPreviousPage = (((($currentPage * $perPage)/$perPage) - 1) > 0);
                  $hasNextPage = ($noOfPages >= (($currentPage * $perPage)/$perPage) + 1);

                  $posts = Post::withCount('comments')->with('comments', 'user')->skip(($currentPage - 1) * $perPage)->limit($perPage)->get();
                  $pagination['data']['currentPage'] = $currentPage;
                  $pagination['data']['perPage']     =  $perPage;
                  $pagination['data']['totalPages']  = $totalPages;
                  $pagination['data']['noOfPages']   = $noOfPages;
                  $pagination['data']['hasPreviousPage']   = $hasPreviousPage;
                  $pagination['data']['hasNextPage']   = $hasNextPage;
                  $pagination['data']['posts']   = $this->allProductSelectedColumn($posts); //substr($posts, 1, 50); //Str::words($posts, '50');
                  return response()->json(['success' => 1, 'message' => 'all products', 'response'=> $pagination]);
            // }
        }
    }


}
