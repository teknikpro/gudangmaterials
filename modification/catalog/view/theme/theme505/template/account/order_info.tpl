<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $heading_title; ?></h2>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left" colspan="2"><?php echo $text_order_detail; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left" style="width: 50%;"><?php if ($invoice_no) { ?>
              <b><?php echo $text_invoice_no; ?></b> <?php echo $invoice_no; ?><br />
              <?php } ?>
              <b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
              <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
            <td class="text-left"><?php if ($payment_method) { ?>
              <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
              <?php } ?>
              <?php if ($shipping_method) { ?>
              <b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
              <?php } ?></td>
          </tr>
        </tbody>
      </table>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left" style="width: 50%;"><?php echo $text_payment_address; ?></td>
            <?php if ($shipping_address) { ?>
            <td class="text-left"><?php echo $text_shipping_address; ?></td>
            <?php } ?>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left"><?php echo $payment_address; ?></td>
            <?php if ($shipping_address) { ?>
            <td class="text-left"><?php echo $shipping_address; ?></td>
            <?php } ?>
          </tr>
        </tbody>
      </table>

 <!-- hpwd -->
<?php if($order_status_queue) { ?> 
      <div class="col-xs-12 col-sm-12 hidden-md hidden-lg shipment-status-mobile">
      <center style="display:block;">
            <?php foreach($order_status_queue as $order_status) { ?>
            <?php if($order_status['sort_order'] <= $current_order_status) { ?>
                    <span class="hpot-phone-view-complete" data-toggle="tooltip" data-placement="top" title="<?php echo $order_status['name'];?>"><i class="fa <?php echo $order_status['icon'];?>"></i></span>
            <?php } else { ?>
                    <span class="hpot-phone-view" data-toggle="tooltip" data-placement="top" title="<?php echo $order_status['name'];?>"><i class="fa <?php echo $order_status['icon'];?>"></i></span>
            <?php } ?>
            <?php } ?>
        </center>
        </div>
        <div class="clearfix"></div>
      <div class="shipment-status">
          <!-- START UL -->
        <ul class="timeline hidden-sm hidden-xs" id="timeline" style="width: inherit;padding-left: 0px;">  
            <?php foreach($order_status_queue as $order_status) { ?>
            <li class="li <?php echo $order_status['sort_order'] <= $current_order_status ? 'complete' : ''; ?>">
                <div class="timestamp">
                    </div>
                    <div class="status">
                        <span data-toggle="tooltip" data-placement="top" title="<?php echo $order_status['name'];?>"><i class="fa <?php echo $order_status['icon']; ?>"></i></span>
                      <h4><?php echo $order_status['name']; ?></h4>
                    </div>
                <div class="date"><?php echo $order_status['date']; ?></div>
                </li>
            <?php } ?>
        </ul>
        <!-- END UL -->
        <div class="manifest">
        <div class="manifest-border"></div>
          <div class="manifest-header">
            <div class='row'>
                <div class="col-sm-3">
              <h3><?php echo $text_shipping;?></h3>
            </div>
            <div class="col-sm-9">
                <?php if($shipment_profile) { ?> 
              <span>
              <?php
                echo isset($shipment_profile['courier_name']) ? $shipment_profile['courier_name'] : '';
                echo ' ';
                echo isset($shipment_profile['service_code']) ? $shipment_profile['service_code'] : '';
                echo '|';
                echo $text_shipping_number;
                echo '. ';
                echo isset($shipment_profile['waybill_number']) ? $shipment_profile['waybill_number'] : '';
                echo '';
                ?>
              </span>
                <?php } ?>
            </div>
            </div>
          </div>
          <div id="manifest-table" class="hidden-md hidden-lg">
            <div class='row'>
              <div class='col-sm-12 col-xs-12'>
                <?php 
                if($shipment_profile || $shipment_manifest) { 
                  echo "<b>";
                  echo isset($shipment_profile['receiver_name']) ? $shipment_profile['receiver_name'] : '';
                  echo "</b>";
                  echo "<br>";
                  echo isset($shipment_profile['receiver_address1']) ? $shipment_profile['receiver_address1'] : '';
                  echo "<br>";
                  echo isset($shipment_profile['receiver_address2']) ? $shipment_profile['receiver_address2'] : '';
                  echo "<br>";
                  echo isset($shipment_profile['receiver_address3']) ? $shipment_profile['receiver_address3'] : '';
                  echo "<br>";
                  echo isset($shipment_profile['destination']) ? $shipment_profile['destination'] : '';
                } else {
                  ?>
                  <div class="no-receipt"><?php echo $text_no_receipt; ?></div>
                  <?php
                }
                ?>
              </div>
              <div class='col-sm-12 col-xs-12'>
                <?php 
                if($shipment_profile || $shipment_manifest) { 
                  $i = 0; 
                  foreach ($shipment_manifest as $manifest => $item) { 
                    ?>
                              <div class="item <?php echo $i == 0 ? 'active' : ''; ?>">
                                  <span class="glyphicon glyphicon-ok"></span>
                                  <div><?php echo $item['manifest_date'].' '.$item['manifest_time'].' ['.$item['manifest_description'].']'; ?></div>
                              </div>
                    <?php $i++; }
                  } else {
                    ?>
                    <div class="no-receipt"><?php echo $text_no_receipt; ?></div>
                    <?php
                  } 
                  ?>
              </div>
            </div>
          </div>
          <table id="manifest-table" class="table hidden-xs hidden-sm">
              <?php if($shipment_profile || $shipment_manifest) { ?>
            <tr>
              <td>
                <?php
                echo "<b>";
                echo isset($shipment_profile['receiver_name']) ? $shipment_profile['receiver_name'] : '';
                echo "</b>";
                echo "<br>";
                echo isset($shipment_profile['receiver_address1']) ? $shipment_profile['receiver_address1'] : '';
                echo "<br>";
                echo isset($shipment_profile['receiver_address2']) ? $shipment_profile['receiver_address2'] : '';
                echo "<br>";
                echo isset($shipment_profile['receiver_address3']) ? $shipment_profile['receiver_address3'] : '';
                echo "<br>";
                echo isset($shipment_profile['destination']) ? $shipment_profile['destination'] : '';
                ?>
              </td>
              <td>
        <?php $i = 0; foreach ($shipment_manifest as $manifest => $item) { ?>
                    <div class="item <?php echo $i == 0 ? 'active' : ''; ?>">
                        <span class="glyphicon glyphicon-ok"></span>
                        <div><?php echo $item['manifest_date'].' '.$item['manifest_time'].' ['.$item['manifest_description'].']'; ?></div>
                    </div>
                    <?php $i++; } ?>
            </td>
          </tr>
        <?php } else { ?>
             <tr>
              <td><div class="no-receipt"><?php echo $text_no_receipt; ?></div></td>
              </tr>
        <?php } ?>
      </table>
    </div>
  </div>
<?php } ?>
  <!-- end hpwd --> 
            
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-left"><?php echo $column_name; ?></td>
              <td class="text-left"><?php echo $column_model; ?></td>
              <td class="text-right"><?php echo $column_quantity; ?></td>
              <td class="text-right"><?php echo $column_price; ?></td>
              <td class="text-right"><?php echo $column_total; ?></td>
              <?php if ($products) { ?>
              <td style="width: 20px;"></td>
              <?php } ?>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td class="text-left"><?php echo $product['name']; ?>
                <?php foreach ($product['option'] as $option) { ?>
                <br />
                &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                <?php } ?></td>
              <td class="text-left"><?php echo $product['model']; ?></td>
              <td class="text-right"><?php echo $product['quantity']; ?></td>
              <td class="text-right"><?php echo $product['price']; ?></td>
              <td class="text-right"><?php echo $product['total']; ?></td>
              <td class="text-right" style="white-space: nowrap;"><?php if ($product['reorder']) { ?>
                <a href="<?php echo $product['reorder']; ?>" data-toggle="tooltip" title="<?php echo $button_reorder; ?>" class="btn btn-primary"><i class="fa fa-shopping-cart"></i></a>
                <?php } ?>
                <a href="<?php echo $product['return']; ?>" data-toggle="tooltip" title="<?php echo $button_return; ?>" class="btn btn-danger"><i class="fa fa-reply"></i></a></td>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <tr>
              <td class="text-left"><?php echo $voucher['description']; ?></td>
              <td class="text-left"></td>
              <td class="text-right">1</td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <?php if ($products) { ?>
              <td></td>
              <?php } ?>
            </tr>
            <?php } ?>
          </tbody>
          <tfoot>
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td colspan="3"></td>
              <td class="text-right"><b><?php echo $total['title']; ?></b></td>
              <td class="text-right"><?php echo $total['text']; ?></td>
              <?php if ($products) { ?>
              <td></td>
              <?php } ?>
            </tr>
            <?php } ?>
          </tfoot>
        </table>
      </div>
      <?php if ($comment) { ?>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left"><?php echo $text_comment; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left"><?php echo $comment; ?></td>
          </tr>
        </tbody>
      </table>
      <?php } ?>
      <?php if ($histories) { ?>
      <h3><?php echo $text_history; ?></h3>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left"><?php echo $column_date_added; ?></td>
            <td class="text-left"><?php echo $column_status; ?></td>
            <td class="text-left"><?php echo $column_comment; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($histories as $history) { ?>
          <tr>
            <td class="text-left"><?php echo $history['date_added']; ?></td>
            <td class="text-left"><?php echo $history['status']; ?></td>
            <td class="text-left"><?php echo $history['comment']; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
        
            <script>
            $(function () {
              $('[data-toggle="tooltip"]').tooltip()
            })
            </script>
            
<?php echo $footer; ?>