<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="{{ asset('vendor/bootstrap/css/bootstrap.min.css') }}">
  <link rel="stylesheet" href="{{ asset('vendor/jquery/jquery.dataTables.min.css') }}">
  <link rel="stylesheet" href="{{ asset('vendor/select2/select2.min.css') }}">
  <script defer src="{{ asset('vendor/fontawesome/js/all.js') }}"></script>
  <link rel="stylesheet" href="{{ asset('assets/css/base.css') }}">
  <title>CertiMax</title>
</head>
<body>

<nav class="navbar navbar-expand-md navbar-light">
  <button class="navbar-toggler ml-auto"
          type="button"
          data-toggle="collapse"
          data-target="#boo">
    <i class="navbar-toggler-icon"></i>
  </button>
  <div class="collapse navbar-collapse" id="boo">
    <div class="container-fluid">
      <div class="row">
        <!-- sidebar -->
        @include('layouts.includes.sidebar')
        <!-- end sidebar -->

        <!-- top nav -->
        @include('layouts.includes.header')
        <!-- end top nav -->
      </div>
    </div>
  </div>
</nav>

<div class="modal fade" id="sign-out">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">¿Quieres salir?</h4>
        <button type="button" class="close" data-dismiss=modal>&times;</button>
      </div>
      <div class="modal-body">
        Presiona cerrar para salir.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-dismiss="modal">Quedarme</button>
        <a class="btn btn-danger" href="#"
           onclick="event.preventDefault();document.getElementById('logout-form').submit();">
          {{ __('Logout') }}
        </a>
        <form autocomplete="off" id="logout-form" action="#" method="POST" class="d-none">
          @csrf
        </form>
      </div>
    </div>
  </div>
</div>

<!-- main-content -->
<section>
  <div class="container-fluid">
    <div class="row my-5">
      <div class="col-xl-10 col-md-9 ml-auto">
        @if (session('status'))
          <div class="row">
            <div class="col-12">
              <div class="alert alert-success alert-dismissible fade show mt-5 mb-0" role="alert">
                <!-- <strong class="alert-heading">{{ session('status') }}</strong> -->
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            </div>
          </div>
        @endif

        @yield('content')
      </div>
    </div>
  </div>
</section>
<!-- end of main-content -->

<!-- footer -->
@include('layouts.includes.footer')
<!-- end of footer -->

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="{{ asset('vendor/jquery/jquery-3.3.1.slim.min.js') }}"></script>
<script src="{{ asset('vendor/jquery/jquery-3.3.1.datatables.min.js') }}"></script>
<script src="{{ asset('vendor/popper/js/popper.min.js') }}"></script>
<script src="{{ asset('vendor/bootstrap/js/bootstrap.min.js') }}"></script>
@yield('javascript')
</body>
</html>
