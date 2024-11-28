<?= $header; ?>

<div class="container-fluid">
            <!-- Heading -->
            <div
              class="d-sm-flex align-items-center justify-content-between mb-4"
            >
              <h1 class="h3 mb-0 text-gray-800">Informasi Pembayaran</h1>
            </div>

            <!-- Card Informasi Pembayaran -->
            <div class="row justify-content-center">
              <div class="col-lg-8">
              <?php if ($success) { ?>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                <?php echo $success; ?>
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <?php } ?>
                <div class="card shadow mb-4">
                  <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold color-custom">
                      Data Pembayaran
                    </h6>
                  </div>
                  <div class="card-body">
                    <ul class="list-group list-group-flush">
                      <!-- Nama Bank -->
                      <li class="list-group-item">
                        <strong>Nama Bank:</strong>
                        <span class="float-right"><?= $affiliate_info['bank_name'] ?></span>
                      </li>

                      <!-- Kantor Cabang -->
                      <li class="list-group-item">
                        <strong>Kantor Cabang:</strong>
                        <span class="float-right"><?= $affiliate_info['bank_branch_number'] ?></span>
                      </li>

                      <!-- Nama Rekening -->
                      <li class="list-group-item">
                        <strong>Nama Rekening:</strong>
                        <span class="float-right"><?= $affiliate_info['bank_account_name'] ?></span>
                      </li>

                      <!-- Nomor Rekening -->
                      <li class="list-group-item">
                        <strong>Nomor Rekening:</strong>
                        <span class="float-right"><?= $affiliate_info['bank_account_number'] ?></span>
                      </li>
                    </ul>

                    <!-- Tombol Edit Informasi Pembayaran -->
                    <div class="text-center mt-4">
                      <a href="<?= $link_edit_payment; ?>" class="btn button-custom">
                        Edit Informasi Pembayaran
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

<?= $footer; ?>