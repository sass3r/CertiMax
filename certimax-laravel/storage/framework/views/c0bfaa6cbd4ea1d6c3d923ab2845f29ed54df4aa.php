<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="<?php echo e(asset('vendor/bootstrap/css/bootstrap.min.css')); ?>">
  <link rel="stylesheet" href="<?php echo e(asset('vendor/jquery/jquery.dataTables.min.css')); ?>">
  <link rel="stylesheet" href="<?php echo e(asset('vendor/select2/select2.min.css')); ?>">
  <script defer src="<?php echo e(asset('vendor/fontawesome/js/all.js')); ?>"></script>
  <link rel="stylesheet" href="<?php echo e(asset('assets/css/base.css')); ?>">
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
        <?php echo $__env->make('layouts.includes.sidebar', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <!-- end sidebar -->

        <!-- top nav -->
        <?php echo $__env->make('layouts.includes.header', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
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
          <?php echo e(__('Logout')); ?>

        </a>
        <form autocomplete="off" id="logout-form" action="#" method="POST" class="d-none">
          <?php echo csrf_field(); ?>
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
        <?php if(session('status')): ?>
          <div class="row">
            <div class="col-12">
              <div class="alert alert-success alert-dismissible fade show mt-5 mb-0" role="alert">
                <!-- <strong class="alert-heading"><?php echo e(session('status')); ?></strong> -->
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            </div>
          </div>
        <?php endif; ?>

        <?php echo $__env->yieldContent('content'); ?>
      </div>
    </div>
  </div>
</section>
<!-- end of main-content -->

<!-- footer -->
<?php echo $__env->make('layouts.includes.footer', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<!-- end of footer -->

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="<?php echo e(asset('vendor/jquery/jquery-3.3.1.slim.min.js')); ?>"></script>
<script src="<?php echo e(asset('vendor/jquery/jquery-3.3.1.datatables.min.js')); ?>"></script>
<script src="<?php echo e(asset('vendor/popper/js/popper.min.js')); ?>"></script>
<script src="<?php echo e(asset('vendor/bootstrap/js/bootstrap.min.js')); ?>"></script>
<?php echo $__env->yieldContent('javascript'); ?>
</body>
</html>
<?php /**PATH /srv/http/public_html/hackaton/CertiMax/certimax-laravel/resources/views/layouts/master.blade.php ENDPATH**/ ?>