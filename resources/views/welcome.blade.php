@extends('layouts.app')

@section('content')
  <div class="camera_wrap camera1_azure_skin" id="camera_wrap_1" style ="padding-top:10px;">
      @if (count($allSlider)>0)
      @foreach($allSlider as $slider)
        <div data-src="{{$slider->mainImage()}}" data-thumb="{{$slider->mainImage(true)}}"></div>
      @endforeach
      @endif
<!--
    <div data-thumb="../images/slides/thumbs/s1.jpg" data-src="../images/slides/s1.jpg"></div>
    <div data-thumb="../images/slides/thumbs/s3.jpg" data-src="../images/slides/s3.jpg"></div>
    <div data-thumb="../images/slides/thumbs/s4.jpg" data-src="../images/slides/s4.jpg"></div>
    <div data-thumb="../images/slides/thumbs/s5.jpg" data-src="../images/slides/s5.jpg"></div>
-->
  </div><!-- #camera_wrap_1 -->

    <div class="clearfix"></div>
  <div class="row w-ow fadeInUp" style ="padding: 0 15px;margin--bottom: 20px;" data-w-ow-duration="2s" data-wow-delay="1s">
@if (count($lastPosts)>0)
@foreach($lastPosts as $post)
    <a href="{{ route('getPostBySlug', $post->slug) }}">
    <div class="col-sm-4">
        <div class="panel panel-default blog ">
            <div class="panel-body" style= "padding:0;">
                <div class="blog-header">
                    <h4 class="media-heading">{{$post->title}}</h4>
                </div>
                <div class="blog-content">
                    <figure>
                    <img src="{{$post->mainImage()}}" class="media-object" style="width:100%;height: 200px;">
                    </figure>
                </div>

            </div>
        </div>
    </div>
    </a>
@endforeach
@endif
@if($page=Func::getPageBySlug('about-us'))
<section class="about-us wo-w fadeInUp" data-wow-d-uration="2s" data-wow-delay="2s">
    <div class="col-xs-12" style="background-color:#414042;padding:10px 20px;">
      <h2>{{ $page->title}}</h2>
      {!! str_limit($page->body, 450) !!}
         @if (str_limit($page->body)) > 50)
              ... <div class="col-xs-12 text-center"><a href="{{ route('getPostBySlug', $page->slug) }}" class="btn btn-default btn-sm">{{trans('app.read more')}}</a></div>
         @endif
    </div>
</section>
@endif
<!--
      <section class="contact-us">
        <div class="col-xs-12" style="height:150px;background-color:#008993">
          <h2 style="color: #fff;text-align: center;">اتصل بنا</h2>
        </div>
      </section>
-->
  </div>

@endsection
