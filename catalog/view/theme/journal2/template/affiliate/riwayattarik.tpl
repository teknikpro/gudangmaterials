<?= $header; ?>

<div class="container my-5">
            <!-- Heading -->
            <div class="text-center mb-5">
              <h1 class="h3">Riwayat Saldo</h1>
              <p class="text-muted">
                Lihat riwayat saldo Anda di bawah ini.
              </p>
            </div>

            <!-- Daftar Riwayat Penarikan -->
            <div class="riwayat-list">
              <?php foreach($riwayat as $item) : ?>
                <div  onclick="window.location.href='<?= $item['link'] ?><?= $item['id']; ?>';" style="cursor:pointer;" class="riwayat-item">
                  <div class="tanggal"><?= date('d F Y', strtotime($item['tanggal'])) ?></div>
                <div class="nominal">Rp <?= number_format($item['jumlah'], 0, '.', '.') ?> <span class="<?= $item['warnastatus'] ?>"><?= $item['status'] ?></span> <span class="<?= $item['statuscss']; ?>"> - <?= $item['keterangan'] ?></span></div>
              </div>
              <?php endforeach; ?>
            </div>
          </div>

<?= $footer; ?>