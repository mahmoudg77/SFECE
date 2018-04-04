@extends('dashboard.index')
@section('title', 'Create Category')
@section('content')

    {{-- <form action="/admin/category/store" method="POST" style="width:600px;max-width:100%;">
      {{ csrf_field() }}
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">Add Category</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label>Title</label>
          <input type="text" name="title" class="form-control" autocomplete="off" required="required" placeholder="Add category title ...">
        </div>

        <div class="form-group">
          <label>Parent</label>
          <select name="parent_id" class="form-control">
            <option value="0" >None</option>
          </select>
        </div>

        <div class="form-group">
          <label>Ordering</label>
          <input type="text" name="ordering" class="form-control" placeholder="Number to arrange the categories ...">
        </div>

        <div class="form-group">
          <label>Body</label>
          <textarea na-me="editor1" name="description" required="required" class="form-control" placeholder="Add category body ..."></textarea>
        </div>

        <div class="checkbox-inline">
          <label>
            <input type="checkbox" name="active" value="1"> Active
          </label>
        </div>
        <div class="checkbox-inline">
          <label>
            <input type="checkbox" name="status" value="1"> Status
          </label>
        </div>

      <div class="modal-footer">
        <a href="/admin/category" class="btn btn-default">Close</a>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
    </form> --}}


  <div class="panel panel-default" style="width:700px;max-width: 100%;">
    <div class="panel-heading main-color-bg">
      <h3 class="panel-title">Add New Category</h3>
    </div>

    <div class="modal-body">
      <div class="row">
      {!! Form::open(['method'=>'POST', 'route'=>['admin.category.store'], 'files'=>true]) !!}
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

        <div class="form-group col-sm-12">
          {!! Form::label('Description') !!}
          {!! Form::textarea('description', null, array('required', 'class'=>'form-control', 'placeholder'=>'Add description ....')) !!}
        </div>
        <div class="form-group col-sm-6">
          {!! Form::file('image_url', array('required', 'class'=>'form-control'), null) !!}
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
