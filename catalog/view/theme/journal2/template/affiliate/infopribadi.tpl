<?= $header; ?>

<div class="container-fluid">
            <!-- Heading -->
            <div
              class="d-sm-flex align-items-center justify-content-between mb-4"
            >
              <h1 class="h3 mb-0 text-gray-800">Informasi Pribadi</h1>
            </div>

            <!-- Card Informasi Pribadi -->
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
                      Data Pribadi
                    </h6>
                  </div>
                  <div class="card-body">
                    <ul class="list-group list-group-flush">
                      <!-- Nama Lengkap -->
                      <li class="list-group-item">
                        <strong>Nama Lengkap:</strong>
                        <span class="float-right"><?= $affiliate_info['firstname'] ." ". $affiliate_info['lastname'] ?></span>
                      </li>

                      <!-- Email -->
                      <li class="list-group-item">
                        <strong>Email:</strong>
                        <span class="float-right"><?= $affiliate_info['email'] ?></span>
                      </li>

                      <!-- Telepon -->
                      <li class="list-group-item">
                        <strong>Telepon:</strong>
                        <span class="float-right"><?= $affiliate_info['telephone'] ?></span>
                      </li>

                      <!-- Alamat -->
                      <li class="list-group-item">
                        <strong>Alamat:</strong>
                        <span class="float-right"
                          ><?= $affiliate_info['address_1'] ?></span
                        >
                      </li>

                      <!-- Kabupaten/Kota -->
                      <li class="list-group-item">
                        <strong>Kabupaten/Kota:</strong>
                        <span class="float-right"><?= $affiliate_info['city'] ?></span>
                      </li>

                      <!-- Provinsi -->
                      <li class="list-group-item">
                        <strong>Provinsi:</strong>
                        <span class="float-right"><?= $affiliate_info['provinsi'] ?></span>
                      </li>
                    </ul>

                    <!-- Tombol Edit Profile -->
                    <div class="text-center mt-4">
                      <a href="<?= $edit_infopribadi; ?>" class="btn button-custom">
                        Edit Profile
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

<?= $footer; ?>