
@extends('layouts.admin')
@section('content')
<section class="user-dashboard">
<div class="panel-group">
    <div class="panel panel-default">
        <div class="panel-body" style="padding: 7px;">
            <a class="btn btn-success pull-right" href="{{route('cp.user.create',['curr_menu'=>$sel_menu])}}">Create New</a>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-body" style="padding: 7px;">
            <table class="table datatable">
                <thead>
                  <tr>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Email</th>
                    <th>Register Date</th>
                    <th></th>
                  </tr>
                </thead>
                @foreach($data as $item)
                  <tr>
                      <td>{{$item->name}}</td>
                      <td>{{$item->email}}</td>
                      <td>{{$item->AccountLevel->name}}</td>
                      <td>{{$item->created_at}}</td>
                       <td>
                          {!!Func::actionLinks('user',$item->id,"tr",["edit"=>['class'=>"edit"],"view"=>['class'=>"view"]])!!}
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

@endsection
