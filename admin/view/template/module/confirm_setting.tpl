<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
             <button type="submit" form="form-setting" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>  </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
        <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>

      <div class="panel-body">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-setting" class="form-horizontal">
    
    <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><i class="fa fa-cog fa-fw"></i> <?php echo $tab_general; ?></a></li>
            <li><a href="#tab-bank-account" data-toggle="tab"><i class="fa fa-user"></i> <?php echo $tab_account; ?></a></li>
          </ul>
<div class="tab-content">
        <div class="tab-pane active" id="tab-general">    
    <div class="form-group">
                <label class="col-sm-3 control-label" for="install-table"><?php echo $text_login_confirmation; ?></label>
                  <div class="col-sm-8">
                    <label class="radio-inline">
                      <?php if ($confirm_login_status) { ?>
                      <input type="radio" name="confirm_login_status" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="confirm_login_status" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$confirm_login_status) { ?>
                      <input type="radio" name="confirm_login_status" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="confirm_login_status" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
              </div>
          <div class="form-group">
                <label class="col-sm-3 control-label" for="install-table"><?php echo $text_transfer_receipt_mandatory; ?></label>
                  <div class="col-sm-8">
                    <label class="radio-inline">
                      <?php if ($confirm_transfer_receipt) { ?>
                      <input type="radio" name="confirm_transfer_receipt" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="confirm_transfer_receipt" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$confirm_transfer_receipt) { ?>
                      <input type="radio" name="confirm_transfer_receipt" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="confirm_transfer_receipt" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
              </div>

      <div class="form-group">
            <label class="col-sm-3 control-label" for="input-order-status"><?php echo $text_order_status; ?></label>
            <div class="col-sm-9">
              <select name="confirm_order_status" id="input-order-status" class="form-control">
                 <?php foreach ($order_statuses as $order_status) { ?>
                      <?php if ($order_status['order_status_id'] == $confirm_order_status) { ?>
                      <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
              </select>
            </div>
          </div>
    <div class="form-group">
                <label class="col-sm-3 control-label" for="install-table"><?php echo $entry_substract_stock; ?></label>
                  <div class="col-sm-8">
                    <label class="radio-inline">
                      <?php if ($confirm_substract_stock) { ?>
                      <input type="radio" name="confirm_substract_stock" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="confirm_substract_stock" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$confirm_substract_stock) { ?>
                      <input type="radio" name="confirm_substract_stock" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="confirm_substract_stock" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
              </div>
<div class="form-group">
                <label class="col-sm-3 control-label" for="install-table"><span data-toggle="tooltip" title="<?php echo $help_return_stock_status; ?>"><?php echo $entry_return_stock_status; ?></span></label>
                  <div class="col-sm-9">
                   <select name="confirm_return_stock_status" id="input-order-status" class="form-control">
                 <?php foreach ($order_statuses as $order_status) { ?>
                      <?php if ($order_status['order_status_id'] == $confirm_return_stock_status) { ?>
                      <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
              </select>
                  </div>
              </div>
     <div class="form-group">
            <label class="col-sm-3 control-label" for="input-status"><?php echo $text_activate_confirmation; ?></label>
            <div class="col-sm-9">
              <select name="confirm_status" id="input-status" class="form-control">
                <?php if ($confirm_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
      </div>
        <div class="tab-pane" id="tab-bank-account">
             <div class="col-sm-3">
                 <ul class="nav nav-pills nav-stacked" id="address">
                     <li class="active"><a href="#tab-customer" data-toggle="tab">Bank Account List</a></li>
                    <?php $account_row = 1; ?>
                    <?php foreach ($confirm_bank_accounts as $bank_account) { ?>
                    <li><a href="#tab-account<?php echo $account_row; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('#address a:first').tab('show'); $('#address a[href=\'#tab-account<?php echo $account_row; ?>\']').parent().remove(); $('#tab-account<?php echo $account_row; ?>').remove();"></i> <?php echo $tab_account . ' ' . $account_row; ?></a></li>
                    <?php $account_row++; ?>
                    <?php } ?>
                    <li id="account-add"><a onclick="addAccount();"><i class="fa fa-plus-circle"></i> <?php echo $button_account_add; ?></a></li>
                  </ul>
                </div>
            <div class="col-sm-9">
                  <div class="tab-content" id="bank_account_list">
                         <?php $account_row = 1; ?>
                    <?php foreach ($confirm_bank_accounts as $bank_account) { ?>
                    <div class="tab-pane" id="tab-account<?php echo $account_row; ?>">
                      <input type="hidden" name="address[<?php echo $account_row; ?>][name]" value="<?php echo $bank_account['name']; ?>" />
                      <div class="form-group required">
                        <label class="col-sm-3 control-label" for="input-confirm_bank_accounts<?php echo $account_row; ?>"><?php echo $entry_bank_account_name; ?></label>
                        <div class="col-sm-9">
                          <input type="text" name="confirm_bank_accounts[<?php echo $account_row; ?>][name]" value="<?php echo $bank_account['name']; ?>" placeholder="<?php echo $entry_bank_account_name; ?>" id="input-confirm_bank_accounts<?php echo $account_row; ?>" class="form-control" />
                          <?php if (isset($error_address[$account_row]['name'])) { ?>
                          <div class="text-danger"><?php echo $error_address[$account_row]['name']; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      
                      <input type="hidden" name="address[<?php echo $account_row; ?>][acc_number]" value="<?php echo $bank_account['acc_number']; ?>" />
                      <div class="form-group required">
                        <label class="col-sm-3 control-label" for="input-confirm_bank_accounts<?php echo $account_row; ?>"><?php echo $entry_bank_acc_number; ?></label>
                        <div class="col-sm-9">
                          <input type="text" name="confirm_bank_accounts[<?php echo $account_row; ?>][acc_number]" value="<?php echo $bank_account['acc_number']; ?>" placeholder="<?php echo $entry_bank_acc_number; ?>" id="input-confirm_bank_accounts<?php echo $account_row; ?>" class="form-control" />
                          <?php if (isset($error_address[$account_row]['acc_number'])) { ?>
                          <div class="text-danger"><?php echo $error_address[$account_row]['acc_number']; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                        
                        <input type="hidden" name="address[<?php echo $account_row; ?>][bank_name]" value="<?php echo $bank_account['bank_name']; ?>" />
                      <div class="form-group required">
                        <label class="col-sm-3 control-label" for="input-confirm_bank_accounts<?php echo $account_row; ?>"><?php echo $entry_bank_name; ?></label>
                        <div class="col-sm-9">
                          <input type="text" name="confirm_bank_accounts[<?php echo $account_row; ?>][bank_name]" value="<?php echo $bank_account['bank_name']; ?>" placeholder="<?php echo $entry_bank_name; ?>" id="input-confirm_bank_accounts<?php echo $account_row; ?>" class="form-control" />
                          <?php if (isset($error_address[$account_row]['acc_number'])) { ?>
                          <div class="text-danger"><?php echo $error_address[$account_row]['acc_number']; ?></div>
                          <?php } ?>
                        </div>
                      </div>
 
                    </div>
                      
                      <?php $account_row++; ?> 
                    <?php } ?>
              </div>
            </div>
        </div>
    </div>
            </form>
    </div>
  </div>
</div>
</div>

 <script type="text/javascript"><!--
var account_row = '<?php echo $account_row; ?>';

function addAccount() {

    html  = '<div class="tab-pane" id="tab-account' + account_row + '">';
	html += '  <div class="form-group required">';
	html += '    <label class="col-sm-3 control-label" for="input-bank-account-name' + account_row + '"><?php echo $entry_bank_account_name; ?></label>';
	html += '    <div class="col-sm-9"><input type="text" name="confirm_bank_accounts[' + account_row + '][name]" value="" placeholder="<?php echo $entry_bank_account_name; ?>" id="input-bank-account-name' + account_row + '" class="form-control" /></div>';
	html += '  </div>';  

	html += '  <div class="form-group required">';
	html += '    <label class="col-sm-3 control-label" for="input-bank-account-acc-number' + account_row + '"><?php echo $entry_bank_acc_number; ?></label>';
	html += '    <div class="col-sm-9"><input type="text" name="confirm_bank_accounts[' + account_row + '][acc_number]" value="" placeholder="<?php echo $entry_bank_acc_number; ?>" id="input-bank-account-name' + account_row + '" class="form-control" /></div>';
	html += '  </div>'; 
    
	html += '  <div class="form-group required">';
	html += '    <label class="col-sm-3 control-label" for="input-bank-account-bank-name' + account_row + '"><?php echo $entry_bank_name; ?></label>';
	html += '    <div class="col-sm-9"><input type="text" name="confirm_bank_accounts[' + account_row + '][bank_name]" value="" placeholder="<?php echo $entry_bank_name; ?>" id="input-bank-account-bank-name' + account_row + '" class="form-control" /></div>';
	html += '  </div>'; 
    
//    html += '  <input type="hidden" name="account[' + account_row + '][account_id]" value="" />';
//	html += '  <div class="form-group required">';
//	html += '    <label class="col-sm-3 control-label" for="input-bank-account-branch' + account_row + '"><?php echo $entry_bank_branch; ?></label>';
//	html += '    <div class="col-sm-9"><input type="text" name="confirm_bank_accounts[' + account_row + '][branch]" value="" placeholder="<?php echo $entry_bank_branch; ?>" id="input-bank-account-branch' + account_row + '" class="form-control" /></div>';
//	html += '  </div>'; 
    
	html += '  </div>';
    
    $('#account-add').before('<li><a href="#tab-account' + account_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'#address a:first\').tab(\'show\'); $(\'a[href=\\\'#tab-account' + account_row + '\\\']\').parent().remove(); $(\'#tab-account' + account_row + '\').remove();"></i> <?php echo $tab_account; ?> ' + account_row + '</a></li>');

    $('#bank_account_list').append(html);
        
	$('#address a[href=\'#tab-account' + account_row + '\']').tab('show');
        
    $('#tab-account' + account_row + ' .form-group[data-sort]').detach().each(function() {
		if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#tab-account' + account_row + ' .form-group').length) {
			$('#tab-account' + account_row + ' .form-group').eq($(this).attr('data-sort')).before(this);
		}

		if ($(this).attr('data-sort') > $('#tab-account' + account_row + ' .form-group').length) {
			$('#tab-account' + account_row + ' .form-group:last').after(this);
		}

		if ($(this).attr('data-sort') < -$('#tab-account' + account_row + ' .form-group').length) {
			$('#tab-account' + account_row + ' .form-group:first').before(this);
		}
	});
 
        account_row++;
    
    }
//--></script>

<?php echo $footer; ?>