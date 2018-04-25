@extends('layouts.admin')
@section('content')
<div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-2">Title</label>
            <div class="col-md-10">
              {{$data->title}}
            </div>
        </div>


        <div class="form-group">
            <label class="control-label col-md-2">Links</label>
            <div class="col-md-10">
                <ul>
                  @foreach($data->Links as $link)
                      <li>{{$link->title}}</li>
                  @endforeach
              </ul>
            </div>
        </div>


    </div>


@stop
