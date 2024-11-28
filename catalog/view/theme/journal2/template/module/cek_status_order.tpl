<h3><?php echo $heading_title; ?></h3>

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
     <div class="form-group required">
       <label class="col-sm-12 control-label pull-left" for="input_invoice_no"><?php echo $entry_invoice_no; ?></label>
              <div class="col-sm-12">
                <input type="text" name="invoice_no" maxlength="10" id="invoice_no" value="<?php echo $invoice_no; ?>" id="input_invoice_no" class="form-control" />
		             
                </div>
             </div>
              <div class="form-group required">
       <label class="col-sm-12 control-label pull-left" for="input_email"><?php echo $entry_email; ?></label>
              <div class="col-sm-12">
                <input type="text" name="email" maxlength="40" id="email" value="<?php echo $email; ?>" id="email" class="form-control" />
		             
                  </div>
                </div>
         <div class="form-group required">        
          <div class="col-sm-12 pull-right">
      <input type="submit" name="submit" class="btn btn-primary"  id="konfirmasi" value="<?php echo $button_send; ?>" />
    		</div>   

    	</div>
      
  </form>