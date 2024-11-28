<?= $header; ?>

<div class="container-fluid">
            <!-- Heading -->
            <div
              class="d-sm-flex align-items-center justify-content-between mb-4"
            >
              <h1 class="h3 mb-0 text-gray-800">Edit Informasi Pembayaran</h1>
            </div>

            <!-- Form Edit Informasi Pembayaran -->
            <div class="row justify-content-center">
              <div class="col-lg-8">
                    <?php if($warning) : ?>
                      <div class="alert alert-warning alert-dismissible fade show" role="alert">
                      <?= $warning; ?>
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <?php endif; ?>
                <div class="card shadow mb-4">
                  <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold color-custom">
                      Form Edit Informasi Pembayaran
                    </h6>
                  </div>
                  <div class="card-body">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="tax" value="<?php echo $tax; ?>"/>
                    <input type="hidden" name="payment" value="bank" />
                      <!-- Nama Bank -->
                      <div class="form-group">
                        <label for="bankName">Nama Bank</label>
                        <input
                          type="text"
                          name="bank_name"
                          value="<?php echo $bank_name; ?>"
                          class="form-control"
                          id="bankName"
                          placeholder="Masukkan Nama Bank"
                          required
                        />
                      </div>

                      <!-- Kantor Cabang -->
                      <div class="form-group">
                        <label for="branchOffice">Kantor Cabang</label>
                        <input
                          type="text"
                          class="form-control"
                          id="branchOffice"
                          name="bank_branch_number"
                          value="<?php echo $bank_branch_number; ?>"
                          placeholder="Masukkan Kantor Cabang"
                          required
                        />
                      </div>

                      <input type="hidden" name="bank_swift_code" value="<?php echo $bank_swift_code; ?>"/>

                      <!-- Nama Rekening -->
                      <div class="form-group">
                        <label for="accountName">Nama Rekening</label>
                        <input
                          type="text"
                          class="form-control"
                          id="accountName"
                          name="bank_account_name"
                          value="<?php echo $bank_account_name; ?>"
                          placeholder="Masukkan Nama Rekening"
                          required
                        />
                      </div>

                      <!-- Nomor Rekening -->
                      <div class="form-group">
                        <label for="accountNumber">Nomor Rekening</label>
                        <input
                          type="text"
                          class="form-control"
                          id="accountNumber"
                          name="bank_account_number"
                          value="<?php echo $bank_account_number; ?>"
                          placeholder="Masukkan Nomor Rekening"
                          required
                        />
                      </div>

                      <!-- Tombol Simpan dan Batal -->
                      <div class="text-center mt-4">
                        <button type="submit" class="btn button-custom">
                          Simpan Perubahan
                        </button>
                        <a
                          href="<?= $back; ?>"
                          class="btn btn-secondary ml-2"
                        >
                          Batal
                        </a>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>

<?= $footer; ?>