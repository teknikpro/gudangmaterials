<?= $header; ?>

          <!-- Begin Page Content -->
          <div class="container-fluid">
            <!-- Page Heading -->
            <div
              class="d-sm-flex align-items-center justify-content-between mb-4"
            >
              <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            </div>

            <!-- Content Row -->
            <span>Data Bulan Ini</span>
            <div class="row">
              <!-- Earnings (Monthly) Card Example -->
              <div class="col-xl-3 col-md-6 mb-4">
                <div class="card color-custom shadow h-100 py-2">
                  <div class="card-body">
                    <div class="row no-gutters align-items-center">
                      <div class="col mr-2">
                        <div
                          class="text-xs font-weight-bold text-danger text-uppercase mb-1"
                        >
                          Jumlah Transaksi
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                        <?= number_format($jumlah_transaksi, 0,'.','.') ?>
                        </div>
                      </div>
                      <div class="col-auto">
                        <i class="fas fa-exchange-alt fa-2x text-gray-300"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Earnings (Monthly) Card Example -->
              <div class="col-xl-3 col-md-6 mb-4">
                <div class="card color-custom shadow h-100 py-2">
                  <div class="card-body">
                    <div class="row no-gutters align-items-center">
                      <div class="col mr-2">
                        <div
                          class="text-xs font-weight-bold text-danger text-uppercase mb-1"
                        >
                          Perkiraan Komisi
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                          <?= number_format($jumlah_komisi, 0,'.','.') ?>
                        </div>
                      </div>
                      <div class="col-auto">
                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Earnings (Monthly) Card Example -->
              <div class="col-xl-3 col-md-6 mb-4">
                <div class="card color-custom shadow h-100 py-2">
                  <div class="card-body">
                    <div class="row no-gutters align-items-center">
                      <div class="col mr-2">
                        <div
                          class="text-xs font-weight-bold text-danger text-uppercase mb-1"
                        >
                          Produk Dilihat
                        </div>
                        <div class="row no-gutters align-items-center">
                          <div class="col-auto">
                            <div
                              class="h5 mb-0 mr-3 font-weight-bold text-gray-800"
                            >
                              <?= $total_klik; ?>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-auto">
                        <i class="fas fa-eye fa-2x text-gray-300"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Pending Requests Card Example -->
              <div class="col-xl-3 col-md-6 mb-4">
                <div class="card color-custom shadow h-100 py-2">
                  <div class="card-body">
                    <div class="row no-gutters align-items-center">
                      <div class="col mr-2">
                        <div
                          class="text-xs font-weight-bold text-danger text-uppercase mb-1"
                        >
                          Jumlah Transaksi
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                          <?= $total_transaksi; ?>
                        </div>
                      </div>
                      <div class="col-auto">
                        <i class="fas fa-tag fa-2x text-gray-300"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Content Row -->

            <div class="row">
              <!-- Area Chart -->
              <div class="col-xl-8 col-lg-8">
                <div class="card shadow mb-4">
                  <!-- Card Header - Dropdown -->
                  <div
                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                  >
                    <h6 class="m-0 font-weight-bold color-custom">
                      Pendapatan 12 bulan terakhir
                    </h6>
                  </div>
                  <!-- Card Body -->
                  <div class="card-body">
                    <div class="chart-area">
                      <canvas id="myAreaChart" data-chart='<?= $chart_data; ?>'></canvas>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xl-4 col-lg-4">
                <!-- Produk paling Laris -->
                <div class="card shadow mb-4">
                  <!-- Card Header - Dropdown -->
                  <div
                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between"
                  >
                    <h6 class="m-0 font-weight-bold color-custom">
                      Produk Paling Laris
                    </h6>
                  </div>
                  <!-- Card Body -->
                  <div class="card-body">
                    <!-- Daftar Produk Paling Laris -->
                    <ul class="list-group">
                      <!-- Produk 1 -->
                    <?php foreach($productsales as $item) : ?>
                        <li class="list-group-item d-flex align-items-center">
                            <img
                            src="<?= $item['image_url']; ?>"
                            alt="Produk 1"
                            class="img-thumbnail"
                            style="width: 60px; height: 60px; margin-right: 10px"
                            />
                            <div>
                            <p class="mb-0 font-weight-bold"><?= $item['name']; ?></p>
                            <small>Jumlah Terjual: <?= $item['quantity']; ?></small>
                            </div>
                        </li>
                    <?php endforeach; ?>
                      
                      
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- /.container-fluid -->

<?= $footer; ?>