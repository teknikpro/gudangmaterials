<?= $header; ?>

<div class="container-fluid">
            <!-- Page Heading -->
            <div
              class="d-sm-flex align-items-center justify-content-between mb-4"
            >
              <h1 class="h3 mb-0 text-gray-800">Informasi Pribadi</h1>
            </div>

            <!-- Informasi Pribadi -->
            <div class="row justify-content-center">
              <div class="col-lg-8">

              <?php if ($error_warning) { ?>
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <?php echo $error_warning; ?>
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
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" >
                      <!-- Nama Lengkap -->
                      <div class="form-group">
                        <label for="firstnama">Nama Depan</label>
                        <input
                          type="text"
                          name="firstname"
                          value="<?php echo $firstname; ?>"
                          class="form-control"
                          id="firstnama"
                          placeholder="<?php echo $entry_firstname; ?>"
                        />
                        <?php if ($error_firstname) { ?>
                          <div class="text-danger"><?php echo $error_firstname; ?></div>
                        <?php } ?>
                      </div>

                      <div class="form-group">
                        <label for="fullName">Nama Belakang</label>
                        <input
                          type="text"
                          name="lastname"
                          class="form-control"
                          id="fullName"
                          placeholder="<?php echo $entry_lastname; ?>"
                          value="<?php echo $lastname; ?>"
                        />
                        <?php if ($error_lastname) { ?>
                        <div class="text-danger"><?php echo $error_lastname; ?></div>
                        <?php } ?>
                      </div>

                      <!-- Email -->
                      <div class="form-group">
                        <label for="email">Email</label>
                        <input
                          type="email"
                          name="email" 
                          class="form-control"
                          id="email"
                          placeholder="<?php echo $entry_email; ?>"
                          name="email" value="<?php echo $email; ?>"
                        />
                        <?php if ($error_email) { ?>
                          <div class="text-danger"><?php echo $error_email; ?></div>
                        <?php } ?>
                      </div>

                      <!-- Telepon -->
                      <div class="form-group">
                        <label for="phone">Telepon</label>
                        <input
                          type="tel"
                          name="telephone"
                          class="form-control"
                          id="phone"
                          placeholder="<?php echo $entry_telephone; ?>"
                          value="<?php echo $telephone; ?>"
                        />
                        <?php if ($error_telephone) { ?>
                          <div class="text-danger"><?php echo $error_telephone; ?></div>
                        <?php } ?>
                      </div>

                      <input type="hidden" name="fax" value="<?php echo $fax; ?>" >
                      <input type="hidden" name="company" value="<?php echo $company; ?>" >
                      <input type="hidden" name="website" value="<?php echo $website; ?>" >

                      <!-- Alamat -->
                      <div class="form-group">
                        <label for="address">Alamat</label>
                        <textarea
                          class="form-control"
                          name="address_1"
                          id="address"
                          rows="2"
                          placeholder="<?php echo $entry_address_1; ?>"
                        ><?php echo $address_1; ?></textarea
                        >
                        <?php if ($error_address_1) { ?>
                          <div class="text-danger"><?php echo $error_address_1; ?></div>
                        <?php } ?>
                      </div>

                      <input type="hidden" name="address_2" value="<?php echo $address_2; ?>" >


                      <!-- Kabupaten/Kota -->
                      <div class="form-group">
                        <label for="city">Kabupaten/Kota</label>
                        <input
                          type="text"
                          name="city"
                          value="<?php echo $city; ?>"
                          class="form-control"
                          id="city"
                          placeholder="Kabupaten/Kota"
                          value="Jakarta Selatan"
                        />
                        <?php if ($error_city) { ?>
                          <div class="text-danger"><?php echo $error_city; ?></div>
                        <?php } ?>
                      </div>

                      <!-- Provinsi -->
                      <div class="form-group">
                        <label for="province">Provinsi</label>
                        <input
                          type="text"
                          name="provinsi"
                          class="form-control"
                          id="province"
                          placeholder="Provinsi"
                          value="<?php echo $provinsi; ?>"
                        />
                        <?php if ($error_provinsi) { ?>
                          <div class="text-danger"><?php echo $error_provinsi; ?></div>
                        <?php } ?>
                      </div>

                      <input type="hidden" name="postcode" value="40383">
                      <input type="hidden" name="country_id" value="100">
                      <input type="hidden" name="zone_id" value="115">

                      <!-- Tombol Edit Profile -->
                      <div class="text-center">
                        <button
                          type="submit"
                          class="btn button-custom mt-3"
                          id="editProfileBtn"
                        >
                          Edit Profile
                        </button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>

<?= $footer; ?>