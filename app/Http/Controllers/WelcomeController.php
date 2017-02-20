<?php

namespace App\Http\Controllers;

use App\Post;
use Illuminate\Http\Request;

class WelcomeController extends Controller
{
    public function index()
    {
        $posts=Post::orderBy('id','desc')->paginate(10);
        return view('welcome')->withPosts($posts);
    }

    public function search(Request $request)
    {
//        $admin_name=Auth::user()->name;
        $keyword = $request->get('search');
        $perPage = 10;

//        $posts=Post::where('poster_name',$admin_name);
        if (!empty($keyword)) {
            $posts = Post::where('title', 'LIKE', "%$keyword%")
                ->orWhere('content', 'LIKE', "%$keyword%")
                ->orWhere('category', 'LIKE', "%$keyword%")
                ->paginate($perPage);
        } else {
//            $posts = $posts->paginate($perPage);
        }

        return view('welcome',compact('posts'));
    }


}
