
@extends('layouts.admin')
@section('content')
<div class="">
  <a class="btn btn-success pull-right" href="{{route('cp.posts.create',['type'=>$post_type_id,'menu'=>$sel_menu])}}">Create New</a>
  <table class="table datatable">
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
              {!!Func::actionLinks('posts',$post->id,"")!!}
          </td>
      </tr>
    @endforeach

  </table>
</div>

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
