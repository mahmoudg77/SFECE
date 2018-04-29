@extends('layouts.admin')
@section('title',$data->title)
@section('content')

<div class="panel panel-default" style="width:700px;max-width: 100%;">
    <div class="panel-heading main-color-bg">
      <h3 class="panel-title">Edit Menu :: {{ $data->title }}</h3>
    </div>

    <div class="modal-body">
      <div class="row">
        {!! Form::open(['method'=>'PATCH', 'route'=>["cp.menu.update",$data->id]]) !!}
        <ul class="nav nav-tabs">
          @foreach(config('translatable.locales') as $key)
          <li class="{{($key==app()->getLocale())?'active':''}}"><a data-toggle="tab" href="#data_{{$key}}">{{$key}}</a></li>
          @endforeach

        </ul>
        <div class="tab-content">
          @foreach(config('translatable.locales') as $key)
          <div id="data_{{$key}}" class="tab-pane fade in {{($key==app()->getLocale())?'active':''}}">
          <div class="form-group col-sm-6">
            {!! Form::label('Title') !!}
            {!! Form::text($key.'[title]', ($data->translate($key)!=null?$data->translate($key)->name:null), array('required', 'class'=>'form-control', 'placeholder'=>'Ad new title ....')) !!}
          </div>
        </div>
          @endforeach

        </div>
        <div class="form-group col-sm-12">
          {!! Form::label('Location') !!}
          {!! Form::text('description', $data->location, array('required', 'class'=>'form-control')) !!}
        </div>

        <hr/>
        <div class="model-footer form-group col-sm-12" style="">
            {!! Form::submit('Update', array('class'=>'btn btn-success pull-right')) !!}
        </div>
      {!! Form::close() !!}
      </div>
    </div>
</div>
@stop
