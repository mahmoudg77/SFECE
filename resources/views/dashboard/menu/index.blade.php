
@extends('layouts.admin')
@section('content')
 <div class="">
  <a class="btn btn-success pull-right" href="{{route('cp.menu.create',['menu'=>$sel_menu])}}">Create New</a>
  <table class="table datatable">
    <thead>
      <tr>
        <th>Name</th>
        <th>Location</th>
        <th></th>
      </tr>
    </thead>
    @foreach($data as $item)
      <tr>
          <td>{{$item->name}}</td>
          <td>{{$item->location}}</td>
          <td>
              {!!Func::actionLinks('menu',$item->id,"")!!}
          </td>
      </tr>
    @endforeach

  </table>
</div>

@endsection
