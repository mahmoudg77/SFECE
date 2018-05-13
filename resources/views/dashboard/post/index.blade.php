
@extends('layouts.admin')
@section('content')
<section class="post-dashboard">
<div class="panel-group">
    <div class="panel panel-default">
        <div class="panel-body" style="padding: 7px;">
            <a class="btn btn-success btn-sm pull-right" href="{{route('cp.posts.create',['type'=>$post_type_id,'curr_menu'=>$sel_menu])}}">
          Create New</a>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-body">
            <table class="table table-hover table-striped datatable">
                <thead>
                  <tr>
                    <th>Title</th>
                    <th>Type</th>
                    <th>Publish Date</th>
                    <th>Author</th>
                    <th></th>
                  </tr>
                </thead>
                @foreach($data as $post)
                  <tr>
                      <td>{{$post->title}}</td>
                      <td>{{$post->postType->name}}</td>
                      <td>{{$post->pub_date}}</td>
                      <td>{{$post->Creator!=null?$post->Creator->name:null}}</td>
                      <td>
                          {!!Func::actionLinks('posts',$post->id,"",["view"=>['class'=>"view1","target"=>"_blank",'href'=>"/".app()->getLocale()."/".$post->slug]])!!}
                      </td>
                  </tr>
                @endforeach
              </table>
        </div>
    </div>
</div>
</section>
@endsection

@section('js')
<script>
$(function(){
  $(".ajax-delete").ajaxForm({
    dataType:"json",
    beforeSubmit:function(){
      return confirm("Are you sure you wont to delete this item?");
    },
    success:function(d, statusText, xhr,form){
      if(d.type=="success"){
          Success(d.message);
          form.closest("tr").remove();
      }else{
          Error(d.message);
      }
    },
    error: function (data, status, xhr) {
        Error( data.status + " " + xhr);
    }
  });
});
</script>
@endsection
