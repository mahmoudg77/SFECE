@if(Request::ajax())
    @yield('css')
    @yield('content')
    @yield('js')
@else

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Admin | @yield('title', 'Dashboard')</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="{{ asset('dashboard/css/style.css') }}" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="http://cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>
    <link href="{{ asset('dashboard/css/jquery-ui.css')}}" rel="stylesheet" />
    <link href="{{ asset('dashboard/css/jquery.datetimepicker.css')}}" rel="stylesheet" />
    <link href="{{ asset('dashboard/css/jquery.dataTables.min.css')}}" rel="stylesheet" />
    <link href="{{ asset('dashboard/css/buttons.dataTables.min.css')}}" rel="stylesheet" />
    <link href="{{ asset('dashboard/css/iziToast.min.css')}}" rel="stylesheet" />

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
          <a class="navbar-brand" href="#">AdminStrap</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="{{ url('/admin') }}">Dashboard</a></li>
            <li><a href="{{ url ('/admin/category')}}">Sections</a></li>
            <li><a href="posts.html">Posts</a></li>
            <li><a href="users.html">Users</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">

            @if (Auth::guest())
                <li><a href="{{ url('/login') }}">Login</a></li>
            @else
                <li><a href="#">Welcome, {{ Auth::user()->name }}</a></li>
                <li><a href="{{ url('/logout') }}">Logout</a></li>
            @endif


          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <header id="header">
      <div class="container">
        <div class="row">
          <div class="col-md-10">
            <h1><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Dashboard <small>Manage Your Site</small></h1>
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
          <li class="active">Dashboard</li>
        </ol>
      </div>
    </section> --}}

    <section id="main" style="min-height: 600px;">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <div class="list-group">
              <a class="list-group-item active main-color-bg">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Dashboard
              </a>
              <a href="/admin/category" class="list-group-item"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Categories <span class="badge">12</span></a>
              <a href="/admin/customer" class="list-group-item"><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Customers <span class="badge">12</span></a>
              <a href="posts.html" class="list-group-item"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Posts <span class="badge">33</span></a>
              <a href="users.html" class="list-group-item"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Users <span class="badge">203</span></a>
              <a href="/posts/edit/1" class="btnEditAjax  list-group-item edit">Edit Ajax</a>
            </div>


          </div>
          <div id="page-container" class="col-md-9">

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
    <script src="{{ asset('dashboard/js/jquery.form.js')}}"></script>
    <script src="{{ asset('dashboard/js/jquery.dataTables.min.js')}}"></script>
    <script src="{{ asset('dashboard/js/jquery.datetimepicker.full.js')}}"></script>
    <script src="{{ asset('dashboard/js/iziToast.min.js')}}"></script>
    <script>
      $(function(){
        $(".btnEditAjax").click(function(e){
           var btn = $(this);

               e.preventDefault();

              $('#myModal').modal('show');
              $("#myModal .modal-body").html("<div class='text-center'><img src='{{asset('dashboard/images/loading-bar.gif')}}'/></div>");

              $("#myModal .modal-body").load(btn.attr("href"), function (data, status, xhr) {

                  if (btn.hasClass("edit")) {
                      $("#myModal .modal-title").html("Edit");
                  } else if (btn.hasClass("delete")) {
                      $("#myModal .modal-title").html("Delete");
                  } else if (btn.hasClass("details")) {
                      $("#myModal .modal-title").html("Details");
                  }

                  if (status == "error") {
                      $("#myModal .modal-body").html("<div class='alert alert-danger text-center'><strong>Sorry; </strong>" + xhr.status + " " + xhr.statusText + "</div>");
                      return;
                  }

                  $("#myModal .modal-body  .back").hide();

                  $("#myModal .modal-body form").ajaxForm({
                      dataType: "json",
                      success: function (data) {

                          if (data.type == 'success') {
                              iziToast.show({
                                  title: 'Success',
                                  message: data.message,
                                  color: 'green', // blue, red, green, yellow
                                  position: 'topCenter',
                              });

                              $('#myModal').modal('toggle');
                              // if (window.location.href.indexOf("/Projects/Wizard/") > -1) {
                              //     $(".projects ul li.active > a").click();
                              // } else {
                                  window.location = window.location;
                              // }

                          } else {
                              iziToast.show({
                                  title: 'Error',
                                  message: data.message,
                                  color: 'red', // blue, red, green, yellow
                                  position: 'topCenter',
                              });
                          }


                      },
                      error: function (data, status, xhr) {
                          // var obj = JSON.parse(data.responseText);
                          iziToast.show({
                              title: 'Error',
                              message: data.status + " " + xhr,
                              color: 'red', // blue, red, green, yellow
                              position: 'topCenter',
                          });
                      }
                  });

                  $('.date').datetimepicker({
                      timepicker: false,
                      ampm: true, // FOR AM/PM FORMAT
                      format: 'Y-m-d',
                  });
                  $('.datetime').datetimepicker({
                      timepicker: true,
                      ampm: true, // FOR AM/PM FORMAT
                      format: 'Y-m-d g:i A',
                      step: 15
                  });
                  $('.time').datetimepicker({
                      timepicker: true,
                      ampm: true, // FOR AM/PM FORMAT
                      format: 'g:i A',
                      step: 5,
                      minDate: new Date(),
                      maxDate: new Date(),
                      datepicker: false

                  });
                  $('.color').colorpicker({});
                  $('.multiselect').multiselect({
                      includeSelectAllOption: true,
                      maxHeight: 200
                      /*allSelectedText: 'All'*/
                  });
              }, function (data, status, xhr) {
                  $("#myModal .modal-body").html("<div class='alert alert-danger text-center'><strong>Sorry; </strong>" + xhr.status + " " + xhr.statusText + "</div>");
              });



        });

      });
    </script>

    @yield('js')


  </body>
</html>
@endif
