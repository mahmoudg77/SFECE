@extends('layouts.app')

@section('title') Contact Us @endsection

@section('content')

<!-- Start Form -->
<div class="contact-us">
    <h1 class="text-center">{{ trans('app.contact-us') }}</h1>
    <div class="col-sm-6 wo-w slideInRight">
        <div class="panel panel-default">
            <div class="panel-body">
                @if($page=Func::getPageBySlug('contact-us'))
                  {!! $page->body !!}
                    <div class="social-media pull-{{app()->getLocale()=='en'?'right':'left'}}">
                        <a href="{{Setting::getIfExists('facebook')}}" class="text-primary" target="_blank">
                            <i class="fa fa-facebook-square fa-3x"></i>
                        </a>
                        <a href="{{Setting::getIfExists('twitter')}}" class="text-success"  target="_blank">
                            <i class="fa fa-twitter-square fa-3x"></i>
                        </a>
                        <a href="{{Setting::getIfExists('instagram')}}" class="text-danger"  target="_blank">
                            <i class="fa fa-instagram fa-3x"></i>
                        </a>
                        <a href="{{Setting::getIfExists('linkedin')}}" class="text-defualt"  target="_blank">
                            <i class="fa fa-linkedin-square fa-3x"></i>
                        </a>
                    </div>
                @endif
            </div>
        </div>
    </div>
    
    <div class="col-sm-6 wo-w slideInRight">
       
        {!! Form::open(['method'=>'POST', 'route'=>["contact.sennd"], "class"=>"contact-form"]) !!}
            <?php if (! empty($formErrors)) { ?>
            <div class="alert alert-danger alert-dismissible" role="start">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <?php
                    foreach($formErrors as $error) {
                        echo $error . '<br/>';
                    }
                ?>
            </div>
            <?php } ?>
            <?php if (isset($success)) { echo $success; } ?>
            
        <div class="form-group {{ $errors->has('email') ? 'has-error' : '' }}">
            {!! Form::text('username', old('username'), ['class'=>'username form-control', 'placeholder'=>trans('app.contact-name')]) !!}
            <i class="fa fa-user fa-fw"></i>
                <span class="asterisx">*</span>
                <div class="alert alert-danger custom-alert">
                    Username Must Be Larger Than <strong>3</strong> Characters
                </div>
        </div>
        
            
            <div class="form-group">
                {!! Form::text('email', old('email'), ['class'=>'email form-control', 'placeholder'=>trans('app.contact-email')]) !!}
                <i class="fa fa-envelope fa-fw"></i>
                <span class="asterisx">*</span>
                <div class="alert alert-danger custom-alert">
                    Email Can't Be <strong>Empty</strong>
                </div>
            </div>
            {!! Form::text('cellphone', old('cellphone'), ['class'=>'cellphone form-control', 'placeholder'=>trans('app.contact-tel')]) !!}
            <i class="fa fa-phone fa-fw"></i>
            <div class="form-group">
                {!! Form::textarea('message', old('message'), ['class'=>'message form-control', 'placeholder'=>trans('app.contact-message')]) !!}
                <span class="asterisx">*</span>
                <div class="alert alert-danger custom-alert">
                    Message Can\'t Be Less Than <strong>10</strong> Characters
                </div>
            </div>
<!--            <button class="btn btn-success">Contact US!</button>-->
            <input 
               class="btn btn-success" 
                       type="submit" 
                       value="{{ trans('app.contact-send') }}" />
                <i class="fa fa-send fa-fw send-icon send-icon-btn"></i>
            
        {!! Form::close() !!}
    </div>
</div>
        
        <!-- End Form -->
@stop