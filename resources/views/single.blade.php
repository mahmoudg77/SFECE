@extends('layouts.app')

@section('content')

<section class="single" style="min-height:500px;">
    <div class="">
        <div class="col-xs-12 col-sm-8">
            <div class="single-box" >
                <div class="single-img">
                    <img src="{{$singlePost->mainImage()}}" class="img-responsive center--block img-thumbanail" >
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
                            <span><i class="fa fa-tags"></i> {!! Func::tagLinks($singlePost->strTags())!!}</span>

                        </small>
                    </div>
                    <div class="uderline" style="padding:10px 0.border:1px solid #ddd;"></div>
                    <p>{!! $singlePost->body !!} </p>
                </div>

                <div class="related-post">
                <h4 class="related-post-heading">{{ trans('app.related posts')}}</h4>
                @if(count($related_posts)>0)
                @foreach($related_posts as $rpost)
                    <div class="col-sm-4">

                    <a href="{{ route('getPostBySlug', $rpost->slug) }}">
                        <div class="related-post-item">
                            <figure>
                                <img class="img-responsive center-block" src="{{$rpost->mainImage()}}"/>

                            </figure>
                            <h4 class="related-title">{!! str_limit($rpost->title, 30) !!}</h4>
                        </div>

                    </a>
                    </div>
                @endforeach
                @else
                    <div class="alert alert-warning text-center"><h5>{{ trans('app.no articles') }}</h5></div>
                @endif
                </div>
            </div>
        </div>

        <div class="hidden-xs col-sm-4">
            @include('sidebar')
        </div>
    </div>
</section>



@stop
