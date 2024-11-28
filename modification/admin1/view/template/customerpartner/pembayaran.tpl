<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
   <div class="container-fluid">

      <div style="font-size:20px; font-weight:bold; margin-top:40px;" >Pembayaran Seller</div>
      <div class="panel panel-default" style="margin-top:5px;">
          <div class="table-responsive">
              <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <td class="text-left">Nomor</td>
                        <td class="text-left">Order Id</td>
                        <td class="text-left">Invoice</td>
                        <td class="text-left">Total</td>
                        <td class="text-left">Aksi</td>
                    </tr>
                </thead>
                <tbody>
                <?php if ($orders) { ?>
                    <?php $i = 1; ?>
                    <?php foreach ($orders as $order) { ?>
                    <tr>
                        <td class="text-left"><?= $i; ?></td>
                        <td class="text-left"><?= $order['order_id']; ?></td>
                        <td class="text-left"><?= $order['invoice_prefix']; ?></td>
                        <td class="text-left"><?= $order['subtotal']; ?></td>
                        <td class="text-left"><a href="<?= $order['linkdetail'] ?>" data-toggle="tooltip" title="Detail Pembayaran" class="text-decoration-none">Detail</a></td>
                    </tr>
                    <?php $i++; ?>
                    <?php } ?>
                <?php } else { ?>
                <tr>
                    <td class="text-center" colspan="7"><?php echo "No records founds"; ?></td>
                </tr>
                <?php } ?>
                    
                </tbody>
              </table>
          </div>
      </div>

   </div>

</div>
