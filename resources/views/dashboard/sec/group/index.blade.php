
@extends('layouts.admin')
@section('content')
<div class="">
  <a class="btn btn-success pull-right" href="{{route('cp.secgroup.create',['menu'=>$sel_menu])}}">Create New</a>
  <table class="table datatable">
    <thead>
      <tr>
        <th>Name</th>
        <th>Key</th>
        <th></th>
      </tr>
    </thead>
    @foreach($data as $item)
      <tr>
          <td>{{$item->name}}</td>
          <td>{{$item->groupkey}}</td>
          <td>
              {!!Func::actionLinks('secgroup',$item->id,"")!!}
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