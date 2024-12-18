<?= $header; ?>

<div class="container">

    <div class="card shadow-lg border-0">
        <div class="card-header py-3 d-flex align-items-center">
            <i class="fas fa-credit-card mr-3" style="font-size: 30px; color: #4e73df;"></i>
            <h6 class="m-0 font-weight-bold text-primary">Penarikan Komisi Rp <?= number_format($jumlah, 0, '.', '.'); ?></h6>
        </div>
        <div class="card-body">
            <div class="text-center mb-4">
                <?= $icon; ?>
            </div>
            <p class="text-center text-muted"><?= $keterangan; ?></p>

            <ul class="list-group mb-4">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <strong>Jumlah Penarikan :</strong>
                    <span class="text-primary">Rp <?= number_format($jumlah, 0, '.', '.'); ?></span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <strong>Tanggal Penarikan :</strong>
                    <span class="text-primary"><?= $tanggal ?></span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <strong>Status Saat Ini :</strong>
                    <span class="badge <?= $badge; ?>"><?= $status; ?></span>
                </li>
                <?php if($bukti_transfer) : ?>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                    <strong>Ditransfer Pada :</strong>
                    <span class="text-primary"><?= $tanggal ?></span>
                </li>
                <?php endif; ?>
                
            </ul>

            <?php if($bukti_transfer) : ?>
                <div class="text-center">
                    <h5 class="text-primary mb-3">Bukti Transfer</h5>
                    <img src="<?= $bukti_transfer; ?>" alt="Bukti Transfer" class="img-fluid rounded shadow-sm" style="max-width: 100%; height: auto;">
                </div>
            <?php endif; ?>

        </div>
    </div>
</div>



<?= $footer; ?>