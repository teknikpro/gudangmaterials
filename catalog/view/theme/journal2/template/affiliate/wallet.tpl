<?= $header; ?>

<div class="container my-5">
            <!-- Heading -->
            <div class="text-center mb-5">
              <h1 class="h3">Tarik Komisi</h1>
              <p class="text-muted">
                Silakan masukkan jumlah komisi yang mau ditarik.
              </p>
            </div>

            <!-- Tarik Komisi Form -->
            <div class="row justify-content-center">
            
              <div class="col-md-6">
                <div class="card shadow-sm">
                  <div class="card-header text-center">
                    <h4>Jumlah Saldo: <a href="<?= $link_riwayat; ?>" id="saldo"> <?= $saldo; ?> ></a></h4>
                  </div>

                  <div class="card-body">
                    <form action="<?= $action; ?>" method="post"  id="tarikKomisiForm">
                      <?php if (isset($this->session->data['errors'])): ?>
                        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                          <?php foreach ($this->session->data['errors'] as $key => $error): ?>
                            <?php echo $error; ?>
                          <?php endforeach; ?>
                          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <?php unset($this->session->data['errors']); ?>
                      <?php endif; ?>
                        
                      <!-- Jumlah Penarikan -->
                      <div class="mb-3">
                        <label for="jumlah" class="form-label"
                          >Jumlah Penarikan (Rp)</label
                        >
                        <input
                          type="number"
                          name="jumlah"
                          class="form-control"
                          id="jumlah"
                          required
                          min="1"
                        />
                        <small id="warningText" class="text-danger"></small>
                      </div>

                      <!-- Button Tarik Komisi -->
                      <div class="d-grid gap-2">
                        <button
                          type="submit"
                          class="btn button-custom"
                          id="tarikKomisiBtn"
                          disabled
                        >
                          Tarik Komisi
                        </button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>

<?= $footer; ?>