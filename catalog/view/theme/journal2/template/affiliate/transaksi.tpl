<?= $header; ?>

<div class="container my-5">
            <!-- Heading -->
            <div class="text-center mb-5">
              <h1 class="h3">Daftar Pesanan Afiliasi</h1>
              <p class="text-muted">
                Lihat semua pesanan afiliasi Anda dan estimasi komisi yang akan
                diterima.
              </p>
            </div>

            <!-- Daftar Pesanan -->
            <div class="pesanan-list">

            <?php if (!empty($transactions)) : ?>
              <?php foreach ($transactions as $transaction): ?>
                <div class="pesanan-item">
                <div class="pesanan-header">
                  <span>ID Pesanan: #<?php echo $transaction['transaksi']['order_id']; ?></span>
                  <span class="tanggal"><?php echo $transaction['transaksi']['date_added']; ?></span>
                </div>
                <?php if( $transaction['transaksi']['status_transaksi'] == "Gagal" ) : ?>
                  <?php foreach ($transaction['products'] as $product): ?>
                    <div class="pesanan-body mt-3">
                      <img
                          src="<?php echo $product['image']; ?>"
                          alt="<?php echo $product['name']; ?>"
                          class="produk-img"
                      />
                      <div class="produk-info">
                        <h5 class="nama-produk"><?php echo $product['name']; ?></h5>
                        <p class="harga-produk">Rp <?php echo number_format($product['price'], 0, ',', '.'); ?></p>
                        <p class="tarif-komisi">Jumlah: <?php echo $product['quantity']; ?></p>
                        <p class="tarif-komisi">Tarif Komisi: <?php echo $product['tarif_komisi']; ?>%</p>
                        <p class="estimasi-komisi">Estimasi Komisi: Rp 0</p>
                      </div>
                    </div>
                  <?php endforeach; ?>
                <?php else : ?>
                  <?php foreach ($transaction['products'] as $product): ?>
                    <div class="pesanan-body mt-3">
                      <img
                          src="<?php echo $product['image']; ?>"
                          alt="<?php echo $product['name']; ?>"
                          class="produk-img"
                      />
                      <div class="produk-info">
                        <h5 class="nama-produk"><?php echo $product['name']; ?></h5>
                        <p class="harga-produk">Rp <?php echo number_format($product['price'], 0, ',', '.'); ?></p>
                        <p class="tarif-komisi">Jumlah: <?php echo $product['quantity']; ?></p>
                        <p class="tarif-komisi">Tarif Komisi: <?php echo $product['tarif_komisi']; ?>%</p>
                        <p class="estimasi-komisi">Estimasi Komisi: Rp <?= number_format((($product['tarif_komisi'] / 100) * $product['price']) * $product['quantity']); ?></p>
                      </div>
                    </div>
                  <?php endforeach; ?>
                <?php endif; ?>
                <div class="pesanan-body">
                  <span class="badge <?php echo $transaction['transaksi']['class_transaksi']; ?>"><?php echo $transaction['transaksi']['status_transaksi']; ?></span>
                </div>
              </div>
              <?php endforeach; ?>
            <?php else : ?>
              <div class="pesanan-item">
                <p class="text-center" >Belum Ada Transaksi</p>
              </div>
            <?php endif; ?>
            </div>
          </div>

<?= $footer; ?>