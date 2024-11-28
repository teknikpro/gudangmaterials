<?php echo $header; ?><?php echo $separate_column_left; ?>
<style>
  .dropdown-menu {
    position: absolute !important;
  }
</style>

<?php if(isset($separate_view) && $separate_view){ ?>
  <div class="container-fluid" id="content">
<?php } else { ?>
  <div class="container">
<?php } ?>
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-check-circle"></i> <?php echo $error_warning; ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>
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
      <?php if($chkIsPartner){ ?>
      <h1><?php echo $text_edit; ?>
        <div class="pull-right">
          <?php if($marketplace_sellereditreview){ ?>
            <button type="submit" form="form-review" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
          <?php } ?>
          <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
        </div>
      </h1>

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-review" class="form-horizontal">
        <div class="form-group required">
          <label class="col-sm-2 control-label" for="input-customer"><span data-toggle="tooltip" title="<?php echo $help_customer; ?>"><?php echo $entry_customer; ?></span></label>
          <div class="col-sm-10">
            <input type="text" name="customer" value="<?php echo $customer; ?>" placeholder="<?php echo $entry_customer; ?>" id="input-customer" class="form-control" />
            <input type="hidden" name="customer_id" value="<?php echo $customer_id; ?>" />
            <?php if ($error_customer) { ?>
            <div class="text-danger"><?php echo $error_customer; ?></div>
            <?php } ?>
          </div>
        </div>

        <div class="form-group required">
          <label class="col-sm-2 control-label" for="input-text"><?php echo $entry_text; ?></label>
          <div class="col-sm-10">
            <textarea name="text" cols="60" rows="8" placeholder="<?php echo $entry_text; ?>" id="input-text" class="form-control"><?php echo $text; ?></textarea>
            <?php if ($error_text) { ?>
            <div class="text-danger"><?php echo $error_text; ?></div>
            <?php } ?>
          </div>
        </div>

        <?php if(isset($review_fields) && $review_fields){
          foreach($review_fields AS $review_field){ ?>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-<?php echo $review_field['field_name']; ?>"><?php echo $review_field['field_name']; ?></label>
              <div class="col-sm-10">
                <?php for ($i=1; $i <=5 ; $i++) { ?>
                  <label class="radio-inline">
                    <?php if (isset($review_attributes[$review_field['field_id']]) && $review_attributes[$review_field['field_id']] == $i) { ?>
                    <input type="radio" name="review_attributes[<?php echo $review_field['field_id']; ?>]" value="<?php echo $i; ?>" checked="checked" />
                    <?php echo $i; ?>
                    <?php } else { ?>
                    <input type="radio" name="review_attributes[<?php echo $review_field['field_id']; ?>]" value="<?php echo $i; ?>" />
                    <?php echo $i; ?>
                    <?php } ?>
                  </label>
                <?php } ?>
              </div>
            </div>
          <?php }
        } ?>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
          <div class="col-sm-10">
            <select name="status" id="input-status" class="form-control">
              <?php if ($status) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select>
          </div>
        </div>
      </form>

      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
<?php if ($customer_id) {?>
   var customer_id = <?php echo $customer_id; ?>;
<?php }else{?>
   var customer_id = '';
<?php } ?>

$('input[name=\'customer\']').autocomplete({
  'source': function(request, response) {
    $.ajax({
      url: 'index.php?route=account/customerpartner/review/autocomplete&filter_customer=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['customer_id']
          }
        }));
      }
    });
  },
  'select': function(item) {

    $('input[name=\'customer\']').val(item['label']);
    $('input[name=\'customer_id\']').val(item['value']);
    customer_id = item['value'];
  }
});

//--></script>
<?php echo $footer; ?>
