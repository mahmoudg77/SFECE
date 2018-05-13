
@extends('layouts.admin')
@section('content')
<div class="">
  <a class="btn btn-success pull-right" href="{{route('cp.secpermission.create',['curr_menu'=>$sel_menu])}}">Create New</a>
  <table class="table datatable">
    <thead>
      <tr>
        <th>Controller</th>
        <th>Action</th>
        <th>Author</th>
        <th></th>
      </tr>
    </thead>
    @foreach($data as $itemt)
      <tr>
          <td>{{$itemt->controller}}</td>
          <td>{{$itemt->action}}</td>
          <td>{{$itemt->Creator!=null?$itemt->Creator->name:null}}</td>
          <td>
              {!!Func::actionLinks('secpermission',$itemt->id,"",["edit"=>"edit","delete"=>"","view"=>"view"])!!}
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
