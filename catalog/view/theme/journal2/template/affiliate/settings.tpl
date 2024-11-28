<?= $header; ?>

<div class="container-fluid">
            <!-- Page Heading -->
            <div
              class="d-sm-flex align-items-center justify-content-between mb-4"
            >
              <h1 class="h3 mb-0 text-gray-800">Settings</h1>
            </div>

            <!-- Menu Settings -->
            <div class="row">
              <div class="col-lg-4 mb-4">
                <div class="card shadow h-100 py-2">
                  <div class="card-body">
                    <div class="row no-gutters align-items-center">
                      <div class="col mr-2">
                        <div
                          class="text-xs font-weight-bold color-custom text-uppercase mb-1"
                        >
                          Tarik Komisi
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                          Cairkan Komisi
                        </div>
                      </div>
                      <div class="col-auto">
                        <i class="fas fa-wallet fa-2x text-gray-300"></i>
                      </div>
                    </div>
                    <a href="<?= $link_wallet; ?>" class="btn button-custom btn-sm btn-block mt-3"
                      >Lihat Detail</a
                    >
                  </div>
                </div>
              </div>

              <div class="col-lg-4 mb-4">
                <div class="card shadow h-100 py-2">
                  <div class="card-body">
                    <div class="row no-gutters align-items-center">
                      <div class="col mr-2">
                        <div
                          class="text-xs font-weight-bold color-custom text-uppercase mb-1"
                        >
                          Daftar Transaksi
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                          Transaksi Anda
                        </div>
                      </div>
                      <div class="col-auto">
                        <i class="fas fa-shopping-cart fa-2x text-gray-300"></i>
                      </div>
                    </div>
                    <a href="<?= $link_transaksi; ?>" class="btn button-custom btn-sm btn-block mt-3"
                      >Lihat Detail</a
                    >
                  </div>
                </div>
              </div>

              <div class="col-lg-4 mb-4">
                <div class="card shadow h-100 py-2">
                  <div class="card-body">
                    <div class="row no-gutters align-items-center">
                      <div class="col mr-2">
                        <div
                          class="text-xs font-weight-bold color-custom text-uppercase mb-1"
                        >
                          Produk Anda
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                          Affiliate Anda
                        </div>
                      </div>
                      <div class="col-auto">
                        <i class="fas fa-box fa-2x text-gray-300"></i>
                      </div>
                    </div>
                    <a href="<?= $link_myaffiliate; ?>" class="btn button-custom btn-sm btn-block mt-3"
                      >Lihat Detail</a
                    >
                  </div>
                </div>
              </div>
            </div>
          </div>

<?= $footer; ?>