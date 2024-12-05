<?= $header; ?>
<?= $sidebar; ?>
<?= $navbar; ?>

<link href="<?= $template_assets; ?>vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800 mb-3">Tujuan Transfer</h1>
    <form action="<?= $action; ?>" method="post" enctype="multipart/form-data" >
        <input type="hidden" name="id_affiliate_pengeluaran" value="<?= $data_pengeluaran['id_affiliate_pengeluaran']; ?>">
        <div class="form-group row">
            <label for="bank" class="col-sm-2 col-form-label">Nama Bank</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="bank" value="<?= $afiliator['bank_name']; ?>">
            </div>
        </div>
        <div class="form-group row">
            <label for="namarekening" class="col-sm-2 col-form-label">Nama Rekening</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="namarekening" value="<?= $afiliator['bank_account_name']; ?>">
            </div>
        </div>
        <div class="form-group row">
            <label for="nomorrekening" class="col-sm-2 col-form-label">Nomor Rekening</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="nomorrekening" value="<?= $afiliator['bank_account_number']; ?>">
            </div>
        </div>
        <div class="form-group row">
            <label for="jumlah" class="col-sm-2 col-form-label">Jumlah Penarikan</label>
            <div class="col-sm-10">
                <input type="text" readonly class="form-control-plaintext" id="jumlah" value="<?= number_format($data_pengeluaran['jumlah'], 0,'.','.'); ?>">
            </div>
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroupFileAddon01">Bukti Transfer</span>
            </div>
            <div class="custom-file">
                <input type="file" class="custom-file-input" id="inputGroupFile01" name="transfer_image" aria-describedby="inputGroupFileAddon01" accept="image/*">
                <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
            </div>
        </div>
        <!-- Preview Image -->
        <div class="form-group">
            <label for="preview">Preview Bukti Transfer:</label>
            <img id="preview" src="" alt="Preview Bukti Transfer" class="img-fluid mt-3" style="max-width: 100%; display: none;">
        </div>
        
        <button type="submit" class="btn btn-primary">
            Kirim Bukti Transfer
        </button>
    </form>
</div>

<?= $footer; ?>

<script src="<?= $template_assets; ?>vendor/datatables/jquery.dataTables.min.js"></script>
<script src="<?= $template_assets; ?>vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script src="<?= $template_assets; ?>js/demo/datatables-demo.js"></script>

<script>
    document.getElementById('inputGroupFile01').addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const preview = document.getElementById('preview');
                preview.src = e.target.result;
                preview.style.display = 'block';
            };
            reader.readAsDataURL(file);
        }
    });
</script>
