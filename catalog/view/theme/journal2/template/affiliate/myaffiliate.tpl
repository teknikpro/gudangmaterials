<?= $header; ?>

<div class="container my-5">
            <!-- Heading -->
            <div class="text-center mb-5">
              <h1 class="h3">Daftar Produk Afiliasi</h1>
              <p class="text-muted">
                Temukan produk afiliasi Anda dan salin link untuk membagikannya.
              </p>
            </div>

            <!-- Daftar Produk -->
            <div class="pesanan-list">
              <!-- Kartu Pesanan -->
              <div class="pesanan-item">
                <div class="pesanan-body">
                  <img
                    src="https://gudangmaterials.id/image/cache/IDB/Kalsi%20Floor%2020-500x500.png"
                    alt="<?= $product_kalsifloor['name']; ?>"
                    class="produk-img"
                  />
                  <div class="produk-info">
                    <h5 class="nama-produk"><?= $product_kalsifloor['name']; ?></h5>
                    <p class="harga-produk">Rp <?= number_format($product_kalsifloor['price']); ?></p>
                    <p class="tarif-komisi">Tarif Komisi: <?= $tarif_komisi['tarif_komisi']; ?>%</p>
                    <p class="estimasi-komisi">Dapatkan Rp <?= number_format($komisi['kalsifloor']); ?></p>
                  </div>
                </div>
                <div class="pesanan-header mt-3">
                  <span class="tanggal">Ada <?= $total_klik["kalsifloor"]["COUNT(*)"]; ?> Orang Melihat</span>
                  <span class="tanggal"><?= $total_transaksi["kalsifloor"]; ?> Jumlah Transaksi</span>
                  <input type="hidden" id="link-614" value="<?= $link_affiliate['kalsifloor']; ?>">
                  <button class="btn btn-sm button-custom">Salin Link</button>
                </div>
              </div>
              <div class="pesanan-item">
                <div class="pesanan-body">
                  <img
                    src="https://gudangmaterials.id/image/cache/IDB/Kalsi%20Deck-500x500.png"
                    alt="<?= $product_kalsideck['name'] ?>"
                    class="produk-img"
                  />
                  <div class="produk-info">
                    <h5 class="nama-produk"><?= $product_kalsideck['name'] ?></h5>
                    <p class="harga-produk">Rp <?= number_format($product_kalsideck['price']); ?></p>
                    <p class="tarif-komisi">Tarif Komisi: <?= $tarif_komisi['tarif_komisi']; ?>%</p>
                    <p class="estimasi-komisi">Dapatkan Rp <?= number_format($komisi['kalsideck']); ?></p>
                  </div>
                </div>
                <div class="pesanan-header mt-3">
                  <span class="tanggal">Ada <?= $total_klik["kalsideck"]["COUNT(*)"]; ?> Orang Melihat</span>
                  <span class="tanggal"><?= $total_transaksi["kalsideck"]; ?> Jumlah Transaksi</span>
                  <input type="hidden" id="link-883" value="<?= $link_affiliate['kalsideck']; ?>">
                  <button class="btn btn-sm button-custom">Salin Link</button>
                </div>
              </div>
              <div class="pesanan-item">
                <div class="pesanan-body">
                  <img
                    src="https://gudangmaterials.id/image/cache/IDB/Akaru%20tekstil%20tape-500x500.png"
                    alt="<?= $product_akaru['name']; ?>"
                    class="produk-img"
                  />
                  <div class="produk-info">
                    <h5 class="nama-produk"><?= $product_akaru['name']; ?></h5>
                    <p class="harga-produk">Rp <?= number_format($product_akaru['price']); ?></p>
                    <p class="tarif-komisi">Tarif Komisi: <?= $tarif_komisi['tarif_komisi']; ?>%</p>
                    <p class="estimasi-komisi">Dapatkan Rp <?= number_format($komisi['akaru']); ?></p>
                  </div>
                </div>
                <div class="pesanan-header mt-3">
                  <span class="tanggal">Ada <?= $total_klik["akaru"]["COUNT(*)"]; ?> Orang Melihat</span>
                  <span class="tanggal"><?= $total_transaksi["akaru"]; ?> Jumlah Transaksi</span>
                  <input type="hidden" id="link-334" value="<?= $link_affiliate['akaru']; ?>">
                  <button class="btn btn-sm button-custom">Salin Link</button>
                </div>
              </div>
            </div>
          </div>

    <script>
    document.querySelector('.pesanan-list').addEventListener('click', function (event) {
        if (event.target.classList.contains('button-custom')) {
            const parent = event.target.closest('.pesanan-header');
            const input = parent.querySelector('input[type="hidden"]');

            if (input) {
                navigator.clipboard.writeText(input.value)
                    .then(() => {
                        alert('Link berhasil disalin ');
                    })
                    .catch(err => {
                        console.error('Gagal menyalin link');
                    });
            }
        }
    });
  </script>


<?= $footer; ?>