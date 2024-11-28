<?php echo $header; ?>
<style>
  .col-sm-4{
    width: 33.33%;
  }

  .dropdown-menu {
    position: absolute !important;
  }
</style>
<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>

  <?php if($success){ ?>
    <div class="alert alert-success success"><i class="fa fa-check-circle"></i> <?php echo $success; ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>
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
      <h1 class="heading-title"><?php echo $heading_title; ?></h1>
      <div class="buttons">
        <div class="pull-right">
          <?php if($marketplace_sellereditreview){ ?>
            <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger button" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-review').submit() : false;"><i class="fa fa-trash-o"></i></button>
          <?php } ?>
        </div>
      </div>
      <?php echo $content_top; ?>
      <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <h2 class="secondary-title"><?php echo $heading_title; ?></h2>
          <?php if($chkIsPartner){ ?>
            <div class="well">
              <div class="row" style="display:inline-flex;">
                <div class="col-sm-4">
                  <div class="form-group">
                    <label class="control-label" for="input-author"><?php echo $entry_customer; ?></label>
                    <input type="text" name="filter_customer" value="<?php echo $filter_customer; ?>" placeholder="<?php echo $entry_customer; ?>" id="input-author" class="form-control" />
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="form-group">
                    <label class="control-label" style="margin-left:15%;" for="input-status"><?php echo $entry_status; ?></label>
                    <select name="filter_status" id="input-status" class="form-control">
                      <option value="*"></option>
                      <?php if ($filter_status) { ?>
                      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                      <?php } else { ?>
                      <option value="1"><?php echo $text_enabled; ?></option>
                      <?php } ?>
                      <?php if (!$filter_status && !is_null($filter_status)) { ?>
                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                      <?php } else { ?>
                      <option value="0"><?php echo $text_disabled; ?></option>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="form-group">
                    <label class="control-label" for="input-date-added"><?php echo $entry_createdate; ?></label>
                    <div class="input-group date">
                      <input type="text" name="filter_createdate" value="<?php echo $filter_createdate; ?>" placeholder="<?php echo $entry_createdate; ?>" data-date-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default button"><i class="fa fa-calendar"></i></button>
                      </span></div>
                  </div>
                  <button type="button" id="button-filter" class="btn btn-primary pull-right button"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
                  <button type="button" onclick="clearfilter();" class="btn btn-danger pull-right button" style="margin-right:5%;margin-top:15px;"><i class="fa fa-search"></i> <?php echo $button_clear_filter; ?></button>
                </div>
              </div>
            </div>
            <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-review">
              <div class="table-responsive">
                <table class="table table-bordered table-hover list">
                  <thead>
                    <tr>
                      <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                      <td class="text-left"><?php if ($sort == 'r.author') { ?>
                        <a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_customer; ?></a>
                        <?php } else { ?>
                        <a href="<?php echo $sort_customer; ?>"><?php echo $column_customer; ?></a>
                        <?php } ?></td>
                      <td class="text-left"><?php if ($sort == 'r.status') { ?>
                        <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                        <?php } else { ?>
                        <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                        <?php } ?></td>
                      <td class="text-left"><?php if ($sort == 'r.createdate') { ?>
                        <a href="<?php echo $sort_createdate; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_createdate; ?></a>
                        <?php } else { ?>
                        <a href="<?php echo $sort_createdate; ?>"><?php echo $column_createdate; ?></a>
                        <?php } ?></td>
                      <td class="text-right"><?php echo $column_action; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php if ($reviews) { ?>
                    <?php foreach ($reviews as $review) { ?>
                    <tr>
                      <td class="text-center"><?php if (in_array($review['review_id'], $selected)) { ?>
                        <input type="checkbox" name="selected[]" value="<?php echo $review['review_id']; ?>" checked="checked" />
                        <?php } else { ?>
                        <input type="checkbox" name="selected[]" value="<?php echo $review['review_id']; ?>" />
                        <?php } ?></td>
                      <td class="text-left"><?php echo $review['customer_name']; ?></td>
                      <td class="text-left"><?php echo $review['status']; ?></td>
                      <td class="text-left"><?php echo $review['createdate']; ?></td>
                      <td class="text-right"><a href="<?php echo $review['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary button"><i class="fa fa-pencil"></i></a></td>
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
              <div class="alert alert-danger warning"><i class="fa fa-exclamation-circle"></i><?php echo $warning_become_seller; ?><button type="button" class="close" data-dismiss="alert">×</button> </div>
            <?php } ?>
        </fieldset>
      </form>
      </div>
      </div>
    </div>
</div>
<script type="text/javascript"><!--

function clearfilter() {
  url = 'index.php?route=account/customerpartner/review';
  location = url;
}

$('#button-filter').on('click', function() {
url = 'index.php?route=account/customerpartner/review';

var filter_customer = $('input[name=\'filter_customer\']').val();

if (filter_customer) {
  url += '&filter_customer=' + encodeURIComponent(filter_customer);
}

var filter_status = $('select[name=\'filter_status\']').val();

if (filter_status != '*') {
  url += '&filter_status=' + encodeURIComponent(filter_status);
}

var filter_createdate = $('input[name=\'filter_createdate\']').val();

if (filter_createdate) {
  url += '&filter_createdate=' + encodeURIComponent(filter_createdate);
}

location = url;
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
pickTime: false
});
//--></script>
<script>
  $('input[name=\'filter_customer\']').autocomplete({
  'source': function(request, response) {
    $.ajax({
      url: 'index.php?route=account/customerpartner/review/autocomplete&filter_customer=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['customer_id']
          }
        }));
      }
    });
  },
  'select': function(item) {
    $('input[name=\'filter_customer\']').val(item['label']);
  }
});
</script>
<?php echo $footer; ?>
