

 @if(!Request::ajax())

<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    
    <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/font-awesome.min.css') }}" rel="stylesheet">

    <link href="{{ asset('css/camera.css') }}" rel="stylesheet">
    <link href="{{ asset('css/front-end.css') }}" rel="stylesheet">
    
</head>
<body>
<div id="app">
        
<div class="container">
    <div class="row" style="background-color: #eee">
        <div class="header-top">
            <div class="pull-right">
              <ul class="list-inline">
                @if (Auth::guest())
                    <li><a href="{{ url('/login') }}" class="btn btn-link site-login"><i class="fa fa-user"></i> تسجيل الدخول</a></li>
                    <li><a href="{{ url('/register') }}" class="btn btn-link site-login"><i class="fa fa-user-plus"></i> حساب جديد</a></li>
                @else
                    <li><a href="#" class="btn btn-link"><i class="fa fa-btn fa-user"></i> {{ Auth::user()->name }}</a></li>
                    <li><a href="{{ url('/dashboard') }}"><i class="fa fa-btn fa-th-large"></i> Control Panel</a></li>
                    <li><a href="{{ url('/logout') }}"><i class="fa fa-btn fa-sign-out"></i> Logout</a></li>
                @endif
              </ul>
            </div>
            <div class="pull-left">
                <div class="social-media">
                    <i class="fa fa-facebook-square fa-lg"></i>
                    <i class="fa fa-twitter-square fa-lg"></i>
                    <i class="fa fa-youtube-square fa-lg"></i>
                </div>
            </div>
          </div>
          <div class="clear-fix"></div>
          <div class="header">
              <div class="col-xs-12">
                <img src="../images/logo.png" class="img-responsive center-block" alt="" title=""/>
                <h3>المؤسسة العلمية للطفولة المبكرة</ h3>
              </div>
                
          </div>

        <nav class="navbar navbar--default navbar-static-top navbar-inverse">
            <div class="container">
                <div class="navbar-header">
                    <!-- Collapsed Hamburger -->
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
                        <span class="sr-only">Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- Branding Image -->
                    <!-- <a class="navbar-brand" href="{{ url('/') }}">SFECE</a> -->
                </div>

                <div class="collapse navbar-collapse pull-right" id="app-navbar-collapse">
                    <!-- Left Side Of Navbar -->
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="{{ url('/home') }}" >الرئيسية</a></li>
                        <li><a href="{{ url('/home') }}">الدورات</a></li>
                        <li><a href="{{ url('/home') }}">المقالات</a></li>
                        <li><a href="{{ url('/home') }}">طلب بحث</a></li>
                        <li><a href="{{ url('/home') }}">بحث</a></li>
                        <li><a href="{{ url('/home') }}">اصداراتنا</a></li>
                        <li><a href="{{ url('/home') }}">اتصل بنا</a></li>
                    </ul>

                    <!-- Right Side Of Navbar -->
<!--
                    <ul class="nav navbar-nav navbar-right">
                        @if (Auth::guest())
                            
                        @else
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                    {{ Auth::user()->name }} <span class="caret"></span>
                                </a>

                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="{{ url('/admin') }}"><i class="fa fa-btn fa-th-large"></i>Control Panel</a></li>
                                    <li><a href="{{ url('/logout') }}"><i class="fa fa-btn fa-sign-out"></i>Logout</a></li>
                                </ul>
                            </li>
                        @endif
                    </ul>
-->
                </div>
            </div>
        </nav>
@endif
        @yield('content')

        <div style="clear:both;display:block">
        <!-- Footer -->
        <footer class="footer">
            <div class="col-sm-6">
                <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
            </div>
            <div class="col-sm-6 footer-list">
                <ul class="list-inline">
                    <li><a href="{{ url('/home') }}">الدورات</a></li>
                    <li><a href="{{ url('/home') }}">المقالات</a></li>
                    <li><a href="{{ url('/home') }}">اصداراتنا</a></li>
                    <li><a href="{{ url('/home') }}">اتصل بنا</a></li>
                </ul>
            </div>
        </footer>
    </div>
</div>
    

    
@if(!Request::ajax())
</div>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}"></script>
    
    <script src="{{ asset('js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('js/jquery.min.js') }}"></script>

    <script src="{{ asset('js/camera.min.js') }}"></script>
    <script src="{{ asset('js/jquery.easing.1.3.js') }}"></script>
    <script>
        jQuery(function(){

            jQuery('#camera_wrap_1').camera({
                thumbnails: true,
                height: '400px',
            });

            // jQuery('#camera_wrap_2').camera({
            //     height: '400px',
            //     loader: 'bar',
            //     pagination: false,
            //     thumbnails: true
            // });
        });
    </script>
</body>
</html>
@endif
