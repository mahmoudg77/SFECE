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
    <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet">
    @if(app()->getLocale()=='ar')
        <!-- Load Bootstrap RTL theme from RawGit -->
        <link rel="stylesheet" href="//cdn.rawgit.com/morteza/bootstrap-rtl/v3.3.4/dist/css/bootstrap-rtl.min.css">
        <link href="{{ asset('css/front-end-rtl.css') }}" rel="stylesheet">
    @else
        
        <link href="{{ asset('css/front-end.css') }}" rel="stylesheet">
    @endif

    <link href="{{ asset('css/font-awesome.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/camera.css') }}" rel="stylesheet">
    <link href="{{ asset('css/animate.css') }}" rel="stylesheet">

    @yield('css')

</head>
<body dir="{{(app()->getLocale()=='ar')?'rtl':'ltr'}}">
    <div id="fb-root"></div>
    <script>(function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = 'https://connect.facebook.net/ar_AR/sdk.js#xfbml=1&version=v3.0&appId=255524131659994&autoLogAppEvents=1';
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
    </script>
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
                  <li>
                      @if(Auth::guest())
                        <a href="{{ route('login') }}">{{trans('app.request research')}}</a>
                      @else
                        <a href="#" data-toggle="modal" data-target="#myModal">{{trans('app.request research')}}</a>
                      @endif
                  </li>
                  <li><a href="{{ route('getPostBySlug', 'head_institution') }}" class="">{{trans('app.head institution')}}</a></li>
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
                        @foreach(Func::menu('main') as $link)
                            <li class="{{Request::is(app()->getLocale().$link->customlink)?'active':''}}">
                                @if($link->Links()->count()>0)
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
                                       aria-haspopup="true" aria-expanded="false">
                                        {{$link->title}} <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        @foreach($link->Links as $sublink)
                                            <li class="{{Request::url() === app()->getLocale().'/'.$sublink->title?'active':''}}">                                              <a href="{{Func::menuLink($sublink)}}" class="">{{$sublink->title}}</a></li>
                                        @endforeach
                                    </ul>
                                @else
                                    @if($link->category_id>0)
                                        @if($link->hasSubs)
                                            <?php $cat=App\Models\Category::find($link->category_id);?>

                                                @if(count($cat->Chields)>0)
                                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
                                                       aria-haspopup="true" aria-expanded="false">
                                                        {{$link->title}} <span class="caret"></span></a>
                                                    <ul class="dropdown-menu">
                                                        @foreach($cat->Chields as $chield)
                                                            <li class=""><a href="{{route('getPostsByCatID',['id'=>$chield->id])}}" class="">{{$chield->title}}</a></li>
                                                        @endforeach
                                                    </ul>
                                                @else
                                                    <a href="{{route('getPostsByCatID',['id'=>$link->category_id])}}" >{{$link->title}}</a>
                                            @endif
                                            @else
                                            <a href="{{route('getPostsByCatID',['id'=>$link->category_id])}}" >{{$link->title}}</a>
                                        @endif
                                   @else

                                    <a href="{{Func::menuLink($link)}}" >{{$link->title}}</a>
                                    @endif
                                @endif
                            </li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </nav>

        @yield('content')

        <div style="clear:both;display:block">
        <!-- Footer -->
        <footer class="footer">

            <div class="col-sm-6 footer-list">
                <ul class="list-inline">
                    @foreach(Func::menu('footer') as $link)
                        <li><a href="{{ Func::menuLink($link)}}">{{$link->title}}</a></li>

                        @endforeach
                    {{----}}
                    {{--<li><a href="{{ url('/home') }}">الدورات</a></li>--}}
                    {{--<li><a href="{{ url('/home') }}">المقالات</a></li>--}}
                    {{--<li><a href="{{ url('/home') }}">اصداراتنا</a></li>--}}
                    {{--<li><a href="{{ url('/home') }}">اتصل بنا</a></li>--}}
                </ul>
            </div>

            <div class="col-sm-6">
                <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
            </div>
        </footer>
    </div>
</div>

<!--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>-->
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">{{trans('app.request research')}}</h4>
      </div>
      <div class="modal-body">
         <form action="/action_page.php">
              <div class="form-group">
                <label for="email">Email address:</label>
                <input type="email" class="form-control" id="email">
              </div>
              <div class="form-group">
                  <label for="usr">Name:</label>
                  <input type="text" class="form-control" id="usr">
                </div>
               <div class="form-group">
                  <label for="comment">Comment:</label>
                  <textarea class="form-control" rows="5" id="comment"></textarea>
                </div> 
              <button type="submit" class="btn btn-default">Submit</button>
        </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


 </div>

    <!-- Scripts -->
    <script src="{{ asset('js/jquery.min.js') }}"></script>
    <script src="{{ asset('js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('js/camera.min.js') }}"></script>
    <script src="{{ asset('js/jquery.easing.1.3.js') }}"></script>
    <script src="{{ asset('js/wow.min.js') }}"></script>
    <script src="{{ asset('js/custom.js') }}"></script>

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
@yield('js')
</body>

</html>
