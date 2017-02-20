@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            @include('admin.sidebar')

            <div class="col-md-9">
                <div class="panel panel-default">
                    <div class="panel-heading">Post {{ $post->id }}</div>
                    <div class="panel-body">

                        <a href="{{ url('/admin/posts') }}" title="Back"><button class="btn btn-warning btn-xs"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button></a>
                        <a href="{{ url('/admin/posts/' . $post->id . '/edit') }}" title="Edit Post"><button class="btn btn-primary btn-xs"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</button></a>
                        {!! Form::open([
                            'method'=>'DELETE',
                            'url' => ['admin/posts', $post->id],
                            'style' => 'display:inline'
                        ]) !!}
                            {!! Form::button('<i class="fa fa-trash-o" aria-hidden="true"></i> Delete', array(
                                    'type' => 'submit',
                                    'class' => 'btn btn-danger btn-xs',
                                    'title' => 'Delete Post',
                                    'onclick'=>'return confirm("Confirm delete?")'
                            ))!!}
                        {!! Form::close() !!}
                        <br/>
                        <br/>

                        <div class="table-responsive">
                            <table class="table table-borderless">
                                <tbody>
                                    <tr>
                                        <th>ID</th><td>{{ $post->id }}</td>
                                    </tr>
                                    <tr><th> Title </th><td> {{ $post->title }} </td></tr>
                                    <tr><th> Content </th><td> {{ $post->content }} </td></tr>
                                    <tr><th> Category </th><td> {{ $post->category }} </td></tr>
                                    <tr><th> Author </th><td> {{ $post->poster_name }} </td></tr>
                                    <tr><th> URL</th><td><a href="{{ url('pages/'.$post->slug) }}">{{ url('pages/'.$post->slug) }}</a></td></tr>
                                    <tr>
                                        <th>Images: </th>
                                        <td><img src="{{asset('public/images/'. $post->image) }}" alt="" width="100" height="100"></td>
                                    </tr>
                                    <tr><th> Publish date </th><td> {{ date('M j, Y', strtotime($post->created_at)) }} </td></tr>
                                    <tr><th> Updated date </th><td> {{ date('M j, Y',strtotime($post->updated_at)) }} </td></tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
