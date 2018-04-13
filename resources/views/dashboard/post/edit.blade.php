@extends('layouts.admin')
@section('content')
{{Form::model($data, ['route'=>["cp.posts.update",$data->id],"method"=>"PUT"])}}
<?php //`title`, `body`, `pub_date`,`post_type_id`, `category_id`, `is_published`, `created_by`, `updated_by`, `created_at`, `updated_at` ?>
<div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-2">Title</label>
            <div class="col-md-10">
              {{Form::text("title",$data->title,['class'=>'form-control'])}}
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Category</label>
            <div class="col-md-10">
              {{Form::select("category_id",App\Models\Category::pluck('title','id'),$data->category_id,['class'=>'form-control'])}}
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Post Type</label>
            <div class="col-md-10">
              {{Form::select("post_type_id",App\Models\PostType::pluck('name','id'),$data->post_type_id,['class'=>'form-control'])}}
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Content</label>
            <div class="col-md-10">
              {{Form::textarea("body",$data->body,['class'=>'form-control'])}}
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
