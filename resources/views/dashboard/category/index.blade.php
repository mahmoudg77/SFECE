
@extends('layouts.admin')
@section('content')
<div class="">
  <a class="btn btn-success pull-right" href="/category/create">Create New</a>
  <table class="table datatable">
    <thead>
      <tr>
        <th>Title</th>
        <th>Parent</th>
        <th></th>
      </tr>
    </thead>
    @foreach($data as $item)
      <tr>
          <td>{{$item->title}}</td>
          <td>@if($item->Parent){{$item->Parent->title}}@endif</td>
          <td>
            {{Form::open(["url"=>"/category/".$item->id,"method"=>"DELETE","class"=>"ajax-delete"])}}
            {{Form::submit("Delete",["class"=>"btn btn-danger"])}}
            <a href="/category/{{$item->id}}/edit" class="btn btn-primary edit">Edit</a>
            <a href="/category/{{$item->id}}" class="btn btn-default view">View</a>
            {{Form::close()}}

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
