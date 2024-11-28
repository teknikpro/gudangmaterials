<?php echo $header; ?>
<style type="text/css">
  select{
    width:500px;
  }
</style>
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
        <div class="pull-left"><a href="<?php echo $cancel; ?>" class="btn btn-default button"><i class="fa fa-reply"></i><?php echo $button_cancel; ?></a></div>
        <div class="pull-right">
          <button type="submit" form="form-shipping" class="btn btn-primary button"><i class="fa fa-save"></i><?php echo $button_save; ?></button>
        </div>
      </div>
      <?php if($isMember) { ?>
        <div class="alert alert-info information"><i class="fa fa-exclamation-circle"></i> <?php echo $text_separator_info; ?>  <button type="button" class="close" data-dismiss="alert" style="right:30px;">&times;</button>
        </div>
    
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-shipping" class="form-horizontal">

          <?php if($shippingTable){ ?>
            <?php foreach ($shippingTable as $value) { ?>
              <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title=""><?php echo ucfirst(str_replace('_',' ',$value)); ?></span></label>

                  <div class="col-sm-10">
                    <select name="<?php echo $value; ?>" class="form-control">
                        <option value=""></option>
                        <?php foreach ($fields as $key => $field) { ?>
                          <option value="<?php echo $key; ?>" <?php if(strtolower($field) == strtolower($value)) echo 'selected'; ?> ><?php echo $field; ?></option>
                        <?php } ?>                        
                        </select>
                  </div>
                </div>
            <?php } ?>
          <?php } ?> 
                
        </form>
      <?php } else { ?>
        <div class="text-danger">
          <?php echo $error_warning_authenticate; ?>
        </div>
      <?php } ?>


    <?php echo $content_bottom; ?></div>
  </div>
  </div>
<?php echo $footer; ?>
