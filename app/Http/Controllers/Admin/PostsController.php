<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use App\Post;
use Image;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Storage;
use Session;

class PostsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index(Request $request)
    {
        $admin_name=Auth::user()->name;
        $keyword = $request->get('search');
        $perPage = 10;

        $posts=Post::where('poster_name',$admin_name);
        if (!empty($keyword)) {
            $posts = $posts->where('title', 'LIKE', "%$keyword%")
				->orWhere('content', 'LIKE', "%$keyword%")
				->orWhere('category', 'LIKE', "%$keyword%")
                ->paginate($perPage);
        } else {
            $posts = $posts->paginate($perPage);
        }

        return view('admin.posts.index',compact('posts'));
    }



    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('admin.posts.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function store(Request $request)
    {
        $this->validate($request,[
           'title'=>'required|max:255',
           'slug'=>'required|alpha_dash|min:5|max:255|unique:posts,slug',
           'content'=>'required',
           'category'=>'required',
           'image'=>'sometimes'
        ]);
        $poster_name=Auth::user()->name;

        $requestData = new Post;
        $requestData->title=$request->title;
        $requestData->slug=$request->slug;
        $requestData->content=$request->content;
        $requestData->category=$request->category;
        $requestData->poster_name=$poster_name;
        if($request->hasFile('image')){
            $image=$request->file('image');
            $file_name=time() .'.'.$image->getClientOriginalExtension();
            $location=public_path('images/'.$file_name);
            Image::make($image)->save($location);

            $requestData->image=$file_name;
        }

        $requestData->save();


//        Post::create($requestData);

        Session::flash('flash_message', 'Post added successfully!');

        return redirect('admin/posts');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     *
     * @return \Illuminate\View\View
     */
    public function show($id)
    {
        $post = Post::findOrFail($id);

        return view('admin.posts.show', compact('post'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     *
     * @return \Illuminate\View\View
     */
    public function edit($id)
    {
        $post = Post::findOrFail($id);
        return view('admin.posts.edit', compact('post'));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function update($id, Request $request)
    {
        
        $requestData = $request->all();
        
        $post = Post::findOrFail($id);
        if($request->hasFile('image')){
            //add the new image
            $image=$request->file('image');
            $file_name=time().".". $image->getClientOriginalExtension();
            $file_location=public_path('images/'.$file_name);
            Image::make($image)->save($file_location);
            //get old file
            $oldFilename=$post->image;

            //update database
            $post->image=$file_name;
            //delete old file
            Storage::delete($oldFilename);
        }
        $post->update($requestData);

        Session::flash('flash_message', 'Post updated!');

        return redirect('admin/posts');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function destroy($id)
    {
        $post=Post::find($id);
        Storage::delete($post->image);
        $post->delete();

        Session::flash('flash_message', 'Post deleted!');

        return redirect('admin/posts');
    }
}
