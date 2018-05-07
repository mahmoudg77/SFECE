@extends('layouts.admin')
@section('title', 'Create Menu Link')
@section('content')

  <div class="panel panel-default" style="width:700px;max-width: 100%;">
    <div class="panel-heading main-color-bg">
      <h3 class="panel-title">Add New Link</h3>
    </div>
<?php /*`menu_id`, `customlink`, `category_id`, `parent_id`, `hasSubs`, `created_at`, `updated_at`*/?>
    <div class="modal-body">
      <div class="row">
      {!! Form::open(['method'=>'POST', 'route'=>["cp.menu-link.store"]]) !!}

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
          {!! Form::text($key.'[title]', null, array('required', 'class'=>'form-control', 'placeholder'=>'Ad new title ....')) !!}
        </div>
      </div>
      @endforeach
    </div>
        <div class="form-group col-sm-6">
          {!! Form::label('Type') !!}
          {!! Form::select('type', ['Custom Link','Category'],null, array('required', 'class'=>'form-control', 'placeholder'=>' ....')) !!}
        </div>

        <div class="form-group col-sm-12">
          {!! Form::label('Link') !!}
          {!! Form::text('customlink', null, array('required', 'class'=>'form-control', 'placeholder'=>'Add location ....')) !!}
        </div>
          <div class="form-group col-sm-6">
              {!! Form::label('Parent') !!}
              {!! Form::select('parent_id',App\Models\MenuLink::listsTranslations('title')->pluck('title','id'),null, array( 'class'=>'form-control', 'placeholder'=>'Root')) !!}
          </div>

          <div class="form-group">
           <label class="control-label col-md-2">Category</label>
           <div class="col-md-10">
             {{Form::select("category_id",App\Models\Category::listsTranslations('title')->pluck('title','id'),null,['class'=>'form-control'])}}
           </div>
       </div>
       <div class="form-group col-sm-12">
         {!! Form::label('Include chiled categories') !!}
         {!! Form::checkbox('hassubs', false, array('class'=>'form-control',)) !!}
       </div>
         <div class="model-footer form-group col-sm-12">
          {{Form::hidden('menu_id',$m)}}
            {!! Form::submit('Add New', array('class'=>'btn btn-primary pull-right')) !!}
        </div>
      {!! Form::close() !!}
      </div>

    </div>

  </div>

@stop
