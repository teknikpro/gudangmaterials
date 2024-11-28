<?= $header; ?>

<div class="container my-5">
            <!-- Heading -->
            <div class="text-center mb-5">
              <h1 class="h3">Status Member</h1>
              <p class="text-muted">
                Saat ini anda adalah member
                <span class="font-weight-bold" ><?= $status_member; ?></span>
                Lihat keuntungan dari setiap status keanggotaan kami, dan lihat cara <a href="<?= $link_tingkatmember; ?>" class="text-decoration-none">Meningkatkan Status Member</a>
              </p>
            </div>

            <!-- Member Cards -->
            <div class="row justify-content-center">
              <!-- Silver Member -->
              <div class="col-md-4 mb-4">
                <div class="card border-secondary shadow-sm">
                  <div class="card-header bg-secondary text-white text-center">
                    <h3>Silver</h3>
                  </div>
                  <div class="card-body">
                    <h5 class="card-title text-center">
                      Keuntungan Silver Member
                    </h5>
                    <ul class="list-unstyled">
                      <li>✅ Komisi sebesar 2%</li>
                      <li>✅ Keuntungan Lain</li>
                      <li>✅ Keuntungan Lain</li>
                    </ul>
                  </div>
                </div>
              </div>

              <!-- Gold Member -->
              <div class="col-md-4 mb-4">
                <div class="card border-warning shadow-sm">
                  <div class="card-header bg-warning text-white text-center">
                    <h3>Gold</h3>
                  </div>
                  <div class="card-body">
                    <h5 class="card-title text-center">
                      Keuntungan Gold Member
                    </h5>
                    <ul class="list-unstyled">
                      <li>✅ Komisi sebesar 4%</li>
                      <li>✅ Keuntungan Lain</li>
                      <li>✅ Keuntungan lain</li>
                    </ul>
                  </div>
                </div>
              </div>

              <!-- Platinum Member -->
              <div class="col-md-4 mb-4">
                <div class="card border-primary shadow-sm">
                  <div class="card-header bg-primary text-white text-center">
                    <h3>Platinum</h3>
                  </div>
                  <div class="card-body">
                    <h5 class="card-title text-center">
                      Keuntungan Platinum Member
                    </h5>
                    <ul class="list-unstyled">
                      <li>✅ Komisi sebesar 6%</li>
                      <li>✅ Keuntungan Lain</li>
                      <li>✅ Keuntungan Lain</li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>

<?= $footer; ?>