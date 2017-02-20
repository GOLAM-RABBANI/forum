@extends('main')
@section('content')
    <div class="col-md-8 col-md-offset-2">
        @foreach($posts as $post)
            <h3> {{$post->title}}</h3>
            <p>{{substr($post->content, 0, 300)}}{{strlen($post->content)> 300 ? " ....." : ""}}</p>
            <a href="{{ asset('pages/'.$post->slug) }}" class="btn btn-info">Read more</a>
            <hr>
        @endforeach
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="text-center">
                {!! $posts->render() !!}
            </div>
        </div>
    </div>
@endsection