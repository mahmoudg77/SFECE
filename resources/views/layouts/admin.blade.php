@if(Request::ajax())
    @yield('css')
    @yield('content')
    @yield('js')
@else

<?php
  $mainmenu=DASHMENU;
  $qmenu=app('request')->input('menu');
  //if(!$qmenu)$qmenu="Category";
  ?>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Admin | @yield('title', 'cpanel')</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="{{ asset('cpanel/css/style.css') }}" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="http://cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>
    <link href="{{ asset('cpanel/css/jquery-ui.css')}}" rel="stylesheet" />
    <link href="{{ asset('cpanel/css/jquery.datetimepicker.css')}}" rel="stylesheet" />
    <link href="{{ asset('cpanel/css/jquery.dataTables.min.css')}}" rel="stylesheet" />
    <link href="{{ asset('cpanel/css/buttons.dataTables.min.css')}}" rel="stylesheet" />
    <link href="{{ asset('cpanel/css/iziToast.min.css')}}" rel="stylesheet" />

    @yield('css')
   </head>
  <body>

    <nav class="navbar navbar-default">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="{{ url (CP_URL)}}">Dashboard</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="{{$qmenu==null?'active':''}}"><a href="{{ url (CP_URL)}}">cpanel</a></li>
            @foreach($mainmenu as $key=>$menu)
              @if(Auth::user()->hasRoles($menu['roles']))
                <li class="{{$qmenu==$key?'active':''}}"><a  href="{{$menu['url']}}">{{$key}}</a></li>
              @endif
            @endforeach
            <!-- <li><a href="{{ route ('cp.category.index')}}">Sections</a></li>
            <li><a href="{{ route ('cp.posts.index')}}">Posts</a></li>
            <li><a href="{{ route ('cp.user.index')}}">Users</a></li> -->
          </ul>
          <ul class="nav navbar-nav navbar-right">

            @if (Auth::guest())
                <li><a href="{{ url('/login') }}">Login</a></li>
            @else
                <li><a href="#">Welcome, {{ Auth::user()->name }}</a></li>
                <li>
                  <a href="{{ route('logout') }}"
                      onclick="event.preventDefault();
                               document.getElementById('logout-form').submit();">
                      Logout
                  </a>

                  <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                      {{ csrf_field() }}
                  </form>
                </li>
            @endif


          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <header id="header">
      <div class="container">
        <div class="row">
          <div class="col-md-10">
            <h1><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> cpanel <small>Manage Your Site</small></h1>
          </div>
{{--           <div class="col-md-2">
            <div class="dropdown create">
              <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                Create Content
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                <li><a type="button" data-toggle="modal" data-target="#addPage">Add Page</a></li>
                <li><a href="#">Add Post</a></li>
                <li><a href="#">Add User</a></li>

              </ul>
            </div>
          </div> --}}
        </div>
      </div>
    </header>

    {{-- <section id="breadcrumb">
      <div class="container">
        <ol class="breadcrumb">
          <li class="active">cpanel</li>
        </ol>
      </div>
    </section> --}}

    <section id="main" style="min-height: 600px;">
      <div class="container">
        <div class="row">
          @if($qmenu)
          <div class="col-md-3">
            <div class="list-group">
              <!-- <a class="list-group-item active main-color-bg">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span> cpanel
              </a>
              <a href="{{ route('cp.category.index')}}" class="list-group-item"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Categories <span class="badge">12</span></a>
              <a href="/admin/customer" class="list-group-item"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Customers <span class="badge">12</span></a>

              @foreach(App\Models\PostType::all() as $posttype)
                <a href="{{ route('cp.posts.index')}}?type={{$posttype->id}}" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> <strong>{{$posttype->name}}</strong>  <span class="badge">{{count($posttype->Posts)}}</span></a>
              @endforeach

              <a class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> <strong>Users <strong></a>
              @foreach(App\Models\AccountLevel::all() as $level)
                <a href="{{ route('cp.user.index')}}?level={{$level->id}}" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> {{$level->name}}<span class="badge">{{count($level->Accounts)}}</span></a>
              @endforeach -->

              <a class="list-group-item active main-color-bg">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span> cpanel
              </a>

              @foreach($mainmenu[$qmenu]['submenu'] as $key=>$menu)
                @if(Auth::user()->hasRoles($menu['roles']))
                  <a href="{{$menu['url']}}" class="list-group-item"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> {{$key}} </a>
                @endif
              @endforeach

             </div>

          </div>

          <div id="page-container" class="col-md-9">
            @else
            <div id="page-container" class="col-md-12">
            @endif
            @yield('content')


          </div>
        </div>
      </div>
    </section>
    <div id="myModal" class="modal fade  " role="dialog">
              <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                      <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h5 class="modal-title">Create new</h5>
                      </div>
                      <div class="modal-body">

                      </div>
                      <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                      </div>
                  </div>

              </div>
          </div>


  <script>
    // CKEDITOR.replace( 'editor1' );
 </script>

    <!-- Bootstrap core JavaScript
    ================================================== -->
        <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="{{ asset('cpanel/js/jquery.form.js')}}"></script>
    <script src="{{ asset('cpanel/js/jquery.dataTables.min.js')}}"></script>
    <script src="{{ asset('cpanel/js/jquery.datetimepicker.full.js')}}"></script>
    <script src="{{ asset('cpanel/js/iziToast.min.js')}}"></script>
    <script src="{{ asset('cpanel/js/script.js')}}"></script>


    @yield('js')


  </body>
</html>
@endif
