<?php $__env->startSection('content'); ?>
    <div class="row mt-5 justify-content-center">
      <div class="col-12">
        <div class="card border-0">
          <div class="card-header text-dark text-capitalize border-0">
            <h4 class="m-0 float-left">Inicio</h4>
          </div>
          <div class="card-body p-0">
            <table id="dtHorizontalVerticalExample"
                   class="table table-striped table-bordered table-sm bg-light text-center m-0 display nowrap"
                   width="100%">
              <thead>
                <tr class="text-muted text-capitalize">
                  <th>#</th>
                  <th>codigo</th>
                  <th>nombre</th>
                  <th>descripci&oacute;n</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td></td>
                  <td class="text-capitalize"></td>
                  <td class="text-capitalize"></td>
                  <td class="text-capitalize"></td>
                </tr>
                <p class="text-center text-uppercase text-muted m-5 fl">no hay registros</p>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('javascript'); ?>
  <script src="<?php echo e(asset('assets/js/jquery-datatable.js')); ?>"></script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /srv/http/public_html/hackaton/CertiMax/certimax-laravel/resources/views/home.blade.php ENDPATH**/ ?>