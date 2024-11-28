<?= $header; ?>

<div class="container-fluid">

              <?php if ($success) { ?>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                <?php echo $success; ?>
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
              <?php } ?>

            <!-- Page Heading -->
            <div
              class="d-sm-flex align-items-center justify-content-between mb-4"
            >
              <h1 class="h3 mb-0 text-gray-800">Profile</h1>
            </div>

            <!-- Menu Settings -->
            <div class="row">
              <!-- Informasi Akun -->
              <div class="col-lg-4 mb-4">
                <div class="card shadow h-100 py-2">
                  <div class="card-body">
                    <div class="row no-gutters align-items-center">
                      <div class="col mr-2">
                        <div
                          class="text-xs font-weight-bold color-custom text-uppercase mb-1"
                        >
                          Informasi Akun
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                          Update informasi pribadi
                        </div>
                      </div>
                      <div class="col-auto">
                        <i class="fas fa-user fa-2x text-gray-300"></i>
                      </div>
                    </div>
                    <a href="<?= $link_infopribadi; ?>" class="btn button-custom btn-sm btn-block mt-3"
                      >Lihat Detail</a
                    >
                  </div>
                </div>
              </div>

              <!-- Metode Pembayaran -->
              <div class="col-lg-4 mb-4">
                <div class="card shadow h-100 py-2">
                  <div class="card-body">
                    <div class="row no-gutters align-items-center">
                      <div class="col mr-2">
                        <div
                          class="text-xs font-weight-bold color-custom text-uppercase mb-1"
                        >
                          Metode Pembayaran
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                          Lihat Metode Pembayaran
                        </div>
                      </div>
                      <div class="col-auto">
                        <i class="fas fa-credit-card fa-2x text-gray-300"></i>
                      </div>
                    </div>
                    <a href="<?= $link_pembayaran; ?>" class="btn button-custom btn-sm btn-block mt-3"
                      >Lihat Detail</a
                    >
                  </div>
                </div>
              </div>

              <!-- Ubah Password -->
              <div class="col-lg-4 mb-4">
                <div class="card shadow h-100 py-2">
                  <div class="card-body">
                    <div class="row no-gutters align-items-center">
                      <div class="col mr-2">
                        <div
                          class="text-xs font-weight-bold color-custom text-uppercase mb-1"
                        >
                          Ubah Password
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                          Amankan akun Anda
                        </div>
                      </div>
                      <div class="col-auto">
                        <i class="fas fa-lock fa-2x text-gray-300"></i>
                      </div>
                    </div>
                    <a href="<?= $link_password; ?>" class="btn button-custom btn-sm btn-block mt-3"
                      >Lihat Detail</a
                    >
                  </div>
                </div>
              </div>
            </div>
          </div>

<?= $footer; ?>