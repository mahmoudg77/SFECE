@extends('layouts.admin')
@section('content')
{{Form::model($data, ['route'=>["cp.posts.update",$data->id],"method"=>"PUT"])}}
<?php //`title`, `body`, `pub_date`,`post_type_id`, `category_id`, `is_published`, `created_by`, `updated_by`, `created_at`, `updated_at` ?>
<div class="form-horizontal">
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
              {{Form::text($key."[title]",($data->translate($key)!=null?$data->translate($key)->title:null),['class'=>'form-control'])}}
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-md-2">Content</label>
            <div class="col-md-10">
              {{Form::textarea($key."[body]",($data->translate($key)!=null?$data->translate($key)->body:null),['class'=>'form-control editor'])}}
            </div>
        </div>
            </div>
        @endforeach
    </div>
        <div class="form-group">
            <label class="control-label col-md-2">Category</label>
            <div class="col-md-10">
                {{Form::select("category_id",App\Models\Category::listsTranslations('title','ar')->pluck('title','id'),$data->category_id,['class'=>'form-control'])}}
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Post Type</label>
            <div class="col-md-10">
                {{Form::select("post_type_id",App\Models\PostType::pluck('name','id'),$data->post_type_id,['class'=>'form-control'])}}
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <button type="submit" class="btn btn-success save"><i class="fa fa-save"></i> Save</button>
            </div>
        </div>
    </div>
{{Form::close()}}
@stop
