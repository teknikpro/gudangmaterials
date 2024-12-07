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

    <h1 class="h3 mb-2 text-gray-800">Atur Komisi Member</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Komisi Member</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Member</th>
                            <th>Komisi</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($members as $item) : ?>
                            <tr>
                            <td><?= $item['member']; ?></td>
                            <td><?= $item['tarif_komisi']; ?>%</td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
                                        Action
                                    </button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="<?= $action; ?>&id_affiliate_member=<?= $item['id_affiliate_member']; ?>">Edit</a>
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

<!-- Modal -->
<div class="modal fade" id="editKomisiModal" tabindex="-1" aria-labelledby="editKomisiModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editKomisiModalLabel">Edit Komisi</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="editKomisiForm" method="post" action="<?= $action; ?>">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="memberName">Member</label>
                        <input type="text" class="form-control" id="memberName" name="member" readonly>
                    </div>
                    <div class="form-group">
                        <label for="komisi">Komisi (%)</label>
                        <input type="number" class="form-control" id="komisi" name="komisi" min="0" max="100" required>
                    </div>
                    <input type="hidden" id="memberId" name="id_affiliate_member">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>

$(document).ready(function () {
    $('.dropdown-item').on('click', function (e) {
        e.preventDefault();

        const row = $(this).closest('tr');
        const memberName = row.find('td:eq(0)').text();
        const komisi = row.find('td:eq(1)').text().replace('%', '');
        const memberId = $(this).attr('href').split('=')[2];

        $('#memberName').val(memberName.trim());
        $('#komisi').val(komisi.trim());
        $('#memberId').val(memberId);

        $('#editKomisiModal').modal('show');
    });
});


</script>


<script src="<?= $template_assets; ?>vendor/datatables/jquery.dataTables.min.js"></script>
<script src="<?= $template_assets; ?>vendor/datatables/dataTables.bootstrap4.min.js"></script>

<script src="<?= $template_assets; ?>js/demo/datatables-demo.js"></script>

            