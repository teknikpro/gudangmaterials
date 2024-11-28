<?php echo $header; ?>
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

  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
  <?php echo $column_right; ?>
  <div id="content" class="<?php echo $class; ?>">
    <?php echo $content_top; ?>
    <h1 class="heading-title"><?php echo $heading_title; ?></h1>

      <h2 class="secondary-title"><?php echo $heading_title; ?></h2>
      <div class="buttons">
        <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default button"><i class="fa fa-reply"></i> Back</a></div>
        <div class="pull-right">
          <a href="<?php echo $insert; ?>" class="btn btn-primary button"><i class="fa fa-plus"></i> <?php echo $button_insert; ?></a>
          <a onclick="$('#form-product').submit();" class="btn btn-primary button" ><i class="fa fa-trash-o"></i> <?php echo $button_delete; ?></a>
        </div>
      </div>
      <?php if($isMember) { ?>

        <fieldset>
          <div class="form-horizontal row">
              <div class="pull-left" style="display:inline-block;margin-right:1%;">
                <div class="form-group">
                  <label class="control-label" for="input-id"><?php echo $column_name; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $column_name; ?>" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                    <label class="control-label" for="input-amount"><?php echo $column_price; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="filter_price" value="<?php echo $filter_price; ?>" placeholder="<?php echo $column_price; ?>" id="input-price" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label" for="input-details"><?php echo $column_status; ?></label>
                    <div>
                      <select name="filter_status" class="form-control" id="input-status" style="margin-left:-1%;">
                        <option value="*"></option>
                        <?php if ($filter_status) { ?>
                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_enabled; ?></option>
                        <?php } ?>
                        <?php if (!is_null($filter_status) && !$filter_status) { ?>
                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                        <?php } else { ?>
                        <option value="0"><?php echo $text_disabled; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                  </div>
              </div>

                <div class="pull-left" style="display:inline-block;margin-right:1%;">
                  <div class="form-group">
                    <label class="control-label" for="input-details"><?php echo $column_model; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="filter_model" value="<?php echo $filter_model; ?>" placeholder="<?php echo $column_model; ?>" id="input-model" class="form-control" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label" for="input-date"><?php echo $column_quantity; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="filter_quantity" value="<?php echo $filter_quantity; ?>" placeholder="<?php echo $column_quantity; ?>" id="input-model" class="form-control" />
                    </div>
                  </div>


                  <div class="form-group">
                    <div class="pull-right" >
                      <a onclick="filter();" class="btn btn-primary button"><?php echo $button_filter; ?></a>
                    </div>
                  </div>
                </div>
            </fieldset>

      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-product">
        <div class="table-responsive">
        <table class="table table-bordered table-hover list">
            <thead>
              <tr>
                <td width="1" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>

                <td class="text-left" style="min-width:175px;"><?php if ($sort == 'pd.name') { ?>
                  <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><font size="3" style="color:#FFFFFF"><?php echo str_replace(' ', '', $column_name); ?></font></a>
                  <?php } else { ?>
                  <a href="<font size="3" style="color:#FFFFFF"><?php echo $sort_name; ?>"><?php echo str_replace(' ', '', $column_name); ?></font></a>
                  <?php } ?></td>
                <td class="text-left"><?php if ($sort == 'p.model') { ?>
                  <a href="<?php echo $sort_model; ?>" class="<?php echo strtolower($order); ?>"><font size="3" style="color:#FFFFFF"><?php echo $column_model; ?></font></a>
                  <?php } else { ?>
                  <a href="<?php echo $sort_model; ?>"><font size="3" style="color:#FFFFFF"><?php echo $column_model; ?></font></a>
                  <?php } ?></td>
                <td class="text-left"><?php if ($sort == 'p.price') { ?>
                  <a href="<?php echo $sort_price; ?>" class="<?php echo strtolower($order); ?>"><font size="3" style="color:#FFFFFF"><?php echo $column_price; ?></font></a>
                  <?php } else { ?>
                  <a href="<?php echo $sort_price; ?>"><font size="3" style="color:#FFFFFF"><?php echo $column_price; ?></font></a>
                  <?php } ?></td>
                <td class="text-right"><?php if ($sort == 'p.quantity') { ?>
                  <a href="<?php echo $sort_quantity; ?>" class="<?php echo strtolower($order); ?>"><font size="3" style="color:#FFFFFF"><?php echo $column_quantity; ?></font></a>
                  <?php } else { ?>
                  <a href="<?php echo $sort_quantity; ?>"><font size="3" style="color:#FFFFFF"><?php echo $column_quantity; ?></font></a>
                  <?php } ?></td>
                <!-- membership codes starts here -->
                 <?php if(isset($wk_seller_group_status)) { ?>
                  <td class="text-left"><?php if ($sort == 'p.status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><font size="3" style="color:#FFFFFF"><?php echo $column_status; ?></font></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><font size="3" style="color:#FFFFFF"><?php echo $column_status; ?></font></a>
                    <?php } ?>
                  </td>
                <?php } else { ?>
                  <td class="text-left"><?php if ($sort == 'p.status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><font size="3" style="color:#FFFFFF"><?php echo $column_status; ?></font></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><font size="3" style="color:#FFFFFF"><?php echo $column_status; ?></font></a>
                    <?php } ?>
                  </td>
                <?php } ?>
                 <!-- membership codes ends here -->
                <td class="text-right"><?php echo $column_sold; ?></td>
                <td class="text-right"><?php echo $column_earned; ?></td>
                <td class="text-right"><?php echo $column_action; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php if ($products) { ?>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="text-center"><?php if ($product['selected']) { ?>
                  <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" checked="checked" />
                  <?php } else { ?>
                  <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" />
                  <?php } ?></td>
                <td class="text-left">
                  <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['thumb']; ?>" style="padding: 1px; border: 1px solid #DDDDDD; float: left;" class="img-thumbnail" />
                  &nbsp;
                  <?php if($product['status']){ ?>
                    <a href="index.php?route=product/product&product_id=<?php echo $product['product_id']; ?>"> <u><font size="2" style="color:#F97001"><?php echo $product['name']; ?></font></u></a>
                  <?php }else{ ?>
                    <u><font size="2" style="color:#F97001"><?php echo $product['name']; ?></u></font>
                  <?php } ?>

                </td>

                <td class="text-left"><?php echo $product['model']; ?></td>
                <td class="text-left"><?php if ($product['special']) { ?>
                  <span style="text-decoration: line-through;"><?php echo $product['price']; ?></span><br/>
                  <span class="text-danger"><?php echo $product['special']; ?></span>
                  <?php } else { ?>
                  <?php echo $product['price']; ?>
                  <?php } ?></td>
                <td class="text-right"><?php if ($product['quantity'] <= 0) { ?>
                  <span class="label label-warning"><?php echo $product['quantity']; ?></span>
                  <?php } elseif ($product['quantity'] <= $low_stock_quantity) { ?>
                  <span class="label label-danger"><?php echo $product['quantity']; ?></span>
                  <?php } else { ?>
                  <span class="label label-success"><?php echo $product['quantity']; ?></span>
                  <?php } ?></td>

                 <!-- Membership code -->
                <?php $status = 'Undefined status'; ?>
                <?php if(isset($wk_seller_group_status)) { ?>
                  <?php if($product['current_status'] == 'active') {
                    $bg_color = 'text-success bg-success';
                    $status = 'active';
                  } else if($product['current_status'] == 'inactive') {
                    $bg_color = 'text-warning bg-warning';
                    $status = 'In-active';
                  } else if($product['current_status'] == 'expired') {
                    $bg_color = 'text-info bg-info';
                    $status = 'Expired';
                  } else if($product['current_status'] == 'disabled') {
                    $bg_color = 'text-danger bg-danger';
                    $status = $text_disabled;
                  } ?>

                  <td class="text-left <?php echo $bg_color; ?>">
                    <?php echo $status; ?>
                  </td>

                <?php }else{?>
                <td class="text-left"><?php echo $product['status'] ? $text_enabled : $text_disabled ; ?></td>
                <?php } ?>
                <!--  -->

                <td class="text-right">
                  <a <?php if($product['sold']){ ?> href="<?php echo $product['soldlink']; ?>" <?php } ?> style="text-decoration:none;" />
                    <?php if ($product['sold'] <= 0) { ?>
                    <span class="label label-danger"><?php echo $product['sold']; ?></span>
                    <?php } elseif ($product['sold'] <= 5) { ?>
                    <span class="label label-warning" data-toggle="tooltip" title="<?php echo $text_soldlist_info; ?>"><?php echo $product['sold']; ?></span>
                    <?php } else { ?>
                    <span class="label label-success" data-toggle="tooltip" title="<?php echo $text_soldlist_info; ?>"><?php echo $product['sold']; ?></span>
                    <?php } ?></td>
                  </a>
                </td>
                <td class="text-right">
                  <span class="text-success"><?php echo $product['totalearn']; ?></span>
                </td>

                               <!-- membership codes starts here -->
                <td class="text-right">
                  <?php if(isset($wk_seller_group_status)) { ?>
                  <div class="btn-group">
                    <?php if($product['action']) { ?>
                      <?php foreach ($product['action'] as $action) { ?>
                        <a <?php if($product['current_status'] == 'expired') { echo "href='" . $action['href_relist'] . "'"; } ?> class="btn btn-primary relist-button button" <?php if($product['current_status'] != 'expired') { echo 'disabled'; } ?>>
                          <span data-toggle="tooltip" title="<?php echo $action['text_relist']; ?>">
                            <i class="fa fa-refresh"></i>
                          </span>
                        </a>
                        <?php if(isset($wk_seller_group_publish_unpublish_product) && $wk_seller_group_publish_unpublish_product) { ?>
                          <?php if($product['current_status'] == 'inactive') { ?>
                            <a <?php echo "href='" . $action['href_publish'] . "'" ?> class="btn btn-success">
                              <span data-toggle="tooltip" title="<?php echo $action['text_publish']; ?>">
                                <i class="fa fa-thumbs-o-up"></i>
                              </span>
                            </a>
                          <?php } else { ?>
                            <a <?php if($product['current_status'] != 'inactive') { echo "href='" . $action['href_unpublish'] . "'"; } ?> class="btn btn-danger button">
                              <span data-toggle="tooltip" title="<?php echo $action['text_unpublish']; ?>">
                                <i class="fa fa-thumbs-o-down"></i>
                              </span>
                            </button>
                          <?php } ?>
                        <?php } ?>
                        <a href="<?php echo $action['href_clone']; ?>" class="btn btn-default button" <?php if($product['current_status'] == 'expired' || $product['current_status'] == 'disabled') { echo 'disabled'; } ?>>
                          <span data-toggle="tooltip" title="<?php echo $action['text_clone_product']; ?>">
                            <i class="fa fa-copy"></i>
                          </span>
                        </a>
                        <a <?php if($product['current_status'] != 'expired') { echo "href='" . $action['href_edit'] . "'"; } ?> class="btn btn-edit button" <?php if($product['current_status'] == 'expired' || $product['current_status'] == 'disabled') { echo 'disabled'; } ?> >
                          <span data-toggle="tooltip" title="<?php echo $action['text_edit']; ?>">
                            <i class="fa fa-pencil"></i>
                          </span>
                        </a>
                      <?php } ?>
                    <?php } ?>
                    </div>
                  <?php } else if($product['action']) { ?>
                      <?php foreach ($product['action'] as $action) { ?>
                        <a href="<?php echo $action['href']; ?>" class="btn btn-info button"><span data-toggle="tooltip" title="<?php echo $action['text']; ?>"><i class="fa fa-pencil"></i></span></a>
                      <?php } ?>
                    <?php } ?>
                    <?php if(!$product['status']) { ?>
                        <br/><br/>
                        <a href="<?php echo $product['productPreviewLink']; ?>" target="_blank" class="btn btn-info button"><span data-toggle="tooltip" title="<?php echo $text_product_preview; ?>"><i class="fa fa-eye-slash"></i></span></a>
                    <?php } ?>
                </td>
                 <!-- membership codes ends here -->
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="text-center" colspan="10"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </form>
      <div class="row pagination">
        <div class="col-sm-6 text-left links"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right results"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
        <div class="text-danger">
          <?php echo $error_warning_authenticate; ?>
        </div>
      <?php } ?>


  </div>

  </div>
</div>
<script type="text/javascript"><!--

$('#form-product').submit(function(){
    if ($(this).attr('action').indexOf('delete',1) != -1) {
        if (!confirm('<?php echo $text_confirm; ?>')) {
            return false;
        }
    }
});

function filter() {
  url = 'index.php?route=account/customerpartner/productlist';

  var filter_name = $('input[name=\'filter_name\']').val();

  if (filter_name) {
    url += '&filter_name=' + encodeURIComponent(filter_name);
  }

  var filter_model = $('input[name=\'filter_model\']').val();

  if (filter_model) {
    url += '&filter_model=' + encodeURIComponent(filter_model);
  }

  var filter_price = $('input[name=\'filter_price\']').val();

  if (filter_price) {
    url += '&filter_price=' + encodeURIComponent(filter_price);
  }

  var filter_quantity = $('input[name=\'filter_quantity\']').val();

  if (filter_quantity) {
    url += '&filter_quantity=' + encodeURIComponent(filter_quantity);
  }

  var filter_status = $('select[name=\'filter_status\']').val();

  if (filter_status != '*') {
    url += '&filter_status=' + encodeURIComponent(filter_status);
  }

  location = url;
}
//--></script>
<script type="text/javascript"><!--
$('.row input').keydown(function(e) {
  if (e.keyCode == 13) {
    filter();
  }
});
//--></script>
<script type="text/javascript"><!--
$('input[name=\'filter_name\']').autocomplete({
  delay: 500,
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=customerpartner/autocomplete/product&filter_type=customerpartner_&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item.name,
            value: item.product_id
          }
        }));
      }
    });
  },
  select: function(item) {
    $('input[name=\'filter_name\']').val(item.label);
    return false;
  },
  focus: function(item) {
    return false;
  }
});

$('input[name=\'filter_model\']').autocomplete({
  delay: 500,
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=customerpartner/autocomplete/product&filter_type=customerpartner_&filter_model=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item.model,
            value: item.product_id
          }
        }));
      }
    });
  },
  select: function(item) {
    $('input[name=\'filter_model\']').val(item.label);
    return false;
  },
  focus: function(item) {
    return false;
  }
});
//--></script>
<?php echo $footer; ?>
