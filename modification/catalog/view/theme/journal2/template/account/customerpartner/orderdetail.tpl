<?php echo $header; ?>
<style type="text/css">
  .order-info-buttons{
    background-color: blue;
    padding: 10px;
  }
</style>
<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
   <?php if ($success) { ?>
    <div class="alert alert-success success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <div id="main-content" class="row"><?php echo $column_left; ?>
      <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-sm-6'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-sm-9'; ?>
      <?php } else { ?>
      <?php $class = 'col-sm-12'; ?>
      <?php } ?>
    <?php echo $column_right; ?>
    <?php if($chkIsPartner){ ?>
    <div id="content" class="<?php echo $class; ?>">
      <?php echo $content_top; ?>
        <h2 class="secondary-title">Informasi Pembayaran</h2>
        <?php if($isMember) { ?>
        
        <form class="form-horizontal" action="<?php echo $action; ?>" method="post" id="main-form">
        <div class="table-responsive">
          <table class="table table-bordered table-hover list">
            <thead>
              <tr>
                <td class="text-left"><?php echo $column_name; ?></td>
                <td class="text-left"><?php echo $column_tracking_no; ?></td>
                <td class="text-left"><?php echo $column_model; ?></td>
                <td class="text-right"><?php echo $column_quantity; ?></td>
                <td class="text-right"><?php echo $column_price; ?></td>
                <td class="text-right"><?php echo $column_total; ?></td>
				        <td class="text-right">Komisi</td>
				        <td class="text-right">Total Komisi</td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <!-- file download code added -->
                  <td class="text-left"><?php echo $product['name']; ?>
                  <td class="text-left">
                    <?php if($product['tracking']){ ?>
                      <?php echo $product['tracking']; ?>
                    <?php }else{ ?>
                      <input type="text" class="form-control" name="tracking[<?php echo $product['product_id'];?>]" placeholder="<?php echo $column_tracking_no; ?>" />
                    <?php $i = true; } ?>
                  </td>
                  <?php foreach ($product['option'] as $option) { ?>
                  <br />
                  <?php if ($option['type'] != 'file') { ?>
                  &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                  <?php } else { ?>
                  &nbsp;<small> - <?php echo $option['name']; ?>: <a href="<?php echo $option['href']; ?>"><?php echo $option['value']; ?></a></small>
                  <?php } ?>
                <?php } ?>
                </td>
                <td class="text-left"><?php echo $product['model']; ?></td>
                <td class="text-right"><?php echo $product['quantity']; ?></td>
                <td class="text-right"><?php echo $product['price']; ?></td>
                <td class="text-right"><?php echo $product['total']; ?></td>
				        <td class="text-right"><?= $product['komisi']; ?>%</td>
				        <td class="text-right">Rp. <?= $product['total_komisi']; ?></td>
                <!-- <td class="text-center"><button id="<?php echo $product['product_id']; ?>" class="btn btn-danger cancel-button">Cancel</button></td>           -->
              </tr>
              <?php } ?>
            </tbody>
          <tfoot>
              <?php foreach ($totals as $total) { ?>
                <tr>
                  <td class="text-right" colspan="7"><strong>Total Harga</strong></td>
                  <td class="text-right"><strong><?php echo $total['text']; ?></strong></td>
                </tr>
                <tr>
                  <td class="text-right" colspan="7"><strong>Komisi</strong></td>
                  <td class="text-right"><strong style="color: red;">Rp. <?php echo $total['komisi']; ?></strong></td>
                </tr>
                <tr>
                  <td class="text-right" colspan="7"><strong>Total Setelah Dipotong</strong></td>
                  <td class="text-right"><strong>Rp. <?php echo $total['setelahdipotong']; ?></strong></td>
                </tr>
                <tr>
                  <td class="text-right" colspan="7"><strong>Ongkos Kirim</strong></td>
                  <td class="text-right"><strong>Rp. <?php echo $total['ongkos_kirim']; ?></strong></td>
                </tr>
                <tr>
                  <td class="text-right" colspan="7"><strong>Total Diterima</strong></td>
                  <td class="text-right"><strong style="color: green;" >Rp. <?php echo $total['totalditerima']; ?></strong></td>
                </tr>
              <?php } ?>
            </tfoot>
          </table>
         </div>

        </form>

        <div id="history" class="clear"></div>
        <?php if ($histories) { ?>
        
        </div>
        <?php } ?>
        <?php } else { ?>
        <?php } ?>
    </div>
   <?php } ?>
  </div>
</div>

<?php echo $footer; ?>
