<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}" >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'SFECE') }}</title>

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">

    @if(app()->getLocale()=='ar')
        <!-- Load Bootstrap RTL theme from RawGit -->
        <link rel="stylesheet" href="//cdn.rawgit.com/morteza/bootstrap-rtl/v3.3.4/dist/css/bootstrap-rtl.min.css">
        <link href="{{ asset('css/front-end-rtl.css') }}" rel="stylesheet">
    @else
        <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet">
        <link href="{{ asset('css/front-end.css') }}" rel="stylesheet">
    @endif

    <link href="{{ asset('css/font-awesome.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/camera.css') }}" rel="stylesheet">
    <link href="{{ asset('css/animate.css') }}" rel="stylesheet">



</head>
<body dir="{{(app()->getLocale()=='ar')?'rtl':'ltr'}}">
<div id="app">

<div class="container">
    <div class="row" style="background-color: #eee">
        <div class="header-top">
            <div class="pull-{{(app()->getLocale()=='ar')?'right':'left'}}">
              <ul class="list-inline">
                @if (Auth::guest())
                    <li><a href="{{ route('login') }}" class="site-login">
                        <i class="fa fa-user"></i> {{trans('app.login')}}</a></li>
                    <li><a href="{{ route('register') }}" class="site-login">
                        <i class="fa fa-user-plus"></i> {{trans('app.register')}}</a></li>
                @else
                    <li><a href="#" class=""><i class="fa fa-btn fa-user"></i> {{ Auth::user()->name }}</a></li>
                  <li><a href="{{ url('/logout') }}" onclick="event.preventDefault();
                               document.getElementById('logout-form').submit();">{{trans('app.logout')}}</a>
					  <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
						  {{ csrf_field() }}
					  </form>
				  </li>
                    <li><a href="{{ route('cp.dashboard') }}" >{{trans('app.control panel')}}</a></li>

                @endif
                  <li><a href="#" class="">طلب نشر</a></li>
                  <li><a href="#" class="">رئيس المؤسسة</a></li>
              </ul>
            </div>
            <div class="pull-{{(app()->getLocale()=='ar')?'left':'right'}}">
                <div class="social-media">
                    <a href="{{route('swichlang')}}">{{(app()->getLocale()=='ar')?'English':'عربي'}}</a>
                    <i class="fa fa-facebook-square fa-lg"></i>
                    <i class="fa fa-twitter-square fa-lg"></i>
                    <i class="fa fa-youtube-square fa-lg"></i>
                </div>
            </div>
          </div>
          <div class="clear-fix"></div>
          <div class="header">
              <div class="col-xs-12">
                <img src="{{asset('images/logo.png')}}" class="img-responsive center-block" alt="" title=""/>
                <h3>المؤسسة العلمية للطفولة المبكرة</h3>
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

                <div class="collapse navbar-collapse pull-{{(app()->getLocale()=='ar')?'right':'left'}}" id="app-navbar-collapse">
                    <!-- Left Side Of Navbar -->
                    <ul class="nav navbar-nav navbar-{{(app()->getLocale()=='ar')?'right':'left'}}">
                        @foreach(App\Models\Menu::where("location","main")->first()->Links()->where('parent_id','0')->orWhereNull('parent_id')->get() as $link)
                            <li class="{{Request::is(app()->getLocale().$link->customlink)?'active':''}}">
                                @if($link->Links()->count()>0)
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        {{$link->title}} <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        @foreach($link->Links as $sublink)
                                        <li class="{{Request::url() === app()->getLocale().'/'.$sublink->title?'active':''}}"><a href="{{$sublink->customlink}}" class="">{{$sublink->title}}</a></li>
                                        @endforeach
                                    </ul>
                                @else
                                    <a href="{{$link->customlink}}" >{{$link->title}}</a>
                                @endif
                            </li>
                        @endforeach

                        {{--<li class="active"><a href="{{ url('/') }}" >الرئيسية</a></li>--}}
                        {{--<li class="dropdown">--}}
                            {{--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">--}}
                                {{--من نحن ؟ <span class="caret"></span></a>--}}
                            {{--<ul class="dropdown-menu">--}}
                              {{--<li><a href="#" class="">الرؤية والإهداف</a></li>--}}
                              {{--<li><a href="#" class="">مجلس الامناء</a></li>--}}
                              {{--<li><a href="#" class="">المجلس الاستشارى</a></li>--}}
                              {{--<li><a href="#" class="">اصداراتنا</a></li>--}}
                            {{--</ul>--}}
                        {{--</li>--}}
                        {{--<li><a href="{{ url('/home') }}">المركز</a></li>--}}
                        {{--<li><a href="{{ url('/home') }}">المجلة</a></li>--}}
                        {{--<li><a href="{{ url('/home') }}">الأكاديمية</a></li>--}}
                        {{--<li>--}}
                            {{--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">--}}
                                {{--الفعاليات السنوية <span class="caret"></span></a>--}}
                            {{--<ul class="dropdown-menu">--}}
                              {{--<li><a href="#" class="">المنتدى</a></li>--}}
                              {{--<li><a href="#" class="">المؤتمر</a></li>--}}
                            {{--</ul>--}}
                        {{--</li>--}}
                        {{--<li><a href="{{ url('/home') }}">الاباء والامهات</a></li>--}}
                        {{--<li><a href="{{ url('/home') }}">اتصل بنا</a></li>--}}
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

        @yield('content')

        <div style="clear:both;display:block">
        <!-- Footer -->
        <footer class="footer">

            <div class="col-sm-6 footer-list">
                <ul class="list-inline">
                    <li><a href="{{ url('/home') }}">الدورات</a></li>
                    <li><a href="{{ url('/home') }}">المقالات</a></li>
                    <li><a href="{{ url('/home') }}">اصداراتنا</a></li>
                    <li><a href="{{ url('/home') }}">اتصل بنا</a></li>
                </ul>
            </div>

            <div class="col-sm-6">
                <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
            </div>
        </footer>
    </div>
</div>



 </div>

    <!-- Scripts -->
    <script src="{{ asset('js/jquery.min.js') }}"></script>
    <script src="{{ asset('js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('js/camera.min.js') }}"></script>
    <script src="{{ asset('js/jquery.easing.1.3.js') }}"></script>
    <script src="{{ asset('js/wow.min.js') }}"></script>

    <script>
        $(function(){
             $('#camera_wrap_1').camera({
                thumbnails: true,
                height: '400px',
            });
            //new WOW().init();
            // jQuery('#camera_wrap_2').camera({
            //     height: '400px',
            //     loader: 'bar',
            //     pagination: false,
            //     thumbnails: true
            // });
        });
    </script>

    <script>
        wow = new WOW(
          {
            animateClass: 'animated',
            offset:       100,
            callback:     function(box) {
              console.log("WOW: animating <" + box.tagName.toLowerCase() + ">")
            }
          }
        );
        wow.init();
        document.getElementById('moar').onclick = function() {
          var section = document.createElement('section');
          section.className = 'section--purple wow fadeInDown';
          this.parentNode.insertBefore(section, this);
        };
  </script>
</body>
</html>
