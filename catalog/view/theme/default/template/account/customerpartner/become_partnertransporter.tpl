<?php echo $header; ?>
<div id="container" class="container j-container" =>
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

  <?php if ($success) { ?>
    <div class="alert alert-success success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
    <div class="alert alert-danger warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>

  <div class="row"><?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>


    <div id="content" class="<?php echo $class; ?>">
    <h1 class="secondary-title"><?php echo $heading_title; ?></h1>
      <?php echo $content_top; ?>
            
      <div class="content">
      <?php if($isMember) { ?>
        <?php if(!$in_process){  ?>          
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"  class="form-horizontal">
          <div class="buttons">
            <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default button"><?php echo $button_back; ?></a></div>
            <div class="pull-right">
              <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary button" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-shoppartner"><span data-toggle="tooltip" title="<?php echo $text_shop_name_info; ?>"><?php echo $text_shop_name; ?></span></label>
            <div class="col-sm-10">
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-search button"></i></span>
                <input name="shoppartner" value="<?php echo $shoppartner; ?>" placeholder="Shop name" id="input-shoppartner" class="form-control" style="width:auto;" type="text">
              </div>           

              <?php if ($error_shoppartner) { ?>
              <div class="text-danger"><?php echo $error_shoppartner; ?></div>
              <?php } ?>
            </div>
          </div>

          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-entry"><span data-toggle="tooltip" title="<?php echo $text_say_info; ?>"><?php echo $text_say; ?></span></label>
            <div class="col-sm-10">
              <textarea id="input-entry" name="description" class="form-control" rows="3"><?php echo $description; ?></textarea>
              <?php if ($error_description) { ?>
              <div class="text-danger"><?php echo $error_description; ?></div>
              <?php } ?>
            </div>
          </div>
        </form>

        <?php }else {?>             
          <div class="alert alert-info information"><i class="fa fa-exclamation-circle"></i> <?php echo $text_delay; ?></div>
        <?php } ?>
      <?php } else { ?>
        <div class="text-danger">
          <?php echo $error_warning_authenticate; ?>
        </div>
      <?php } ?>
    </div>
  </div>
</div>
</div>

<?php if(!$in_process){  ?>  
<script>
$( "#input-shoppartner" ).change(function() {
  thisshop = this;
  shop = $(thisshop).val();
  
  if(shop){

    jQuery(thisshop).prev().html('<i class="fa fa-spinner fa-spin"></i>');

    $.ajax({
           type: 'POST',
           data: ({shop: shop}),
           dataType: 'json',
           url: 'index.php?route=customerpartner/sell/wkmpregistation',
           success: function(data){     

              if(data['success']){
                jQuery(thisshop).prev().html('<span data-toggle="tooltip" class="text-success" title="<?php echo $text_avaiable; ?>"><i class="fa fa-thumbs-o-up"></i></span>');
              }else if(data['error']){
                jQuery(thisshop).prev().html('<span data-toggle="tooltip" class="text-danger" title="<?php echo $text_no_avaiable; ?>"><i class="fa fa-thumbs-o-down"></i></span>');
              }       
            
            }
        });
  }
});
</script>
<?php } ?>
<?php echo $footer; ?>
