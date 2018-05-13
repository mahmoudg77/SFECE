@extends('layouts.admin')
@section('content')
<section class="post-dashboard">
<div class="panel panel-default">
    <div class="panel-body">
        <h2 class="post-heading">Edit {{App\Models\PostType::find($data->post_type_id)->name}}: <small>{{$data->title}}</small></h2>
        {{Form::model($data, ['route'=>["cp.posts.update",$data->id,'curr_menu'=>$sel_menu],"method"=>"PUT","enctype"=>"multipart/form-data"])}}
        <div class="form-horizontal">
            <ul class="nav nav-tabs">
                @foreach(config('translatable.locales') as $key)
                    <li class="{{($key==app()->getLocale())?'active':''}}">
                        <a data-toggle="tab" href="#data_{{$key}}">{{$key}}</a></li>
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
                      {{Form::textarea($key."[body]",($data->translate($key)!=null?$data->translate($key)->body:null),['class'=>'form-control editor','id'=>$key.'_editor'])}}
                    </div>
                </div>
                    </div>
                @endforeach
                <div class="form-group" style="padding-top:10px;">
                    <label class="control-label col-md-2">Url</label>
                    <div class="col-md-10">
                        {{Form::text("slug",$data->slug,['required','class'=>'form-control'])}}
                    </div>
                </div>
            </div>
            @if($data->post_type_id==1)
                {{Form::hidden('category_id',0)}}
            @else

            <div class="form-group">
                <label class="control-label col-md-2">Category</label>
                <div class="col-md-10">
                    {{Form::select("category_id",Func::getCategoriesList(),$data->category_id,['class'=>'form-control'])}}
                </div>
            </div>

            @endif
            {{Form::hidden('post_type_id',$data->post_type_id)}}
            <div class="form-group">
                <label class="control-label col-md-2">Image</label>
                <div class="col-md-10">
                    {{Form::file("image",['accept'=>'.jpg,.png,.gif'])}}
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
@section('js')
    @if(isset($response) && $response['type']=='success')
        <script>$(function(){Success("{{$response['message']}}");});</script>
    @endif
    @if(isset($response) && $response['type']=='error')
        <script>$(function(){Error("{{$response['message']}}");});</script>
    @endif
@stop