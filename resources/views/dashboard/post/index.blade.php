
@extends('layouts.admin')
@section('content')
<div class="">
  <a class="btn btn-success pull-right" href="/posts/create">Create New</a>
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
    @foreach($posts as $post)
      <tr>
          <td>{{$post->title}}</td>
          <td>{{$post->postType->name}}</td>
          <td>{{$post->pub_date}}</td>
          <td>{{$post->created_by}}</td>
          <td>
            <a href="/posts/{{$post->id}}/edit" class="btn btn-primary edit">Edit</a>
            {{Form::open(["url"=>"/posts/".$post->id,"method"=>"DELETE","class"=>"ajax-delete"])}}
            {{Form::submit("Delete",["class"=>"btn btn-danger"])}}
            {{Form::close()}}
            <a href="/posts/{{$post->id}}" class="btn btn-default view">View</a>
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
