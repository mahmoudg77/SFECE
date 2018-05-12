@extends('layouts.admin')
@section('content')
<section class="post-dashboard">
<div class="panel panel-default">
    <div class="panel-body">
        <h2 class="post-heading">Edit Post: <small>{{$data->title}}</small></h2>
        {{Form::model($data, ['route'=>["cp.posts.update",$data->id],"method"=>"PUT"])}}
        <div class="form-horizontal">
            <ul class="nav nav-tabs">
                @foreach(config('translatable.locales') as $key)
                    <li class="{{($key==app()->getLocale())?'active':''}}">
                        <a data-toggle="tab" href="#data_{{$key}}">{{$key}}</a></li>
                @endforeach

            </ul>
            <div class="form-group" style="padding-top:10px;">
              <label class="control-label col-md-2">Url</label>
              <div class="col-md-10">
                {{Form::text("slug",$data->slug,['class'=>'form-control'])}}
              </div>
            </div>
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
                    {{Form::select("category_id",Func::getCategoriesList(),$data->category_id,['class'=>'form-control'])}}
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2">Post Type</label>
                <div class="col-md-10">
                    {{Form::select("post_type_id",App\Models\PostType::pluck('name','id'),$data->post_type_id,['class'=>'form-control'])}}
                </div>
            </div>
            <hr>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <button type="submit" class="btn btn-success save"><i class="fa fa-save"></i> Save</button>
                </div>
            </div>
            </div>
        {{Form::close()}}
    </div>
</div>
</section>
@stop
