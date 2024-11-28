<?php echo $header; ?>
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
</style>
<?php if($chkIsPartner){ ?>
<link type="text/css" href="catalog/view/theme/journal2/stylesheet/MP/journal2.css" rel="stylesheet"  />

<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

  <?php if ($error_warning) { ?>
    <div class="alert alert-danger warning"><i class="fa fa-exclamation-circle"></i><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
    <div class="alert alert-success success"><i class="fa fa-check-circle"> </i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($attention) { ?>
    <div class="alert alert-info information"><?php echo $attention; ?></div>
  <?php } ?>

  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
<?php echo $column_right; ?>
  <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
    <h1 class="heading-title">
      <?php echo $heading_title; ?></h1>

    <h2 class="secondary-title"><?php echo $text_mpshipping; ?></h2>
      <div class="buttons">
        <div class="pull-left">
          <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary button"><i class="fa fa-plus"></i></a>
          <a href="<?php echo $back; ?>" data-toggle="tooltip" title="<?php echo $button_back; ?>" class="btn btn-default button"><i class="fa fa-reply"></i></a>
          <a onclick="$('#form-delete').submit();" data-toggle="tooltip" class="btn btn-danger button"  title="<?php echo $button_delete; ?>"><i class="fa fa-trash-o"></i></a>
        </div>
      </div>
      <?php if($isMember) { ?>
          <fieldset>
          <div class="form-horizontal row">
              <div class="pull-left" style="width:29%;display:inline-block;margin-right:1%;">
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-country"><?php echo $shipping_country; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="filter_country" value="<?php echo $filter_country; ?>" placeholder="<?php echo $filter_country; ?>" id="input-country" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-price"><?php echo $price; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="filter_price" value="<?php echo $filter_price; ?>" placeholder="<?php echo $filter_price; ?>" id="input-price" class="form-control" />
                    </div>
                </div>
                </div>

                <div class="pull-left" style="width:29%;display:inline-block;margin-right:1%;">
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-zipto"><?php echo $zip_to; ?></label>
                  <div class="col-sm-10">
                  <input type="text" name="filter_zip_to" value="<?php echo $filter_zip_to; ?>" placeholder="<?php echo $filter_zip_to; ?>" id="input-zipto" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-weightto"><?php echo $weight_to; ?></label>
                  <div class="col-sm-10">
                  <input type="text" name="filter_weight_to" value="<?php echo $filter_weight_to; ?>" placeholder="<?php echo $filter_weight_to; ?>" id="input-weightto" class="form-control" />
                </div>
              </div>
              </div>

             <div class="pull-left" style="width:29%;display:inline-block;">
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-zipfrom"><?php echo $zip_from; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="filter_zip_from" value="<?php echo $filter_zip_from; ?>" placeholder="<?php echo $filter_zip_from; ?>" id="input-zipfrom" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-weightfrom"><?php echo $weight_from; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="filter_weight_from" value="<?php echo $filter_weight_from; ?>" placeholder="<?php echo $filter_weight_from; ?>" id="input-weightfrom" class="form-control" />
                  </div>
                </div>
                </div>
                <div class="pull-left" style="width:10%;display:inline-block;">
                  <a onclick="clearfilter();"  class="btn btn-danger pull-right button" style="margin-left: 10px;" data-toggle="tooltip" title="<?php echo $button_clear_filtering; ?>"><?php echo $button_clear_filtering; ?></a>

                  <a onclick="filter();"  class="button pull-right" data-toggle="tooltip" title="<?php echo $button_filtering; ?>"><?php echo $button_filtering; ?></a>
                </div>
              </div>
            </fieldset>




          <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-delete">
            <div class="table-responsive">
              <table class="table table-bordered table-hover list">
                <thead>
                    <tr>
                    <td width="1" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                      <td class="text-left">
                        <?php if ($sort == 'cs.country_code') { ?>
                        <a href="<?php echo $sort_country_code; ?>" class="<?php echo strtolower($order); ?>"><?php echo $shipping_country; ?></a>
                        <?php } else { ?>
                        <a href="<?php echo $sort_country_code; ?>"><?php echo $shipping_country; ?></a>
                        <?php } ?>
                      </td>
                      <td class="text-left">
                        <?php if ($sort == 'cs.zip_from') { ?>
                        <a href="<?php echo $sort_zip_from; ?>" class="<?php echo strtolower($order); ?>"><?php echo $zip_from; ?></a>
                        <?php } else { ?>
                        <a href="<?php echo $sort_zip_from; ?>"><?php echo $zip_from; ?></a>
                        <?php } ?>
                      </td>
                      <td class="text-left">
                        <?php if ($sort == 'cs.zip_to') { ?>
                        <a href="<?php echo $sort_zip_to; ?>" class="<?php echo strtolower($order); ?>"><?php echo $zip_to; ?></a>
                        <?php } else { ?>
                        <a href="<?php echo $sort_zip_to; ?>"><?php echo $zip_to; ?></a>
                        <?php } ?>
                      </td>
                      <td class="text-left">
                        <?php if ($sort == 'cs.price') { ?>
                        <a href="<?php echo $sort_price; ?>" class="<?php echo strtolower($order); ?>"><?php echo $price; ?></a>
                        <?php } else { ?>
                        <a href="<?php echo $sort_price; ?>"><?php echo $price; ?></a>
                        <?php } ?>
                      </td>
                      <td class="text-left">
                        <?php if ($sort == 'cs.weight_to') { ?>
                        <a href="<?php echo $sort_weight_to; ?>" class="<?php echo strtolower($order); ?>"><?php echo $weight_to; ?></a>
                        <?php } else { ?>
                        <a href="<?php echo $sort_weight_to; ?>"><?php echo $weight_to; ?></a>
                        <?php } ?>
                      </td>
                      <td class="text-left">
                        <?php if ($sort == 'cs.weight_from') { ?>
                        <a href="<?php echo $sort_weight_from; ?>" class="<?php echo strtolower($order); ?>"><?php echo $weight_from; ?></a>
                        <?php } else { ?>
                        <a href="<?php echo $sort_weight_from; ?>"><?php echo $weight_from; ?></a>
                        <?php } ?>
                      </td>
                      <td class="text-left"><?php echo $max_days; ?></td>
                    </tr>
                </thead>
                <tbody>
                      <?php if ($result_shipping) { ?>
                      <?php foreach ($result_shipping as $result_shippings) { ?>
                        <tr>
                          <td class="text-center"><?php if ($result_shippings['selected']) { ?>
                            <input type="checkbox" name="selected[]" value="<?php echo $result_shippings['id']; ?>" checked="checked" />
                            <?php } else { ?>
                            <input type="checkbox" name="selected[]" value="<?php echo $result_shippings['id']; ?>" />
                            <?php } ?>
                          </td>
                          <td class="text-left"><?php echo  $result_shippings['country']; ?></td>
                          <td class="text-left" ><?php echo $result_shippings['zip_from']; ?></td>
                          <td class="text-left"><?php echo $result_shippings['zip_to']; ?></td>
                          <td class="text-left"><?php echo  $result_shippings['price']; ?></td>
                          <td class="text-left"><?php echo $result_shippings['weight_to']; ?></td>
                          <td class="v"><?php echo $result_shippings['weight_from']; ?></td>
                          <td class="text-left"><?php echo $result_shippings['max_days']; ?></td>

                        </tr>
                      <?php } ?>
                      <?php } else { ?>
                      <tr>
                        <td class="text-center" colspan="12" style="text-align:center;"><?php echo $no_records_found; ?></td>
                      </tr>
                      <?php } ?>
              </tbody>

              </table>
            </div>
          </form>
<div class="row pagination">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right results"><?php echo $results; ?></div>
  </div>

        <?php } else { ?>
          <div class="text-danger">
            <?php echo $error_warning_authenticate; ?>
          </div>
        <?php } ?>

<?php echo $content_bottom; ?></div>
<?php }else{  echo "<h2 style='color:#F93D49;'>Please inform Admin</h2>";   } ?>
</div>
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

function clearfilter() {

  url = 'index.php?route=account/customerpartner/add_shipping_mod';

  location = url;
}
</script>
