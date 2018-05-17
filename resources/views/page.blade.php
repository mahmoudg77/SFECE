@extends('layouts.app')

@section('content')

<section class="single" style="min-height:500px;">
    <div class="col-xs-12 col-sm-8">
        <div class="single-box">
            <div class="single-img">
                <img src="{{ $singlePost->mainImage() }}" class="img-responsive center--block img-thumbanail" />
            </div>

            <div class="single-content">
                <h2>{{ $singlePost->title }}</h2>
                
                <div class="uderline" style="padding:10px 0.border:1px solid #ddd;"></div>
                <p>{!! $singlePost->body !!} </p>
            </div>
        </div>
    </div>

    <div class="col-xs-hidden col-sm-4">
        @include('sidebar')
    </div>
</section>

@stop
