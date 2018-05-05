@extends('layouts.admin')
@section('content')
{{Form::model(null, ['route'=>["cp.posts.store"],"method"=>"POST"])}}
<div class="form-horizontal">
        <div class="form-group">
          <ul class="nav nav-tabs">
            @foreach(config('translatable.locales') as $key)
            <li class="{{($key==app()->getLocale())?'active':''}}"><a data-toggle="tab" href="#data_{{$key}}">{{$key}}</a></li>
            @endforeach

          </ul>
        
          <div class="tab-content">
            @foreach(config('translatable.locales') as $key)
            <div id="data_{{$key}}" class="tab-pane fade in {{($key==app()->getLocale())?'active':''}}">
              <div class="form-group">
                <label class="control-label col-md-2">Title</label>
                <div class="col-md-10">
                  {{Form::text($key."[title]","",['class'=>'form-control'])}}
                </div>
            </div>

        <div class="form-group">
            <label class="control-label col-md-2">Content</label>
            <div class="col-md-10">
              {{Form::textarea($key."[body]","",['class'=>'form-control editor'])}}
            </div>
        </div>
      </div>
        @endforeach
         <div class="form-group">
            <label class="control-label col-md-2">Category</label>
            <div class="col-md-10">
              {{Form::select("category_id",App\Models\Category::listsTranslations('title')->pluck('title','id'),null,['class'=>'form-control'])}}
            </div>
        </div>
        @if($post_type_id==1)
            {{Form::hidden('post_type_id',$post_type_id)}}
        @else
        <div class="form-group">
            <label class="control-label col-md-2">Post Type</label>
            <div class="col-md-10">
              {{Form::select("post_type_id",App\Models\PostType::pluck('name','id'),$post_type_id,['class'=>'form-control'])}}
            </div>
        </div>
        @endif
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <button type="submit" class="btn btn-success create"><i class="fa fa-save"></i> Create</button>
            </div>
        </div>
    </div>
{{Form::close()}}


@stop
