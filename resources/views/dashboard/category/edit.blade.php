@extends('layouts.admin')
@section('title',$data->title)
@section('content')

<div class="panel panel-default" style="width:700px;max-width: 100%;">
    <div class="panel-heading main-color-bg">
      <h3 class="panel-title">Edit Category :: {{ $data->title }}</h3>
    </div>

    <div class="modal-body">
      <div class="row">
      {!! Form::model($data, array('method' => 'PATCH', 'url' => "/category/".$data->id, 'files'=>true)) !!}
        <div class="form-group col-sm-6">
          {!! Form::label('Title') !!}
          {!! Form::text('title', null, array('required', 'class'=>'form-control', 'placeholder'=>'Ad new title ....')) !!}
        </div>

        <div class="form-group col-sm-6">
          {!! Form::label('Parent?') !!}
          {!! Form::select('parent_id',
                          App\Models\Category::where('id','<>',$data->id)->pluck('title','id'),
                          ($data->Parent)?$data->Parent->id:null,
                          array('class'=>'form-control')) !!}
        </div>

        <div class="form-group col-sm-12">
          {!! Form::label('Description') !!}
          {!! Form::textarea('description', null, array('required', 'name'=>'editor1', 'class'=>'form-control')) !!}
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
