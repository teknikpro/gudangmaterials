<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">

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
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-category">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-left"><?php echo $column_seller_name; ?></td>
                  <td class="text-left"><?php if ($sort == 'name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php if ($sort == 'sort_order') { ?>
                    <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                    <?php } ?></td>
                  <td class="text-center"><?php echo $column_status; ?></td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($categories) { ?>
                <?php foreach ($categories as $category) { ?>
                <tr>
                  <td class="text-left">
                    <?php if($partners){ ?>
                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon" style="width: auto;" data-toggle="tooltip" title="<?php echo $text_seller_info; ?>"><span class="fa fa-user"></span></span>
                          <input type="hidden" value="<?php echo $category['category_id']?>" />
                          <select class="form-control partner_change">
                            <option value="0"></option>
                          <?php foreach($partners as $partner){ ?>
                            <?php if($category['seller_id'] == $partner['customer_id']){ ?>
                              <option value="<?php echo $partner['customer_id'] ;?>" selected ><?php echo $partner['name'] ;?></option>
                            <?php }else{ ?>
                              <option value="<?php echo $partner['customer_id'] ;?>" ><?php echo $partner['name'] ;?></option>
                            <?php } ?>
                          <?php } ?>
                          </select>
                        </div>
                      </div>
                    <?php } ?>
                  </td>
                  <td class="text-left"><?php echo $category['name']; ?></td>
                  <td class="text-right"><?php echo $category['sort_order']; ?></td>
                  <td class="text-center">
                    <a data-toggle="tooltip" title="<?php echo $text_approve; ?>" class="btn btn-success <?php echo !$category['status'] ? 'cp-pro-status' : ''; ?>" <?php echo $category['status'] ? "disabled" : ""; ?> id="<?php echo $category['category_id']?>"><i class="fa fa-thumbs-o-up"></i></a>
                  </td>
                  <td class="text-right"><a href="<?php echo $category['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="5"><?php echo $text_no_results; ?></td>
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
  </div>
</div>

<script type="text/javascript">
	$('.cp-pro-status').on('click', function() {
    $('.alert').remove();

		var caller = $(this);

    var category_id = $(this).attr('id');

		$.ajax({
			url : 'index.php?route=customerpartner/sellercategory/approve&token=<?php echo $token; ?>',
      data: {category_id : category_id},
      method: 'post',
			dataType: 'json',
      beforeSend : function() {
        caller.attr('disabled',true).children('i').removeClass('fa-eye').addClass('fa-spinner fa-spin');
      },
			success: function(data) {
        caller.children('i').removeClass('fa-spinner fa-spin').addClass('fa-eye');
        if (data['success']) {
          $('.panel-default').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + data['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }
			},
		});
	});

  $('.partner_change').on('change', function() {
    $('.alert').remove();

    var caller = $(this);

    var category_id = $(this).siblings('input').val();

    var seller_id = $(this).val();

    $.ajax({
      url : 'index.php?route=customerpartner/sellercategory/changeSeller&token=<?php echo $token; ?>',
      data: {category_id : category_id, seller_id : seller_id},
      method: 'post',
      dataType: 'json',
      beforeSend : function() {
        caller.attr('disabled',true);
      },
      success: function(data) {
        caller.removeAttr('disabled');
        if (data['success']) {
          $('.panel-default').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + data['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }
      },
    });
  });
</script>

<?php echo $footer; ?>
