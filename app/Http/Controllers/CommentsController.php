<?php

namespace App\Http\Controllers;

use App\Comment;
use App\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CommentsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, $post_id)
    {
        if(Auth::check()) {
            $post = Post::find($post_id);
            $admin = Auth::user()->name;

            $admin_email = Auth::user()->email;
            $comment = new Comment();
            $comment->name = $admin;
            $comment->email = $admin_email;
            $comment->comment = $request->comment;
            $comment->approved = true;
            $comment->post()->associate($post);
            $comment->save();

            return redirect("pages/" . $post->slug);
        } else {
            return redirect('login');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show()    {

        $comments= Comment::all();
        return view('single')->withComments($comments);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        if($request->ajax()){
            $id = $request->id;
            $info = Comment::find($id);

            return response()->json($info);
        }

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {

        $id = $request -> edit_id;
        $data = Comment::find($id);


        $data -> comment = $request -> edit_comment;
        $data -> save();
        return back()
            ->with('success','Record Updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $id = $request -> id;
        $data = Comment::find($id);
        $response = $data -> delete();
        if($response)
            echo "Record Deleted successfully.";
        else
            echo "There was a problem. Please try again later.";

    }
}
