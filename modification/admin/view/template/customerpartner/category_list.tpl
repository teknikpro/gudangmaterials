<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<style type="text/css">
  @media screen and (max-width: 786px) {
    #productImage {
      width: 100%;
    }
    #preview-image-container {
      width: 100%;
    }
  }
</style>
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $insert; ?>" id="insert" data-toggle="tooltip" title="<?php echo $button_insert; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-product').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>

    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title; ?></h3>
      </div>

      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-seller"><?php echo $column_name; ?></label>
                <input type="text" name="filter_seller" value="<?php echo $filter_seller; ?>" placeholder="<?php echo $column_name; ?>" id="input-seller" class="form-control" />
              </div>
            </div>

            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-category"><?php echo $column_category_filter; ?></label>
                <input type="text" name="filter_category" value="<?php echo $filter_category; ?>" placeholder="<?php echo $column_category_filter; ?>" id="input-category" class="form-control" />
                <input type="hidden" name="filter_category_id" value="<?php echo $filter_category_id; ?>" />
              </div>
              <button type="button" onclick="clearfilter();" class="btn btn-danger pull-right"><i class="fa fa-search"></i> <?php echo $button_clear_filter; ?></button>
              <button type="button" onclick="filter();" class="btn btn-primary pull-right" style="margin-right: 5%;"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>

        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-product">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
    			        <td class="text-center"><?php echo $column_name; ?></td>
                  <td class="text-center"><?php echo $column_category; ?></td>
                  <td class="text-center"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($categories) { ?>
                  <?php foreach ($categories as $category) { ?>
                    <tr>
                      <td class="text-center">
                        <?php if ($category['selected']) { ?>
                        <input type="checkbox" name="selected[]" value="<?php echo $category['seller_id']; ?>" checked="checked" />
                        <?php } else { ?>
                        <input type="checkbox" name="selected[]" value="<?php echo $category['seller_id']; ?>" />
                        <?php } ?>
                      </td>
                      <td class="text-center"><?php echo $category['name']; ?></td>
                      <td class="text-center"><?php echo $category['category_id']; ?></td>
                      <td class="text-center">
                        <a href="<?php echo $category['action']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-edit"></i></a>
                      </td>
                    </tr>
                  <?php } ?>
                <?php } else { ?>
                  <tr>
                    <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
                  </tr>
                <?php } ?>
              </tbody>
        </table>
        </div>
      </form>

    <div class="row">
      <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
      <div class="col-sm-6 text-right"><?php echo $results; ?></div>
    </div>
  </div>
</div>

<div id="productPreviewModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog">
    <div class="modal-content">
    	<div class="modal-header">
    		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    		<h4><?php echo "Product Preview" ?></h4>
    	</div>
    	<div class="modal-body">
      	<div class="row">
          <div class="col-sm-6">
            <div class="img-thumbnail" id="preview-image-container">
              <img id="productImage" src="" >
            </div>
          </div>
          <div class="col-sm-6">
            <ul class="list-group">
              <li class="list-group-item" id="productName"></li>
              <li class="list-group-item" id="productModel"></li>
              <li class="list-group-item" id="ProductPrice"></li>
              <li class="list-group-item" id="productQuantity"></li>
              <li class="list-group-item" id="productAvailability"></li>
            </ul>
          </div>
        </div>
      </div>
    	<div class="modal-footer">
    		<div class="pull-right">
    			<button type="button" id="modalButton" class="btn btn-success cp-pro-status" cp-pro-id="">
    				<i class="fa fa-thumbs-o-up"></i>
    			</button>
    			<button class="btn btn-default" type="button" data-dismiss="modal">
    				<?php echo "close"; ?>
    			</button>
    		</div>
    	</div>
    </div>
  </div>
</div>


<script type="text/javascript"><!--
  function filter() {
  	url = 'index.php?route=customerpartner/category&token=<?php echo $token; ?>';

    var filter_seller = $('input[name=\'filter_seller\']').val();

    if (filter_seller) {
      url += '&filter_seller=' + encodeURIComponent(filter_seller);
    }

  	var filter_category = $('input[name=\'filter_category\']').val();

  	if (filter_category) {
  		url += '&filter_category=' + encodeURIComponent(filter_category);
  	}

  	var filter_category_id = $('input[name=\'filter_category_id\']').val();

  	if (filter_category_id) {
  		url += '&filter_category_id=' + encodeURIComponent(filter_category_id);
  	}

  	location = url;
  }
  function clearfilter() {
    url = 'index.php?route=customerpartner/category&token=<?php echo $token; ?>';
    location = url;
  }
//--></script>
<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
	if (e.keyCode == 13) {
		filter();
	}
});
//--></script>
<script type="text/javascript"><!--

$('input[name=\'filter_seller\']').autocomplete({
  delay: 0,
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=customerpartner/partner/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item.name,
            value: item.id
          }
        }));
      }
    });
  },
  select: function(item) {
    $('input[name=\'filter_seller\']').val(item.label);

    return false;
  },
  focus: function(item) {
      return false;
  }
});

$('input[name=\'filter_category\']').autocomplete({
  'source': function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
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
    $('input[name=\'filter_category\']').val(item['label']);
    $('input[name=\'filter_category_id\']').val(item['value']);
  }
});

//--></script>

<?php echo $footer; ?>
