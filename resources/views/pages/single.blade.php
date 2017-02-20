@extends('main')
@section('content')
<div class="row">
    <div class="container">
        <div class="col-md-8 col-md-offset-2">
            @foreach($posts as $post)
                <h3> {{$post->title}}</h3>
           <?php if($post->image > 0){?>
                <img src="{{asset('public/images/'. $post->image) }}" class="pull-left" style="padding: 5px;" alt="" width="100" height="100">
            <?php }?>
                <p class="text-justify">{{$post->content}}</p>
                <br>
                <p>Category: {{$post->category}}</p>
                <p>Posted By: {{$post->poster_name}}</p>
                <p>Published on: {{date('F j, Y - g:i a',strtotime($post->created_at))}}</p>
                <p>Edited on: {{date('F j, Y - g:i a',strtotime($post->updated_at))}}</p>
                <hr>
                <h3 class="text-success"><span class="glyphicon glyphicon-comment" style="margin-right: 5px"></span>{{ $post->comments()->count() }} Comments</h3>
        </div>

        <div class="row">
            @foreach($post->comments as $comment)
                <div class="col-md-8 col-md-offset-2">
                    <div class="panel panel-success item{{$comment->id}}">
                        <div class="panel-heading">
                            <h3 class="panel-title"><img src="{{"https://www.gravatar.com/avatar/".md5( strtolower( trim( $comment->email ) ) )}}" alt="avater image" style="margin-right: 5px; width: 50px; height: 50px;">{{$comment->name}}</h3>

                           <?php if(Auth::check() && Auth::user()->name  == $comment->name){?>

<div class="row pull-right" style="margin-top: -30px;">
                            <button  class="btn btn-xs btn-primary" data-toggle="modal" data-target="#editModal" onclick="fun_edit('{{$comment->id}}')" style="padding: 5px;"><span class="glyphicon glyphicon-pencil"></span></button>


								<button onclick="fun_delete('{{$comment -> id}}')" class="btn btn-xs btn-danger" style="padding: 5px; margin-right: 5px;"><span class="glyphicon glyphicon-trash"></span></button>

</div>
                          <?php } ?>
                            <h6 class="text-right" style="float: right">{{date('M j, Y - g:iA',strtotime($comment->created_at))}}</h6>
                        </div>
                        <div class="panel-body">
                            <p data-id="{{ $comment->id }}"> {{$comment->comment}}</p>
                        </div>
                    </div>
                </div>

            @endforeach
            <div id="comment-form">
                {{ Form::open(['url'=>['comments',$post->id], 'method'=>'POST']) }}
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="panel panel-default well well-sm">
                        {{Form::label('comment','Comment')}}
                        {{Form::textarea('comment',null,['class'=>'form-control panel-body','size' => '30x1'])}}
                        {{ Form::button('<span class="glyphicon glyphicon-send"></span>',['class'=>'btn btn-info', 'type'=>'submit','style'=>'margin-top:5px']) }}

                        </div>
                    </div>
                </div>

                {{Form::close()}}
            </div>
        </div>
        @endforeach
        <input type="hidden" name="hidden_view" id="hidden_view" value="{{url('edit')}}">
        <input type="hidden" name="hidden_delete" id="hidden_delete" value="{{url('delete')}}">
    <!-- Edit Modal start -->
        <div class="modal fade" id="editModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header text-success">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Edit</h4>
                    </div>
                    <div class="modal-body">
                        <form action="{{ url('update') }}" method="post">
                            {{ csrf_field() }}
                            <div class="form-group">

                                <label for="edit_comment">Comment:</label>
                                <input type="text" class="form-control" id="edit_comment" name="edit_comment">

                            </div>

                            <button type="submit" class="btn btn-success">Update</button>
                            <input type="hidden" id="edit_id" name="edit_id">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>

                </div>

            </div>
        </div>
        <!-- Edit code ends -->


</div>
</div>

@endsection
<script>
    function fun_edit(id)
    {
        var view_url = $("#hidden_view").val();
        $.ajax({
            url: view_url,
            type:"GET",
            data: {"id":id},
            success: function(result){
                //console.log(result);
                $("#edit_id").val(result.id);
                $("#edit_comment").val(result.comment);
            }
        });
    }

    function fun_delete(id)
    {
        var conf = confirm("Are you sure want to delete??");
        if(conf){
            var delete_url = $("#hidden_delete").val();
            $.ajax({
                url: delete_url,
                type:"POST",
                data: {"id":id,_token: "{{ csrf_token() }}"},
                success: function(){
//                    alert(response);
                    location.reload();
                }
            });
        }
        else{
            return false;
        }
    }
</script>