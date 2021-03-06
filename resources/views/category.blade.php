@extends('layouts.app')

@section('title'){{ $title }}@endsection
@section('description'){{ str_limit(strip_tags($description),100) }}@endsection



@section('content')

<section class="category-page" style="min-height:500px;">
    
    <div class="r-ow">
        <div class="col-sm-8">
             <h3 style="background-color: #ddd;padding: 10px;border--top: 5px solid #224668;margin-bottom: 20px;">
                {{ $title }}</h3>

                @if(count($allPostsByCat)>0)
                @foreach($allPostsByCat as $post)
                    <div class="cat-content">
                    <a href="{{route('getPostBySlug', $post->slug) }}" style="text-decoration:none">
                        <h3 class="media-heading" >{{ $post->title }}</h3>
                        <hr/>
                    </a>
                    <small style="padding: 10px;">
                        <span>
                            <i class="fa fa-user"></i> {{ $post->Creator!=null?$post->Creator->name:null }}
                        </span>
                        <span>
                            <i class="fa fa-folder"></i>
                            <a href="{{route('categoryBySlug', $post->Category->slug)}}">{{ $post->Category->title }}</a>
                        </span>
                        <span><i class="fa fa-tags"></i> {!! Func::tagLinks($post->strTags())!!}</span>
                    </small>
                    <div class="row cat-content-body">
                        <div class="col-sm-6">
                            <a href="{{route('getPostBySlug', $post->slug) }}" style="text-decoration:none">
                            <img src="{{$post->mainImage()}}" class="media-object" style="width:100%;height: 200px;">
                            </a>
                        </div>
                        <div class="col-sm-6">

                            {!! str_limit($post->body, 200) !!}
                            <div class="" style="float: left">
                                <a href="{{route('getPostBySlug', $post->slug) }}"
                                   class="btn btn-danger btn-sm">{{trans('app.read more')}}</a>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                    <div class="clearfix"></div>
                    <div class="uderline"></div>
                    </div>
                @endforeach
                @else
                    <div class="alert alert-warning text-center"><h5>{{ trans('app.no articles') }}</h5></div>

                @endif

        </div>
        <div class="hidden--xs col-xs-12 col-sm-4">
            @include('sidebar')
        </div>
    </div>
</section>

@stop

