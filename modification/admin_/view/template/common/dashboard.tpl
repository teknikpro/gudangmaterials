<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_install) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_install; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="row">
      <div class="col-lg-3 col-md-3 col-sm-6"><?php echo $order; ?></div>
      <div class="col-lg-3 col-md-3 col-sm-6"><?php echo $sale; ?></div>
      <div class="col-lg-3 col-md-3 col-sm-6"><?php echo $customer; ?></div>
      <div class="col-lg-3 col-md-3 col-sm-6"><?php echo $online; ?></div>
    </div>
    <div class="row">
      <div class="col-lg-6 col-md-12 col-sx-12 col-sm-12"><?php echo $map; ?></div>
      <div class="col-lg-6 col-md-12 col-sx-12 col-sm-12"><?php echo $chart; ?></div>
    </div>
    <div class="row">
      <div class="col-lg-4 col-md-12 col-sm-12 col-sx-12"><?php echo $activity; ?></div>
      <div class="col-lg-8 col-md-12 col-sm-12 col-sx-12"> <?php echo $recent; ?> </div>
    </div>
  </div>
</div>

<script type="text/javascript"><!--   
// Login to the API
$.ajax({
	url: 'index.php?route=common/hp_validate/storeauth&token=<?php echo $token; ?>',
	type: 'post',
	dataType: 'json',
	crossDomain: true,
	success: function(json) {
		$('.alert').remove();
            if (json['error'] && json['error']['domain']) {
                json['error']['domain'].forEach(function(item, index) {
    			$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + item + ' <a href="'+ json['link'][index] +'" id="button-validate-store" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger btn-xs pull-right"><i class="fa fa-plus"></i> '+ json['button_validate_store'] +'</a></div>');
                });
    		}
	},
	error: function(xhr, ajaxOptions, thrownError) {
		// alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	}
});
//--></script>


<script type="text/javascript"><!--   
// Login to the API
$.ajax({
	url: 'index.php?route=common/hp_validate/storeauth&token=<?php echo $token; ?>',
	type: 'post',
	dataType: 'json',
	crossDomain: true,
	success: function(json) {
		$('.alert').remove();
            if (json['error'] && json['error']['domain']) {
                json['error']['domain'].forEach(function(item, index) {
    			$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + item + ' <a href="'+ json['link'][index] +'" id="button-validate-store" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger btn-xs pull-right"><i class="fa fa-plus"></i> '+ json['button_validate_store'] +'</a></div>');
                });
    		}
	},
	error: function(xhr, ajaxOptions, thrownError) {
		// alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	}
});
//--></script>
<?php echo $footer; ?>