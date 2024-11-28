<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<link href="view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="all" />
<script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
<link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
<link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="all" />
</head>

<style>
@media print {
  /* Menghilangkan elemen-elemen yang tidak ingin dicetak */
  header, footer, .print-ignore {
    display: none !important;
  }
}
</style>

<body>
<div class="container">
  <?php foreach ($orders as $order) { ?>
  <div style="page-break-after: always;">
     <img src="https://gudangmaterials.id/image/cache/catalog/logo-320x92.png" width="320" height="92" alt="Gudang Material Marketplace Bahan Bangunan" title="Gudang Material Marketplace Bahan Bangunan" class="logo-1x">
     <span style="color:black; font-weight:bold; font-size:12px; display:block;" >This is not invoice </span>
    <table class="table table-bordered">
      <thead>
        <tr>
          <td style="text-align:center;" ><b>Order Details</b></td>
          <td style="text-align:center;" ><b>Alamat Pengirim</b></td>
          <td style="text-align:center;" ><b>Alamat Penerima</b></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td style="width: 33.3%;">
            <address>
              No. Packing : <strong><?= $order['invoice_no']; ?></strong><br />
              Supplier : <strong><?= $seller_firstname; ?> <?= $seller_lastname; ?></strong><br />
              No. Order : <strong><?= $order['order_id']; ?></strong><br />
              Tanggal Slip : <strong><?= $order['date_added']; ?></strong><br />
              Pembayaran : <strong><?= $payment_method; ?></strong><br />
              Virtual Account : <strong><?= $payment_code; ?></strong><br />
            </address>
          </td>
          <td style="width: 33.3%;"> 
            <address>
              <?= $seller_firstname ?> <?= $seller_lastname ?>
              <br>
              <?=$seller_address ?> <?= $seller_city; ?>
              <br>
              <?= $seller_prov; ?> <?= $seller_postcode; ?>
              <br>
              Telp. <?= $seller_telephone ?>
            </address>
          </td>
          <td style="width: 33.3%;" >
            <address>
              <address>
              <?= $customer_firstname ?> <?= $customer_lastname ?>
              <br>
              <?=$customer_address ?> <?= $customer_city; ?>
              <br>
              <?= $customer_prov; ?> <?= $customer_postcode; ?>
              <br>
              No. Hp <?= $customer_telephone ?>
            </address>
            </address>
          </td>
        </tr>
      </tbody>
    </table>
    <table class="table table-bordered">
      <thead>
        <tr>
          <td style="text-align:center;" ><b>Produk</b></td>
          <td style="text-align:center;" ><b>Keterangan</b></td>
          <td style="text-align:center;"><b>Jumlah</b></td>
          <td style="text-align:center;"><b>Satuan Harga</b></td>
          <td style="text-align:center;"><b>Total</b></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($order['product'] as $product) { ?>
        <tr>
          <td><?php echo $product['name']; ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
            <?php } ?></td>
          <td><?php echo $product['model']; ?></td>
          <td class="text-right"><?php echo $product['quantity']; ?></td>
          <td class="text-right"><?php echo $product['price']; ?></td>
          <td class="text-right"><?php echo $product['total']; ?></td>
        </tr>
        <?php } ?>
        <?php foreach ($order['voucher'] as $voucher) { ?>
        <tr>
          <td><?php echo $voucher['description']; ?></td>
          <td></td>
          <td class="text-right">1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
        </tr>
        <?php } ?>
        <?php foreach ($order['total'] as $total) { ?>
        <tr>
          <td class="text-right" colspan="4"><b><?php echo $total['title']; ?></b></td>
          <td class="text-right"><?php echo $total['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
    <table style="border: none;" class="table">
      <tbody>
        <tr style="border: none;">
          <td style="width: 50%; border: none;">
            <address>
              <strong><?php echo $order['store_name']; ?></strong><br />
            </address>
            
          <td style="width: 50%; border: none;">
            <b><?php echo $text_email; ?></b> <?php echo $order['store_email']; ?><br />
            <b><?php echo $text_website; ?></b> <a href="<?php echo $order['store_url']; ?>"><?php echo $order['store_url']; ?></a></td>
            </td>
        </tr>
      </tbody>
    </table>
  </div>
  <?php } ?>
</div>

<script>
window.onload = function() {
    window.print();
};
</script>

</body>
</html>