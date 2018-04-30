@extends('layouts.app')

@section('content')

<section class="single" style="min-height:500px;">
    <div class="col-xs-12">
        <div class="single-box">
            <div class="single-img">
                <img src="http://mqqal.com/wp-content/uploads/2018/04/%D9%82%D8%B1%D8%A7%D8%A1%D8%A9-%D9%81%D9%8A-%D9%85%D8%A8%D8%A7%D8%B1%D8%A7%D8%A9-%D9%84%D9%8A%D9%81%D8%B1%D8%A8%D9%88%D9%84-%D9%88%D8%B1%D9%88%D9%85%D8%A7-%D9%88%D9%83%D9%8A%D9%81-%D9%8A%D8%B5%D9%84-%D9%84%D9%8A%D9%81%D8%B1%D8%A8%D9%88%D9%84-%D8%A5%D9%84%D9%89-%D8%A7%D9%84%D9%86%D9%87%D8%A7%D8%A6%D9%8A-660x330.jpg" 
                             class="img-responsive center--block img-thumbanail" >
            </div>
            
            <div class="single-content">
                <h2>{{ $singlePost->title }}</h2>
            </div>
        </div>
    </div>
</section>

@stop