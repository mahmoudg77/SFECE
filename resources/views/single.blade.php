@extends('layouts.app')

@section('content')

<section class="single" style="min-height:500px;">
    <div class="col-xs-12 col-sm-8">
        <div class="single-box">
            <div class="single-img">
                <img src="http://mqqal.com/wp-content/uploads/2018/04/%D9%82%D8%B1%D8%A7%D8%A1%D8%A9-%D9%81%D9%8A-%D9%85%D8%A8%D8%A7%D8%B1%D8%A7%D8%A9-%D9%84%D9%8A%D9%81%D8%B1%D8%A8%D9%88%D9%84-%D9%88%D8%B1%D9%88%D9%85%D8%A7-%D9%88%D9%83%D9%8A%D9%81-%D9%8A%D8%B5%D9%84-%D9%84%D9%8A%D9%81%D8%B1%D8%A8%D9%88%D9%84-%D8%A5%D9%84%D9%89-%D8%A7%D9%84%D9%86%D9%87%D8%A7%D8%A6%D9%8A-660x330.jpg"
                             class="img-responsive center--block img-thumbanail" >
            </div>

            <div class="single-content">
                <h2>{{ $singlePost->title }}</h2>
                <div class="bar-data">
                    <small>
                        <span><i class="fa fa-user"></i> {{ $singlePost->Creator!=null?$singlePost->Creator->name:null }}</span>
                        <span><i class="fa fa-folder"></i>
                        <a href="/ar/category/{{ $singlePost->category_id }}">{{ $singlePost->Category->title }}</a></span>
                        <span><i class="fa fa-clock"></i> 
                        <small>{{ $singlePost->created_at!=null?$singlePost->created_at->toDateString():'' }}</small></span>
                    </small>
                </div>
                <div class="uderline" style="padding:10px 0.border:1px solid #ddd;"></div>
                <p>{!! $singlePost->body !!} </p>
            </div>
            
            <h4 style="background-color: #ddd;padding: 10px;margin: 20px 0;">{{ trans('app.related posts')}}</h4>
<!--
            <div class="row">
            
                <div class="col-sm-4">
                    <a href="/ar/">
                        <div class="panel panel-default blog wow fadeInDown">
                            <div class="panel-body" style="padding:0;box-shadow: 0px 0px 3px 0px #777;border: 3px solid #fff;">
                                <div class="blog-header" style="background-color: #414042;padding: 7px 10px;">
                                    <h4 class="media-heading" style="color:#fff;height:40px;"></h4>
                                </div>
                                <div class="blog-content">
                                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnnOX--EG2IfmT8pYxuOw-xKRnq8g6kdOVJ9g4F8tVWKqjWNOA" class="media-object" style="width:100%;height: 200px;">
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                
            </div>
-->
        </div>
    </div>

    <div class="col-xs-hidden col-sm-4">
        <div class="single-sidebar">
            <div class="single-cat">
                <h4>{{trans('app.categories')}}</h4>
                <ul class="list-group">
                    @foreach($allcats as $cat)
                        <li class="list-group-item">
                            <a href="/ar/category/{{ $cat->id}}">{{ $cat->title}}</a>
                        </li>
                    @endforeach
                </ul>
            </div>

            <div class="single-cat">
                <h4>{{trans('app.last articles')}}</h4>
                <ul class="list-group">
                    @foreach($lastPosts as $lastpost)
                        <li class="list-group-item"><a href="/ar/{{ $lastpost->slug}}">{{ $lastpost->title}}</a></li>
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
