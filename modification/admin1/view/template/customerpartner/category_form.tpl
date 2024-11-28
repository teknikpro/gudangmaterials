<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-commission" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>

      <div class="panel-body">
        <form action="<?php echo $save; ?>" method="post" enctype="multipart/form-data" id="form-commission" class="form-horizontal">
          <div class="form-group <?php if(isset($sellers) && $sellers) { ?>hide<?php } ?>" >
            <label class="col-sm-2 control-label"><?php echo $entry_seller; ?></label>
            <div class="col-sm-10">
              <input type="text" name="seller" value="" placeholder="<?php echo $entry_seller; ?>" id="input-seller" class="form-control" />
              <div id="seller_ids" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php if(isset($sellers) && $sellers) {
                  foreach ($sellers as $seller) { ?>
                    <div id="seller_ids<?php echo $seller['seller_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $seller['name']; ?>
                      <input type="hidden" name="seller_ids[]" value="<?php echo $seller['seller_id']; ?>" />
                    </div>
                  <?php }
                } ?>
              </div>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_category; ?></label>
            <div class="col-sm-10">
              <input type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" />
              <div id="product-category" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php if(isset($product_categories) && $product_categories) {
                  foreach ($product_categories as $product_category) { ?>
                    <div id="product-category<?php echo $product_category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_category['name']; ?>
                      <input class="allowed_categories" type="hidden" name="product_category[]" value="<?php echo $product_category['category_id']; ?>" />
                    </div>
                  <?php }
                } ?>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">

  // seller
  $('input[name=\'seller\']').autocomplete({
    'source': function(request, response) {
      $.ajax({
        url: 'index.php?route=customerpartner/partner/autocomplete&token=<?php echo $token; ?>&filter_category=1&filter_name=' +  encodeURIComponent(request),
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            return {
              label: item['name'],
              value: item['id']
            }
          }));
        }
      });
    },
    'select': function(item) {
      $('input[name=\'seller\']').val('');

      $('#seller_ids' + item['value']).remove();

      $('#seller_ids').append('<div id="seller_ids' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="seller_ids[]" value="' + item['value'] + '" /></div>');
    }
  });

  $('#seller_ids').delegate('.fa-minus-circle', 'click', function() {
    $(this).parent().remove();
  });

  // Allowed Seller Category
  var allowed_categories = [];
  $('input[name = \'category\']').on('click', function(){

    allowed_categories = [];
    $('.allowed_categories').each(function(){
      allowed_categories.push($(this).val());
    });
  });

  // Category
  $('input[name=\'category\']').autocomplete({
    'source': function(request, response) {
      $.ajax({
        url: 'index.php?route=customerpartner/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
        type: 'post',
        dataType: 'json',
        data: {allowed_categories},
        success: function(json) {
          response($.map(json, function(item) {
            return {
              label: item['name'],
              value: item['category_id']
            }
          }));
        }
      });
    },
    'select': function(item) {
      $('input[name=\'category\']').val('');

      $('#product-category' + item['value']).remove();

      $('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input class="allowed_categories" type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');
    }
  });

  $('#product-category').delegate('.fa-minus-circle', 'click', function() {
    $(this).parent().remove();
  });
</script>
<style>
  .dropdown-menu{
    height: 200px;
    overflow: auto;
  }
</style>
<?php echo $footer; ?>
