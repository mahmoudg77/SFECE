@extends('layouts.admin')
@section('content')
<div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-2">Title</label>
            <div class="col-md-10">
              {{$data->title}}
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Category</label>
            <div class="col-md-10">
              {{$data->Category->title}}
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Post Type</label>
            <div class="col-md-10">
              {{$data->PostType->name}}
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Content</label>
            <div class="col-md-10">
              {{$data->body}}
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Files</label>
            <div class="col-md-10">
                <ul>
                  @foreach($data->Files as $file)
                      <li><a href="{{$file->path}}">{{$file->name}} - {{$data->size/100}} KB -{{$file->RelatedObject->name()}}</a></li>
                  @endforeach
              </ul>
            </div>
        </div>


    </div>


@stop
