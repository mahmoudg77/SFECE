@extends('layouts.app')

@section('title') Contact Us @endsection

@section('content')

<?php

    // Check if User Coming From A Request
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        
        // Assign Variables
        $user = filter_var($_POST['username'], FILTER_SANITIZE_STRING);
        $mail = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
        $cell = filter_var($_POST['cellphone'], FILTER_SANITIZE_NUMBER_INT);
        $msg  = filter_var($_POST['message'], FILTER_SANITIZE_STRING);
        
        // Creating Array of Errors
        $formErrors = array();
        if (strlen($user) <= 3) {
            $formErrors[] = 'Username Must Be Larger Than <strong>3</strong> Characters';
        }
        if (strlen($msg) < 10) {
            $formErrors[] = 'Message Can\'t Be Less Than <strong>10</strong> Characters'; 
        }
        
        // If No Errors Send The Email [ mail(To, Subject, Message, Headers, Parameters) ]
        
        $headers = 'From: ' . $mail . '\r\n';
        $myEmail = Setting::getIfExists('linkedin');//'sfece@gmail.com';
        $subject = 'Contact Form';
        
        if (empty($formErrors)) {
            
            mail($myEmail, $subject, $msg, $headers);
            
            $user = '';
            $mail = '';
            $cell = '';
            $msg = '';
            
            $success = '<div class="alert alert-success">We Have Recieved Your Message</div>';
            
        }
        
    }
?>
  
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
        <form class="contact-form" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="POST">
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
            <div class="form-group">
                <input 
                       class="username form-control" 
                       type="text" 
                       name="username" 
                       placeholder="{{ trans('app.contact-name') }}"
                       value="<?php if (isset($user)) { echo $user; } ?>" />
                <i class="fa fa-user fa-fw"></i>
                <span class="asterisx">*</span>
                <div class="alert alert-danger custom-alert">
                    Username Must Be Larger Than <strong>3</strong> Characters
                </div>
            </div>
            <div class="form-group">
                <input 
                       class="email form-control" 
                       type="email" 
                       name="email" 
                       placeholder="{{ trans('app.contact-email') }}" 
                       value="<?php if (isset($mail)) { echo $mail; } ?>" />
                <i class="fa fa-envelope fa-fw"></i>
                <span class="asterisx">*</span>
                <div class="alert alert-danger custom-alert">
                    Email Can't Be <strong>Empty</strong>
                </div>
            </div>
            <input 
                   class="form-control" 
                   type="text" 
                   name="cellphone" 
                   placeholder="{{ trans('app.contact-tel') }}" 
                   value="<?php if (isset($cell)) { echo $cell; } ?>" />
            <i class="fa fa-phone fa-fw"></i>
            <div class="form-group">
                <textarea 
                      class="message form-control" 
                      name="message"
                      placeholder="{{ trans('app.contact-message') }}"><?php if (isset($msg)) { echo $msg; } ?></textarea>
                <span class="asterisx">*</span>
                <div class="alert alert-danger custom-alert">
                    Message Can\'t Be Less Than <strong>10</strong> Characters
                </div>
            </div>
            <input 
               class="btn btn-success" 
                       type="submit" 
                       value="{{ trans('app.contact-send') }}" />
                <i class="fa fa-send fa-fw send-icon send-icon-btn"></i>
            </form>
    </div>
</div>
        
        <!-- End Form -->
@stop