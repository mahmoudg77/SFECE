@extends('layouts.admin')
@section('title', 'Create Category')
@section('content')

  <div class="panel panel-default" style="width:700px;max-width: 100%;">
    <div class="panel-heading main-color-bg">
      <h3 class="panel-title">Add New Category</h3>
    </div>

    <div class="modal-body">
      <div class="row">
      {!! Form::open(['method'=>'POST', 'url'=>"/category"]) !!}
        <div class="form-group col-sm-6">
          {!! Form::label('Title') !!}
          {!! Form::text('title', null, array('required', 'class'=>'form-control', 'placeholder'=>'Ad new title ....')) !!}
        </div>

        <div class="form-group col-sm-6">
          {!! Form::label('Parent?') !!}
          {!! Form::select('parent_id', App\Models\Category::pluck('title','id'), null, array('class'=>'form-control', 'placeholder'=>'Select parent')) !!}
        </div>

        <div class="form-group col-sm-12">
          {!! Form::label('Description') !!}
          {!! Form::textarea('description', null, array('required', 'class'=>'form-control', 'placeholder'=>'Add description ....')) !!}
        </div>

        <hr/>
        <div class="model-footer form-group col-sm-12">
            {!! Form::submit('Add New', array('class'=>'btn btn-primary pull-right')) !!}
        </div>
      {!! Form::close() !!}
      </div>
    </div>

  </div>

@stop
