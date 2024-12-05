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

    <h1 class="h3 mb-2 text-gray-800">Daftar Transaksi Affiliate</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Transaksi</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Order Id</th>
                            <th>Seller</th>
                            <th>Total</th>
                            <th>Tanggal</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($transaksi as $item) : ?>
                            <tr>
                            <td><?= $item['order_id']; ?></td>
                            <td><?= $item['seller_name']; ?></td>
                            <td><?= $item['total']; ?></td>
                            <td><?= $item['date_added']; ?></td>
                            <td><span class="badge "><?= $item['order_status']; ?></span></td>
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

            