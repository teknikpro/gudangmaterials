<?php echo $header; ?><?php echo $separate_column_left; ?>
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
    <div class="alert alert-danger"><i class="fa fa-check-circle"></i> <?php echo $error_warning; ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>
  <?php } ?>
  <?php if($success){ ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>
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
      <?php if($chkIsPartner){ ?>
      <h1><?php echo $heading_title; ?>
        <div class="pull-right">
          <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
          <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-information').submit() : false;"><i class="fa fa-trash-o"></i></button>
        </div>
      </h1>
      <div class="well">
        <div class="row">
          <div class="col-sm-5">
            <div class="form-group">
                <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $column_name; ?>" id="input-name" class="form-control" />
            </div>
          </div>

          <div class="col-sm-5">
            <div class="form-group">
              <select name="filter_status" class="form-control" id="input-status">
                <option value="*"><?php echo $column_status; ?></option>
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

          <div class="col-sm-1">
            <div class="form-group">
              <a onclick="filter();" class="btn btn-primary pull-right"><?php echo $button_filter; ?></a>
            </div>
          </div>
          <div class="col-sm-1">
            <div class="form-group">
              <a onclick="clearfilter();" class="btn btn-danger pull-right"><?php echo $button_clear_filter; ?></a>
            </div>
          </div>
        </div>
      </div> 
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-information">
        <div class="table-responsive">
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                <td class="text-left"><?php if ($sort == 'id.title') { ?>
                  <a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_title; ?></a>
                  <?php } else { ?>
                  <a href="<?php echo $sort_title; ?>"><?php echo $column_title; ?></a>
                  <?php } ?></td>
                <td class="text-left"><?php echo $entry_status; ?></td>
                <td class="text-right"><?php if ($sort == 'i.sort_order') { ?>
                  <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                  <?php } else { ?>
                  <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                  <?php } ?></td>
                <td class="text-right"><?php echo $column_action; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php if (isset($informations) && $informations) { ?>
              <?php foreach ($informations as $information) { ?>
              <tr>
                <td class="text-center"><?php if (in_array($information['information_id'], $selected)) { ?>
                  <input type="checkbox" name="selected[]" value="<?php echo $information['information_id']; ?>" checked="checked" />
                  <?php } else { ?>
                  <input type="checkbox" name="selected[]" value="<?php echo $information['information_id']; ?>" />
                  <?php } ?></td>
                <td class="text-left"><?php echo $information['title']; ?></td>
                <td class="text-left"><?php echo $information['status'] ? $text_enabled : $text_disabled; ?></td>
                <td class="text-right"><?php echo $information['sort_order']; ?></td>
                <td class="text-right"><a href="<?php echo $information['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
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
      <?php }else{ ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i><?php echo $warning_become_seller; ?><button type="button" class="close" data-dismiss="alert">×</button> </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--

function filter() {
  url = 'index.php?route=account/customerpartner/information';

  var filter_name = $('input[name=\'filter_name\']').val();

  if (filter_name) {
    url += '&filter_name=' + encodeURIComponent(filter_name);
  }

  var filter_status = $('select[name=\'filter_status\']').val();

  if (filter_status != '*') {
    url += '&filter_status=' + encodeURIComponent(filter_status);
  }

  location = url;
}

function clearfilter() {
    url = 'index.php?route=account/customerpartner/information';
    location = url;
  }
//--></script>
<?php echo $footer; ?>
