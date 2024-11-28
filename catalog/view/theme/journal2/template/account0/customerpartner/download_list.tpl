<?php echo $header; ?>
<link type="text/css" href="catalog/view/theme/journal2/stylesheet/MP/journal2.css" rel="stylesheet"  />
<?php if($chkIsPartner){ ?>
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
  <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
    <h1 class="heading-title">
      <?php echo $heading_title; ?></h1>


<h2 class="secondary-title"><?php echo $text_downloadableItems; ?></h2>
  <div class="buttons">
    <div class="pull-left"><a href="<?php echo $insert; ?>" class="btn btn-default button"><i class="fa fa-plus"></i> <?php echo $button_insert; ?></a></div>
    <div class="pull-right">
      <a onclick="$('#form-download').submit();" class="btn btn-primary button"><i class="fa fa-trash-o"></i> <?php echo $button_delete; ?></a>
    </div>
  </div>
        <?php if($isMember) { ?>
          <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-download">
            <div class="table-responsive">
            <table class="table table-bordered table-hover list">
            <thead>
              <tr>
                <td width="1" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                <td class="text-left"><?php if ($sort == 'dd.name') { ?>
                  <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                  <?php } else { ?>
                  <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                  <?php } ?></td>
                  <td class="text-right"><?php echo $column_action; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php if ($downloads) { ?>
              <?php foreach ($downloads as $download) { ?>
              <tr>
                <td class="text-center"><?php if ($download['selected']) { ?>
                  <input type="checkbox" name="selected[]" value="<?php echo $download['download_id']; ?>" checked="checked" />
                  <?php } else { ?>
                  <input type="checkbox" name="selected[]" value="<?php echo $download['download_id']; ?>" />
                  <?php } ?></td>
                <td class="text-left"><?php echo $download['name']; ?></td>              
                <td class="text-right"><?php foreach ($download['action'] as $action) { ?>
                   <a data-toggle="tooltip" title="" class="btn btn-primary button" data-original-title="<?php echo $action['text']; ?>" href="<?php echo $action['href']; ?>"><i class="fa fa-pencil"></i></a> 
                  <?php } ?></td>
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
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
        <?php }else{  echo "<h2 style='color:#F93D49;'>Please inform Admin</h2>";   } ?>

      <?php echo $content_bottom; ?>
    </div>
  </div>
</div>   
<script type="text/javascript">
$('#form-download').submit(function(){
    if ($(this).attr('action').indexOf('delete',1) != -1) {
        if (!confirm('<?php echo $text_confirm; ?>')) {
            return false;
        }
    }
});
</script>
<?php echo $footer; ?>

