@extends('layouts.app')

@section('content')
  <div class="camera_wrap camera1_azure_skin" id="camera_wrap_1" style ="padding-top:10px;">
    <div data-thumb="../images/slides/thumbs/s1.jpg" data-src="../images/slides/s1.jpg"></div>
    <div data-thumb="../images/slides/thumbs/s3.jpg" data-src="../images/slides/s3.jpg"></div>
    <div data-thumb="../images/slides/thumbs/s4.jpg" data-src="../images/slides/s4.jpg"></div>
    <div data-thumb="../images/slides/thumbs/s5.jpg" data-src="../images/slides/s5.jpg"></div>
  </div><!-- #camera_wrap_1 -->


  <div class="row" style ="padding: 0 15px;margin--bottom: 20px;">
@foreach($lastPosts as $post)
    <a href="{{ route('getPostBySlug', $post->slug) }}">
    <div class="col-sm-4">
        <div class="panel panel-default blog wow fadeInDown">
            <div class="panel-body" style= "padding:0;">
                <div class="blog-header" style= "background-color: #BA0C2F;padding: 7px 10px;">
                    <h4 class="media-heading" style= "color:#fff;height: 40px;">{{$post->title}}</h4>
                </div>
                <div class="blog-content">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnnOX--EG2IfmT8pYxuOw-xKRnq8g6kdOVJ9g4F8tVWKqjWNOA" 
                         class="media-object" style="width:100%;height: 200px;">
                </div>

            </div>
        </div>
    </div>
    </a>
@endforeach


<section class="about-us wo-w slideInRight" >
    <div class="col-xs-12" style="background-color:#414042;height:150px;">
      <h2 style="color: #fff;text-align: center;">من نحن ؟</h2>
      <p style="color: #fff;font-size: 14px;font-weight: bold;line-height: 30px;">الموقع الخاص والرسمي للدكتور/ محمد خليفة إسماعيل متولي، أستاذ وخبير تربية الطفولة المبكرة، مراجع اعتماد وجودة برامج الطفولة المبكرة، وسفير اللغة لدى الجمعية الوطنية الأمريكية لتربية الأطفال الصغار NAEYC وعضو الجمعية البريطانية لتربية الطفولة المبكرة (الولادة حتى 8 سنوات)</p>
    </div>
</section>

<!--
      <section class="contact-us">
        <div class="col-xs-12" style="height:150px;background-color:#008993">
          <h2 style="color: #fff;text-align: center;">اتصل بنا</h2>
        </div>
      </section>
-->
  </div>
@endsection
