@extends('layouts.admin')
@section('content')
<div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-2">Title</label>
            <div class="col-md-10">
              {{$post->title}}
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Category</label>
            <div class="col-md-10">
              {{$post->Category->title}}
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Post Type</label>
            <div class="col-md-10">
              {{$post->PostType->name}}
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Content</label>
            <div class="col-md-10">
              {{$post->body}}
            </div>
        </div>


    </div>


@stop
