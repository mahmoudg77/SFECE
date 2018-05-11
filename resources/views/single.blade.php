@extends('layouts.app')

@section('content')

<section class="single" style="min-height:500px;">
    <div class="col-xs-12 col-sm-8">
        <div class="single-box">
            <div class="single-img">
                <img src="{{$singlePost->mainImage()}}"
                             class="img-responsive center--block img-thumbanail" >
            </div>

            <div class="single-content">

                <h2>{{ $singlePost->title }}</h2>
                <div class="bar-data">
                    <small>
                        <span><i class="fa fa-user"></i> {{ $singlePost->Creator!=null?$singlePost->Creator->name:null }}</span>
                        <span><i class="fa fa-folder"></i>
                        <a href="/ar/category/{{ $singlePost->category_id }}">{{ $singlePost->Category->title }}</a></span>
                        <small><span class="glyphicon glyphicon-time"></span>
                        {{ $singlePost->created_at!=null?$singlePost->created_at->toDateString():'' }}</small>
                    </small>
                </div>
                <div class="uderline" style="padding:10px 0.border:1px solid #ddd;"></div>
                <p>{!! $singlePost->body !!} </p>

            </div>
            
            <div class="related-post">
            <h4 class="related-post-heading">{{ trans('app.related posts')}}</h4>
            @foreach($related_posts as $rpost)
                <a href="{{ route('getPostBySlug', $rpost->slug) }}">
                    <div class="row">
                        <div class="col-sm-4">
                            <img src="{{$rpost->mainImage()}}" class="media-object">
                            <h4 class="related-post-title">{{$rpost->title}}</h4>
                        
                    </div>
                    </div>
                </a>
            @endforeach
            </div>
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
