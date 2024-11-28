<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-free-checkout" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-free-checkout" class="form-horizontal">

          <div class="form-group">
            <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_APIVersion; ?>"><?php echo $entry_APIVersion; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="iwallet_APIVersion" value="<?php echo $iwallet_APIVersion; ?>" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_MerchantKey; ?>"><?php echo $entry_MerchantKey; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="iwallet_MerchantKey" value="<?php echo $iwallet_MerchantKey; ?>" class="form-control" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_MerchantEmail; ?>"><?php echo $entry_MerchantEmail; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="iwallet_MerchantEmail" value="<?php echo $iwallet_MerchantEmail; ?>" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_callback; ?>"><?php echo $entry_callback; ?></span></label>
            <div class="col-sm-10">
              <textarea rows="5" readonly="readonly" class="form-control"><?php echo $callback; ?></textarea>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_UseIntMode; ?>"><?php echo $entry_UseIntMode; ?></span></label>
            <div class="col-sm-10">
		<select name="iwallet_UseIntMode" class="form-control">
			<?php if ($iwallet_UseIntMode) { ?>
			<option value="1" selected="selected"><?php echo $text_yes; ?></option>
			<option value="0"><?php echo $text_no; ?></option>
			<?php } else { ?>
			<option value="1"><?php echo $text_yes; ?></option>
			<option value="0" selected="selected"><?php echo $text_no; ?></option>
			<?php } ?>
		</select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_order_status; ?></span></label>
            <div class="col-sm-10">
		<select name="iwallet_order_status_id" class="form-control">
			<?php foreach ($order_statuses as $order_status) { ?>
			<?php if ($order_status['order_status_id'] == $iwallet_order_status_id) { ?>
			<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
			<?php } else { ?>
			<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
			<?php } ?>
			<?php } ?>
		</select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_status; ?></span></label>
            <div class="col-sm-10">
		<select name="iwallet_status" class="form-control">
			<?php if ($iwallet_status) { ?>
			<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
			<option value="0"><?php echo $text_disabled; ?></option>
			<?php } else { ?>
			<option value="1"><?php echo $text_enabled; ?></option>
			<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
			<?php } ?>
		</select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_sort_order; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="iwallet_sort_order" value="<?php echo $iwallet_sort_order; ?>" class="form-control" />
            </div>
          </div>
          
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 