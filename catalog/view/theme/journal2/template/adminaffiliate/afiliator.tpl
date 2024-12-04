<?= $header; ?>
<?= $sidebar; ?>
<?= $navbar; ?>

<link href="<?= $template_assets; ?>vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<div class="container-fluid">

    <?php if($success) : ?>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
        <?= $success; ?>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        </div>
    <?php endif; ?>

    <h1 class="h3 mb-2 text-gray-800">Daftar Affiliator</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Daftar Affiliator</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Nama</th>
                            <th>Email</th>
                            <th>Telepon</th>
                            <th>Asal Kota</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($affiliators as $item) : ?>
                            <tr>
                            <td><?= $item['firstname']; ?> <?= $item['lastname']; ?></td>
                            <td><?= $item['email']; ?></td>
                            <td><?= $item['telephone']; ?></td>
                            <td><?= $item['city']; ?></td>
                            <td><span class="badge <?= $item['status']; ?>"><?= $item['approved']; ?></span></td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
                                        Action
                                    </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="<?= $action; ?>&affiliate_id=<?= $item['affiliate_id']; ?>">Verifikasi</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>

<?= $footer; ?>

<script src="<?= $template_assets; ?>vendor/datatables/jquery.dataTables.min.js"></script>
<script src="<?= $template_assets; ?>vendor/datatables/dataTables.bootstrap4.min.js"></script>

<script src="<?= $template_assets; ?>js/demo/datatables-demo.js"></script>

            