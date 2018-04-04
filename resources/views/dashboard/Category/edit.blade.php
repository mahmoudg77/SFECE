@extends('dashboard.index')
@section('title', 'Create Section')
@section('content')

<div class="panel panel-default" style="width:700px;max-width: 100%;">
    <div class="panel-heading main-color-bg">
      <h3 class="panel-title">Edit Category :: {{ $category->title }}</h3>
    </div>

    <div class="modal-body">
      <div class="row">
      {!! Form::model($category, array('method' => 'PATCH', 'action' => ['Cpanel\CategoryController@update', $category->id], 'files'=>true)) !!}
        <div class="form-group col-sm-6">
          {!! Form::label('Title') !!}
          {!! Form::text('title', null, array('required', 'class'=>'form-control', 'placeholder'=>'Ad new title ....')) !!}
        </div>

        <div class="form-group col-sm-6">
          {!! Form::label('Ordering') !!}
          {!! Form::text('ordering', null, array('class'=>'form-control', 'placeholder'=>'add ordering number ....')) !!}
        </div>

        <div class="form-group col-sm-6">
          {!! Form::label('Parent?') !!}
          {!! Form::select('parent_id', $parents, null, array('class'=>'form-control', 'placeholder'=>'Select parent')) !!}
        </div>

        <div class="form-group col-sm-6">
          {!! Form::label('Active Menu') !!}
          {!! Form::select('active', ['1'=>'Active', '0'=>'InActive'], null, array('required', 'class'=>'form-control', 'placeholder'=>'Select active')) !!}
        </div>

        <div class="form-group col-sm-6">
          {!! Form::label('Status') !!}
          {!! Form::select('status', ['1'=>'Active', '0'=>'InActive'], null, array('required', 'class'=>'form-control', 'placeholder'=>'Select status')) !!}
        </div>

        <div class="form-group col-sm-6">
          {!! Form::label('Uload your image') !!}
          {!! Form::file('image_url', array('required', 'class'=>'form-control'), null) !!}
        </div>

        <div class="form-group col-sm-12">
          {!! Form::label('Description') !!}
          {!! Form::textarea('description', null, array('required', 'name'=>'editor1', 'class'=>'form-control')) !!}
        </div>

        <div class="form-group col-sm-12">
          <img src="{{asset($category->image_url)}}" class="img-responsive center--block" alt="{{$category->title}}" style="width:300px;"/>
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
