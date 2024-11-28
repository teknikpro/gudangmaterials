<style type="text/css">
  input[type="text"], input[type="email"], input[type="password"], input[type="tel"], textarea {
    background: #FFF none repeat scroll 0% 0%;
    border-radius: 0px;
    border: 1px solid #E4E4E4;
    padding: 8px;
    width: 90%;
    transition: all 0.2s ease 0s;
    font-size: 13px;
    box-shadow: 0px 0px 3px rgba(0, 0, 0, 0.08) inset;
  }
  @media screen and (max-width: 550px) {
    .oc2 fieldset {
      min-width: 100%;
      max-width: 100%;
    }
    #input-csv-name, #separator {
      width: 100% !important;
    }
  }
</style>
<?php echo $header; ?><?php echo $separate_column_left; ?>
<?php if($chkIsPartner){ ?>
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
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"> </i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($attention) { ?>
    <div class="alert alert-info"><?php echo $attention; ?></div>
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
    <h1>
      <?php echo $heading_title; ?>
      <div class="pull-right">
        <button type="submit" form="form-shipping" data-toggle="tooltip" title="<?php echo $button_next; ?>" class="btn btn-primary"><i class="fa fa-share"></i></button>
        <a href="<?php echo $back; ?>" data-toggle="tooltip" title="<?php echo $button_back; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
    </h1>

    <legend><i class="fa fa-list"></i> <?php echo $text_mpshipping; ?></legend>
      <?php if($isMember) { ?>

          <div class="alert alert-info"><i class="fa fa-exclamation-circle"></i> <?php echo $entry_info; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
          </div>
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-shipping" class="form-horizontal">
            <div class="form-group">
              <label class="col-sm-3 control-label" for="input-status"><?php echo $entry_status; ?></label>
              <div class="col-sm-9">
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
            <div class="form-group">
              <label class="col-sm-3 control-label" for="input-flatrate"><span data-toggle="tooltip" title="<?php echo $add_flatrate; ?>"><?php echo $add_flatrate; ?></span></label>
              <div class="col-sm-9">
                <div class="input-group">
                <input type="text" name="shipping_add_flatrate" value="<?php if(isset($shipping_add_flatrate_amount)){ echo $shipping_add_flatrate_amount; } ?>" placeholder="<?php echo $add_flatrate; ?>" id="input-flatrate" class="form-control" />
                <span class="input-group-addon"><?php echo $shipping_add_flatrate; ?></span>
                </div>
              </div>
            </div>

            <div class="form-group required">
              <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $entry_csv_info; ?>"><?php echo $entry_csv; ?></span></label>
              <div class="col-sm-9">
                <div class="input-group">
                  <span class="input-group-btn">
                    <button type="button" class="btn btn-primary" onclick="$('input[name=\'up_file\']').trigger('click');"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                  </span>
                  <input type="text" id="input-csv-name" class="form-control" disabled/>

                </div>
                <input type="file" name="up_file" class="form-control" style="display:none;">
                <div class="hide csv-warning">
                  <?php echo $entry_error_csv; ?>
                </div>
              </div>
            </div>

            <div class="form-group required">
              <label class="col-sm-3 control-label"><span data-toggle="tooltip" title="<?php echo $entry_separator_info; ?>"><?php echo $entry_separator; ?></span></label>
              <div class="col-sm-9">
                <div class="input-group">
                  <span class="input-group-btn">
                    <button type="button" class="btn btn-primary separator"><i class="fa fa-keyboard-o"></i> <?php echo $entry_sep_manually; ?></button>
                  </span>
                  <div>
                    <select name="separator" id="separator" class="form-control">
                      <option value=";">Semicolon ; </option>
                      <option value=" ">Tab</option>
                      <option value=",">Comma ,</option>
                      <option value=":">Colon : </option>
                      <option value="|">Vertical bar</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>

            </form>

        <?php } else { ?>
          <div class="text-danger">
            <?php echo $error_warning_authenticate; ?>
          </div>
        <?php } ?>

<?php echo $content_bottom; ?></div>
<?php }else{  echo "<h2 style='color:#F93D49;'>Please inform Admin</h2>";   } ?>
<?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

<script type="text/javascript">
jQuery('input[name=up_file]').change(function(){
  csv_val = jQuery(this).val().split('.').pop();
    $('#input-csv-name').val(jQuery(this).val().replace(/C:\\fakepath\\/i, ''));
    if(csv_val!='csv'){
      jQuery('.csv-warning').addClass('text-danger').removeClass('hide');
    }else{
      jQuery('.csv-warning').addClass('hide').removeClass('text-danger');
    }
});

nextHtml = false;
prevHtml = $("<input type='text' class=\"form-control\"/>").attr({ name: 'separator' });
jQuery('.separator').click(function(){
  catchDiv = $(this).parent().next();
  nextHtml = catchDiv.html();
  catchDiv.html(prevHtml);
  prevHtml = nextHtml;
});

$('#form-delete').submit(function(){
    if ($(this).attr('action').indexOf('delete',1) != -1) {
        if (!confirm('<?php echo $text_confirm; ?>')) {
            return false;
        }
    }
});

function filter() {

  url = 'index.php?route=account/customerpartner/add_shipping_mod';

  var filter_name = $('input[name=\'filter_name\']').val();

  if (filter_name) {
    url += '&filter_name=' + encodeURIComponent(filter_name);
  }

  var filter_country = $('input[name=\'filter_country\']').val();

  if (filter_country) {
    url += '&filter_country=' + encodeURIComponent(filter_country);
  }

  var filter_price = $('input[name=\'filter_price\']').val();

  if (filter_price) {
    url += '&filter_price=' + encodeURIComponent(filter_price);
  }

  var filter_zip_to = $('input[name=\'filter_zip_to\']').val();

  if (filter_zip_to) {
    url += '&filter_zip_to=' + encodeURIComponent(filter_zip_to);
  }

  var filter_zip_from = $('input[name=\'filter_zip_from\']').val();

  if (filter_zip_from) {
    url += '&filter_zip_from=' + encodeURIComponent(filter_zip_from);
  }

  var filter_weight_to = $('input[name=\'filter_weight_to\']').val();

  if (filter_weight_to) {
    url += '&filter_weight_to=' + encodeURIComponent(filter_weight_to);
  }

  var filter_weight_from = $('input[name=\'filter_weight_from\']').val();

  if (filter_weight_from) {
    url += '&filter_weight_from=' + encodeURIComponent(filter_weight_from);
  }

  location = url;
}
</script>
