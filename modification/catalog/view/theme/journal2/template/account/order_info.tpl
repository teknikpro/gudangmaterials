<?php echo $header; ?>

<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><span itemprop="title"><?php echo $breadcrumb['text']; ?></span></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <h1 class="heading-title"><?php echo $heading_title; ?></h1>
      <?php echo $content_top; ?>
      <table class="table table-bordered table-hover list">
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
            <td class="text-left">
              <?php if ($payment_method) { ?>
                <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
                <b>Nomor Virtual : </b> <?php echo $nomorvirtual; ?><br />
              <?php } ?>
              <?php if ($shipping_method) { ?>
                <b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
              <?php } ?>
            </td>
          </tr>
        </tbody>
      </table>
      <table class="table table-bordered table-hover list">
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

 
      <?php if ($data['switch']==1) { ?>
	  
 
	  
       <!--<div class="col-xs-12 col-sm-12 hidden-md hidden-lg shipment-status-mobile">-->
	   <div>
        <center style="display:block;">
            <?php foreach($order_status_queue as $order_status) { ?>
            <?php if($order_status['sort_order'] <= $current_order_status) { ?>
                    <img src="../image/arrow2.png"/><span class="hpot-phone-view-complete" data-toggle="tooltip" data-placement="top" title="<?php echo $order_status['name'];?>~<?php echo $order_status['date']; ?>"><i class="fa <?php echo $order_status['icon'];?>" style="color:#a35214; font-size:20px; height: auto; width: auto;" ></i></span>
            <?php } else { ?>
                    <img src="../image/arrow2.png"/><span class="hpot-phone-view" data-toggle="tooltip" data-placement="top" title="<?php echo $order_status['name'];?>~<?php echo $order_status['date']; ?>"><i class="fa <?php echo $order_status['icon'];?>" style="font-size:20px; height: auto; width: auto;"  ></i></span>
            <?php } ?>
            <?php } ?>
        </center>
      </div>
	   <!--<div>
        <center style="display:block;">
            <?php foreach($order_status_queue as $order_status) { ?>
              <?php if($order_status['sort_order'] <= $current_order_status) { ?>               
               <span class="hpot-phone-view-complete" data-toggle="tooltip" data-placement="top" title="<?php echo $order_status['name'];?>"><i class="fa <?php echo $order_status['icon'];?> " style="color:#a35214; font-size:20px; height: auto; width: auto;" ></i></span>(<?php echo $order_status['name']; ?>)<br><br>
              <?php } else { ?>     
                 <span class="hpot-phone-view" data-toggle="tooltip" data-placement="top" title="<?php echo $order_status['name'];?>"><i class="fa <?php echo $order_status['icon'];?>" style="color:#a35214; font-size:20px; height: auto; width: auto;" ></i></span>(<?php echo $order_status['name']; ?>)<br><br>
              <?php } ?>
                  
            <?php } ?>
       </center>
      </div>-->
	
	  <?php } ?>
	 
      <div class="clearfix"></div>
	  
      <div class="shipment-status">
          <!-- START UL -->
		<?php if ($data['switch']==0) { ?>

           <ul class="timeline hidden-sm hidden-xs" id="timeline" style="width: inherit;padding-left: 0px;">  
            <?php foreach($order_status_queue as $order_status) { ?>
            <li class="li <?php echo $order_status['sort_order'] <= $current_order_status ? 'complete' : ''; ?>">
                <div>
                    </div>
                    <div class="status">
					   <?php if($order_status['date'] > 0) { ?> 
                         <img src="../image/arrow2.png"/><span data-toggle="tooltip" data-placement="top" title="<?php echo $order_status['name'];?>"><i class="fa <?php echo $order_status['icon']; ?>" style="color:#a35214;"></i></span>
						  <h4><strong><font size="2"  color="black"><?php echo $order_status['name']; ?></font></strong></h4>
						<?php } else { ?>
						    <span data-toggle="tooltip" data-placement="top" title="<?php echo $order_status['name'];?>"><i class="fa <?php echo $order_status['icon']; ?>"></i></span>
							 <h4><?php echo $order_status['name']; ?></h4>
						 <?php } ?>
                     
                    </div>
                    <div class="date"><strong><font size="2"  color="red"><?php echo $order_status['date']; ?></font></strong></div>
                </li>
            <?php } ?>
        </ul>
		 <?php } ?>
        <!-- END UL -->
        <div class="manifest">
		
        <!--<div class="manifest-border"></div>
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
         </div>-->
          <?php if($linklacak!="ro" and $linklacak!="x") { ?>
		      <p style="text-align:center;">
              <a href="<?= $linklacak; ?>" class="btn btn-primary btn-lg btn-block" target="_blank">Lacak Pengiriman</a>
          </p>
          <?php } else { ?>
		     <?php if($linklacak=="ro" ) { ?>
               <?= $cekresi; ?>
			  <?php } ?>
          <?php } ?>


          <!--<div id="manifest-table" class="hidden-md hidden-lg">
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
          </div> -->
		  
          <!--<table id="manifest-table" class="table hidden-xs hidden-sm">
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
      </table>-->
    </div>
  </div>
