<?= $header; ?>

<div class="container-fluid">
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Notifikasi</h1>
  </div>

    <?php foreach($notifikasi as $notif) : ?>
      <a class="dropdown-item d-flex align-items-center <?= $notif['status_baca'] == 1 ? 'bg-white' : '' ?> " href="<?= $notif['link']; ?>">
        <div class="mr-3">
            <div class="icon-circle bg-success">
              <i class="fas fa-donate text-white"></i>
            </div>
        </div>
        <div>
            <div class="small text-gray-500"><?= date('d F Y', strtotime($notif['tanggal'])); ?></div>
            <span class="font-weight-bold"><?= $notif['keterangan']; ?></span>
        </div>
    </a>
    <hr class="sidebar-divider my-0 mb-3">
    <?php endforeach; ?>

</div>

<?= $footer; ?>