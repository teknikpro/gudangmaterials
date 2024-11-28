</div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white ">
          <div class="container my-auto">
            <div class="copyright text-center my-auto">
              <span>Copyright &copy; Gudang Material Affiliate</span>
            </div>
          </div>
        </footer>
        <!-- End of Footer -->
      </div>
      <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div
      class="modal fade"
      id="logoutModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">
              Anda yakin mau keluar?
            </h5>
            <button
              class="close"
              type="button"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
            Silahkan klik tombol logout, untuk keluar.
          </div>
          <div class="modal-footer">
            <button
              class="btn btn-secondary"
              type="button"
              data-dismiss="modal"
            >
              Batal
            </button>
            <a
              class="btn btn-danger"
              href="https://gudangmaterials.id/index.php?route=affiliate/logout"
              >Logout</a
            >
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="<?= $template_assets ?>vendor/jquery/jquery.min.js"></script>
    <script src="<?= $template_assets ?>vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<?= $template_assets ?>vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<?= $template_assets ?>js/sb-admin-2.min.js"></script>
    <?php if (!empty($is_tarik_komisi)) : ?>
    <script src="<?= $template_assets ?>js/tarik-komisi.js"></script>
    <?php endif; ?>

    <?php if (!empty($is_dashboard)) : ?>
    <!-- Page level plugins -->
    <script src="<?= $template_assets ?>vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="<?= $template_assets ?>js/demo/chart-area-demo.js"></script>
    <?php endif; ?>
    
  </body>
</html>
