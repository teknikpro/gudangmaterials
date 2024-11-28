<?= $header; ?>

<div class="container">

    <div class="card shadow-lg border-0">
        <div class="card-header py-3 d-flex align-items-center">
            <i class="fas fa-credit-card mr-3" style="font-size: 30px; color: #4e73df;"></i>
            <h6 class="m-0 font-weight-bold text-primary">Saldo Masuk</h6>
        </div>
        <div class="card-body">
            <div class="text-center mb-4">
              <i class="fas fa-check-circle" style="font-size: 50px; color: green;"></i>
            </div>
            <p class="text-center text-muted">Pemasukan dari komisi</p>

            <ul class="list-group mb-4">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <strong>Jumlah Pemasukan:</strong>
                    <span class="text-primary">Rp <?= number_format($datadetail['jumlah'], 0,'.','.'); ?></span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <strong>Tanggal Pemasukan:</strong>
                    <span class="text-primary"><?= date('d F Y', strtotime($datadetail['tanggal'])) ?></span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <strong>Keterangan:</strong>
                    <span class="text-primary"><?= $datadetail['keterangan']; ?></span>
                </li>
            </ul>

        </div>
    </div>
</div>



<?= $footer; ?>