<?php } ?>
  <!-- end hpwd --> 
      <div class="table-responsive">
        <table class="table table-bordered table-hover list">
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

              <?php if (isset($marketplace_status) && $marketplace_status) {?>
                  <a onclick = "getProductOrderStatus(<?php echo $product['order_id'];?>,<?php echo $product['product_id'];?>)" data-toggle="tooltip" title="<?php echo $button_order_detail; ?>" class="btn btn-primary button"><i class="fa fa-truck"></i></a>
                  <button type="hidden" href="#orderProductStatusModal" data-toggle="modal" id="statusButton"></button>
              <?php } ?>
          
                <a href="<?php echo $product['return']; ?>" data-toggle="tooltip" title="<?php echo $button_return; ?>" class="btn btn-danger"><i class="fa fa-reply"></i></a></td>

                
        <!--<embed src="https://app.sandbox.midtrans.com/snap/v1/transactions/78d0fd70-dac5-4b8b-adb7-6a3c099b5f4d/pdf">-->

	
<!--<a class="liens" target="_blank" href="https://app.sandbox.midtrans.com/snap/v1/transactions/17e48219-1d5f-4b95-98d8-d910eb0bec0f/pdf"><i class="fa fa-reply"></i></a></td>--> 


<!--<a href="javascript:alert('Helloo!!')">Sebuah Link</a></td>--> 

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
      <table class="table table-bordered table-hover list">
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

 <!-- hpwd -->
 
<!--<?php if($order_status_queue) { ?> 
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
<?php } ?>  -->
  <!-- end hpwd --> 
            
      <div class="table-responsive">
        <table class="table table-bordered table-hover list">
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
      </div>
      <?php } ?>
	  
	  <!--<center><div id="scroller"><iframe name="myiframe" id="myiframe" src="../image/pdf/billing01.pdf#toolbar=0"></div></center>-->  
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary button"><?php echo $button_continue; ?></a></div>
      </div>
      </div>
    </div>
</div>
        
            <script>
            $(function () {
              $('[data-toggle="tooltip"]').tooltip()
            })
            </script>
            

              <?php if (isset($marketplace_status) && $marketplace_status) {?>
              <div id="orderProductStatusModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                      <h3 class="modal-title"><?php echo $text_tracking; ?></h3>
                  </div>
                  <div class="modal-body" id="orderProductStatusModalBody">

                  </div>
                  <div class="modal-footer">
                    <button class="btn closebtn" data-dismiss="modal" aria-hidden="true" id="closeButton">Close</button>
                  </div>
                </div>
              </div>
              </div>
              <script>
              function getProductOrderStatus (order_id,product_id) {
                    $.ajax({
                      url: 'index.php?route=account/customerpartner/order_detail&order_id='+order_id+'&product_id='+product_id,
                      type: 'get',
                      methodType: 'html',
                      success: function(html) {
                        $('#orderProductStatusModalBody').html(html);
                        $('#statusButton').click();
                      }
                    });
              }
              </script>
              <?php } ?>
          
<?php echo $footer; ?>
