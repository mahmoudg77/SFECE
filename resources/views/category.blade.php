@extends('layouts.app')

@section('content')

<section class="category" style="min-height:500px;">
    <div class="col-xs-12">
        <h3 style="background-color: #ddd;padding: 10px;border--top: 5px solid #224668;margin-bottom: 20px;">
            {{ $categoryName->title }}</h3>
        <div class="row">
        @foreach($allPostsByCat as $post)
            <div class="col-sm-4">
            <a href="/ar/{{ $post->slug }}">
                <div class="panel panel-default blog wow fadeInDown">
                    <div class="panel-body" style="padding:0;box-shadow: 0px 0px 3px 0px #777;border: 3px solid #fff;">
                        <div class="blog-header" style="background-color: #414042;padding: 7px 10px;">
                            <h4 class="media-heading" style="color:#fff;height:40px;">{{ $post->title }}</h4>
                        </div>
                        <div class="blog-content">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnnOX--EG2IfmT8pYxuOw-xKRnq8g6kdOVJ9g4F8tVWKqjWNOA" class="media-object" style="width:100%;height: 200px;">
                        </div>
                    </div>
                </div>
            </a>
            </div>
        @endforeach
        </div>
    </div>
</section>

@stop