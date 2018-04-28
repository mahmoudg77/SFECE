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
        <div class="form-group col-sm-6">
          {!! Form::label('Title') !!}
          {!! Form::text('title', $data->title, array('required', 'class'=>'form-control', 'placeholder'=>'Ad new title ....')) !!}
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
