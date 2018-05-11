@extends('layouts.app')

@section('content')

<section class="category-page" style="min-height:500px;">
    <div class="col-sm-8">
        <h3 style="background-color: #ddd;padding: 10px;border--top: 5px solid #224668;margin-bottom: 20px;">
            {{ $categoryName->title }}</h3>
            <div class="cat-content">
            @foreach($allPostsByCat as $post)
                <a href="/ar/{{ $post->slug }}" style="text-decoration:none">
                    <h3 class="media-heading" >{{ $post->title }}</h3>
                </a>
                <small style="padding: 10px;">
                    <span>
                        <i class="fa fa-user"></i> {{ $post->Creator!=null?$post->Creator->name:null }}
                    </span>
                    <span>
                        <i class="fa fa-folder"></i>
                        <a href="/ar/category/{{ $post->category_id }}">{{ $post->Category->title }}</a>
                    </span>
                </small>
                
                <div class="row cat-content-body">
                    <div class="col-sm-6">
                        <img src="{{$post->mainImage(true)}}" class="media-object" style="width:100%;height: 200px;">
                    </div>
                    <div class="col-sm-6">
                        <p>{!! str_limit($post->body, 200) !!}</p>
                    </div>
                </div>
                <div class="col-xs-12 text-right"><a href="/ar/{{ $post->slug }}" class="btn btn-danger btn-sm">{{trans('app.read more')}}</a></div>
                <div class="clearfix"></div>
                <div class="uderline"></div>
            @endforeach
            </div>
    </div>
    
    <div class="col-xs-hidden col-sm-4">
        <div class="single-sidebar">
            <div class="single-cat">
                <h4>{{trans('app.categories')}}</h4>
                <ul class="list-group">
                    @foreach($allcats as $cat)
                        <li class="list-group-item">
                            <a href="{{route('getPostsByCatID', $cat->id)}}">{{ $cat->title}}</a>
                        </li>
                    @endforeach
                </ul>
            </div>

            <div class="single-cat">
                <h4>{{trans('app.last articles')}}</h4>
                <ul class="list-group">
                    @foreach($lastPosts as $lastpost)
                        <li class="list-group-item"><a href="{{ route('getPostBySlug', $lastpost->slug)}}">{{ $lastpost->title}}</a></li>
                    @endforeach
                </ul>
            </div>

            <div class="single-cat">
                <h4>{{trans('app.follow facebook')}}</h4>
                <ul class="list-group">
                    
                </ul>
            </div>
        </div>
    </div>
</section>

@stop