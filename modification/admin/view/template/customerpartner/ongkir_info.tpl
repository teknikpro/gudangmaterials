<?php echo $header; ?>
<style type="text/css">
  .order-info-buttons{
    background-color: #1E91CF;
    padding: 10px;
  }
</style>
<?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
     
      <h1>Detail Konfirmasi Ongkir</h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> Detail Konfirmasi Ongkir</h3>
      </div>
      <div class="panel-body">
        
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-left">Alamat Penerima</td>
              <td class="text-left">Alamat Pengirim</td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="left">
              <?= $customer_firstname ?> <?= $customer_lastname ?>
              <br>
              <?= $customer_telephone ?>
              <br>
              <?= $customer_address ?>
              <br>
              <?= $customer_city ?> <?= $customer_prov ?>
              <br>
              <?= $customer_postcode ?>
              </td>
              <td class="text-left">
              <?= $seller_firstname ?> <?= $seller_lastname ?>
              <br>
              <?= $seller_telephone ?>
              <br>
              <?=$seller_address ?>
              <br>
              <?= $customer_city ?> <?= $customer_prov ?>
              <br>
              <?= $customer_postcode ?>
              </td>
            </tr>
          </tbody>
        </table>
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-left">Nama Produk</td>
                <td class="text-left">Model</td>
                <td class="text-right">Quantity</td>
                <td class="text-right">Harga</td>
                <td class="text-right">Jumlah</td>
              </tr>
            </thead>
            <tbody>
                <?php foreach($daftarproducks as $product) { ?>
                  <tr>
                      <td class="text-left"><?= $product['namaproduk']; ?></td>
                      <td class="text-left"><?= $product['model']; ?></td>
                      <td class="text-left"><?= $product['quantity']; ?></td>
                      <td class="text-left"><?= $product['harga']; ?></td>
                      <td class="text-left"><?= $product['jumlah']; ?></td>
                  </tr>
                <?php } ?>
              
            </tbody>
          
          </table>
          <div class="col-xs-12">
            <?php if($optiontukang == 1 ) { ?>
              <div class="alert alert-success" role="alert">Customer ini tidak membutuhkan tukang buat loading barang</div>
            <?php }else { ?>
              <div class="alert alert-danger" role="alert">Customer ini membutuhkan tukang buat loading barang</div>
            <?php } ?>
            <h4 class=" text-bold"><strong>Masukan Ongkos Kirim</strong></h4>
            <form class="form-horizontal" action="<?= $action ?>" method="post" id="main-form"  enctype="multipart/form-data">
                <input type="hidden" name="cart_id" value="<?= $cart_id ?>">
                <input type="hidden" name="customer_id" value="<?= $customer_id ?>">
                <input type="hidden" name="seller_id" value="<?= $seller_id ?>">
                <input type="text" class="form-control " name="ekspedisi" id="ekspedisi" placeholder="Masukan Ekspedisi" value="<?= $customer_kurir ?>" required>
                <br>
                <input type="text" class="form-control" id="harga" name="harga" placeholder="Masukan Ongkos Kirim" value="<?= $customer_ongkir ?>" required>
                <br>
                <?php if($optiontukang == 2){ ?>
                <input type="number" class="form-control" name="hargatukang" placeholder="Masukan Ongkos Bongkar Muat" value="<?= $customer_tukang ?>" required >
                <?php } ?>
                <br>
                <button type='submit' class="btn btn-primary">Kirim</button>
              
            </form>
          </div>

      </div>
    </div>
  </div>
</div>

<?php echo $footer; ?>
