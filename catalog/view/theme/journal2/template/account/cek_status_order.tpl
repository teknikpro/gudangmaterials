<?php echo $header; ?>
<div id="container" class="container j-container"> 
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
       <div id="notification_ongkir"></div>

  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
 
    <div id="content" class="<?php echo $class; ?>">
        <div class="col-sm-6 hpot_border_box panel panel-default">
            <div class="panel-body">        
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
  <div class="form-group">
       <label class="col-sm-12" for="input_invoice_no"><?php echo $entry_invoice_no; ?></label>
              <div class="col-sm-12">
                <input type="text" maxlength="10" name="invoice_no" id="invoice_no" value="<?php echo $invoice_no; ?>" id="input_invoice_no" class="form-control" />
		             
                </div>
           
      <div class="col-sm-12">
     <?php if ($error_invoice_no) { ?>
    		<span class="text-danger"><?php echo $error_invoice_no; ?></span>
    			<?php } ?>
   	</div>
   	 
   </div>
   
     <div class="form-group">
       <label class="col-sm-12" for="input_email"><?php echo $entry_email; ?></label>
              <div class="col-sm-12">
                <input type="text" name="email" id="email" maxlength="40" value="<?php echo $email; ?>" id="email" class="form-control" />
		             
                </div>
           
      <div class="col-sm-12">
     <?php if ($error_email) { ?>
    		<span class="text-danger"><?php echo $error_email; ?></span>
    			<?php } ?>
   </div>
   </div>
   
     <div class="form-group">
    <div class="col-sm-12">
      <?php if ($error_fake_invoice) { ?>
		      	      <span class="text-danger"><?php echo $error_fake_invoice; ?></span>
		 	<?php } ?>
    	</div>
    </div>
    
   <div class="form-group">
            <div class="pull-left col-sm-4">
        <input type="submit" name="submit" class="btn btn-primary"  id="cek-ongkir" value="<?php echo $button_send; ?>" />
        </div>
    </div>  
                </form>
                </div>
            </div>
        <!-- ZAKi HPWD -->
        <div class="col-sm-5 col-sm-offset-1 hpot_border_box panel panel-default">
           <div class="panel-body">
               <?php echo $text_instruction; ?>
           </div>
        </div>
        
    <?php if(!empty($order_info)) { ?>
        
<!--
        <table class="table table-bordered table-hover">
   <thead>
      <tr>
        <td class="left"><?php echo $column_status_order; ?></td>
      </tr>
      </thead>
      <tr><td><?php echo $text_order_status; ?><b><?php echo  $order_info['name']; ?></b></td>
  		</tr>
  </table>
-->

    
      <?php if($tabel_konfirmasi > 0) { ?>
      <?php if(isset($order_info['tgl_konfirm'])) { ?>
        <table class="table table-bordered table-hover">
   <thead>
      	<tr>
        <td class="left"><?php echo $column_status_konfirmasi; ?></td>
      </tr>
    </thead>
      <tr><td><?php echo $text_date_confirm; ?><b><?php echo  $date_confirm; ?></b></td>
  		</tr>
  </table>

      <?php if($no_receipt) { ?> 
       <table class="table table-bordered table-hover">
       <thead>
            <tr>
            <td class="left"><?php echo $column_resi_pengiriman; ?></td>
          </tr>
        </thead>
          <tr><td><b><?php echo $text_resi_pengiriman; ?> : </b> <?php echo $no_receipt; ?> </td>
            </tr>
      </table>
        <?php } ?>
     <?php } else { ?>
        <table class="table table-bordered table-hover">
   <thead>  
      	<tr>
        <td class="left"><?php echo $column_status_konfirmasi; ?></td>
      </tr>
         </thead>
      <tr><td><span class="text-danger"><?php echo $text_unconfirmed; ?></span></td>
  		</tr>
  	</table>
     <?php } ?>
  <?php } ?>
        
<table class="table table-bordered table-hover">
    <thead>
      <tr>
        <td class="left" colspan="2"><?php echo $text_order_detail; ?></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="left" style="width: 50%;"><?php if ($invoice_no) { ?>
          <b><?php echo $text_invoice_no; ?></b> <?php echo $invoice_no; ?><br />
          <?php } ?>
          <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
        <td class="left" style="width: 50%;"><?php if ($payment_method) { ?>
          <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
          <?php } ?>
          <?php if ($shipping_method) { ?>
          <b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
          <?php } ?></td>
      </tr>
    </tbody>
  </table>
        
    <!-- hpwd -->
<?php if($order_status_queue) { ?> 

       <?php if ($data['switch']==1) { ?>
       <!--<div class="col-xs-12 col-sm-12 hidden-md hidden-lg shipment-status-mobile">-->
	   <div>
        </br></br><center style="display:block;">
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

    </div>
  </div>
<?php } ?>
  <!-- end hpwd --> 
    
        <table class="table table-bordered table-hover">
    <thead>
      <tr>
        <td class="left"><?php echo $text_payment_address; ?></td>
        <?php if ($shipping_address) { ?>
        <td class="left"><?php echo $text_shipping_address; ?></td>
        <?php } ?>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="left"><?php echo $payment_address; ?></td>
        <?php if ($shipping_address) { ?>
        <td class="left"><?php echo $shipping_address; ?></td>
        <?php } ?>
      </tr>
    </tbody>
  </table>
    
   <?php  } ?>


	 <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>  
</div> 
<?php echo $footer; ?>