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
<body>
<div class="container">
  <div style="page-break-after: always;">
    <h1><?php echo $text_invoice; ?> #<?php echo $transaction_id; ?></h1>
    <table class="table table-bordered">
      <thead>
        <tr>
          <td colspan="2"><?php echo $text_transaction_details; ?></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td style="width: 50%;"><address>
            <strong><?php echo $store_name; ?></strong><br />
            <?php echo $store_address; ?>
            </address>
            <b><?php echo $text_telephone; ?></b> <?php echo $store_telephone; ?><br />
            <?php if ($store_fax) { ?>
            <b><?php echo $text_fax; ?></b> <?php echo $store_fax; ?><br />
            <?php } ?>
            <b><?php echo $text_email; ?></b> <?php echo $store_email; ?><br />
          </td>
          <td style="width: 50%;"><b><?php echo $text_date_added; ?></b> <?php echo $transaction_date; ?><br />
            <b><?php echo $text_transaction_id; ?></b> <?php echo $transaction_id; ?><br />
            <b><?php echo $text_transaction_method; ?></b> <?php echo $transaction_method; ?><br />
            <b><?php echo $text_transaction_amount; ?></b> <?php echo $transaction_amount; ?><br />
        </tr>
      </tbody>
    </table>
      <table class="table table-bordered">
        <thead>
          <tr>
            <td class="text-right"><b><?php echo $column_order_id; ?></b></td>
            <td><b><?php echo $column_product_name; ?></b></td>
            <td class="text-right"><b><?php echo $column_quantity; ?></b></td>
            <td class="text-right"><b><?php echo $column_price; ?></b></td>
            <td class="text-right"><b><?php echo $column_admin_amount; ?></b></td>
            <td class="text-right"><b><?php echo $column_seller_amount; ?></b></td>
          </tr>
        </thead>
        <tbody>
          <?php if(isset($transaction_orders) && $transaction_orders) { ?>
            <?php foreach ($transaction_orders as $product) { ?>
            <tr>
              <td class="text-right"><?php echo $product['order_id']; ?></td>
              <td><?php echo $product['name']; ?></td>
              <td class="text-right"><?php echo $product['quantity']; ?></td>
              <td class="text-right"><?php echo $product['price']; ?></td>
              <td class="text-right"><?php echo $product['admin_amount']; ?></td>
              <td class="text-right"><?php echo $product['need_to_pay']; ?></td>
            </tr>
            <?php } ?>
          <?php } ?>
        </tbody>
      </table>
    </div>
  </div>
</div>
</body>
</html>
