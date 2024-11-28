<?php echo $header; ?>
<style>
  table{
    color: black;
  }
</style>
<link type="text/css" href="catalog/view/theme/journal2/stylesheet/MP/journal2.css" rel="stylesheet"  />
<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>

 <?php echo $column_right; ?>
  <?php if ($error_warning) { ?>
    <div class="alert alert-danger warning"><i class="fa fa-exclamation-circle"></i><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
    <div class="alert alert-success success"><i class="fa fa-check-circle"> </i> <?php echo $success; ?></div>
  <?php } ?>

  <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
    <h1 class="heading-title">
      <?php echo $heading_title; ?></h1>


    <h2 class="secondary-title"><?php echo $text_transactionList; ?></h2>
      <?php if($isMember) { ?>

            <fieldset>
          <div class="form-horizontal row">
              <div class="pull-left" style="display:inline-block;margin-right:1%;">
                <div class="form-group">
                  <label class="control-label" for="input-id"><?php echo $entry_id; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="filter_id" value="<?php echo $filter_id; ?>" placeholder="<?php echo $text_transactionId; ?>" id="input-id" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                    <label class="control-label" for="input-amount"><?php echo $entry_amount; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="filter_amount" value="<?php echo $filter_amount; ?>" placeholder="<?php echo $text_transactionAmount; ?>" id="input-amount" class="form-control" />
                    </div>
                </div>
              </div>

                <div class="pull-left" style="display:inline-block;margin-right:1%;">
                <div class="form-group">
                  <label class="control-label" for="input-details"><?php echo $entry_details; ?></label>
                  <div class="col-sm-10">
                  <input type="text" name="filter_details" value="<?php echo $filter_details; ?>" placeholder="<?php echo $text_transactionDetails; ?>" id="input-details" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label" for="input-date"><?php echo $entry_date; ?></label>
                  <div class="col-sm-10">
                  <div style="display:inline-flex;" class="date">
                      <input type="text" name="filter_date" value="<?php echo $filter_date; ?>" data-date-format="YYYY-MM-DD" placeholder="<?php echo $text_transactionDate; ?>" id="input-date" class="form-control date" />
                      <span>
                        <button type="button" class="button" style="height:34px;"><i class="fa fa-calendar" style="margin-top:-10px;"></i></button>
                      </span>
                    </div>
                </div>
              </div>
              <div class="pull-right" style="width:10%;display:inline-block;">
                <a onclick="filter();" class="btn btn-primary button pull-right"><?php echo $button_filter; ?></a>
              </div>
              </div>

             </div>
            </fieldset>

        <form method="post" enctype="multipart/form-data" id="form-transaction">
        <div class="table-responsive">
        <table class="table table-bordered table-hover list">
          <thead>
            <tr>
              <td class="text-left">
                <?php if ($sort == 'ct.id') { ?>
                <a href="<?php echo $sort_id; ?>" class="<?php echo strtolower($order); ?>"><?php echo $entry_id; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_id; ?>"><?php echo $entry_id; ?></a>
                <?php } ?>
              </td>
              <td class="text-left">
                <?php if ($sort == 'ct.amount') { ?>
                <a href="<?php echo $sort_amount; ?>" class="<?php echo strtolower($order); ?>"><?php echo $entry_amount; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_amount; ?>"><?php echo $entry_amount; ?></a>
                <?php } ?>
              </td>

              <td class="text-left">
                <?php if ($sort == 'ct.details') { ?>
                <a href="<?php echo $sort_details; ?>" class="<?php echo strtolower($order); ?>"><?php echo $entry_details; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_details; ?>"><?php echo $entry_details; ?></a>
                <?php } ?>
              </td>
              <td class="text-left">
                <?php if ($sort == 'ct.date_added') { ?>
                <a href="<?php echo $sort_date; ?>" class="<?php echo strtolower($order); ?>"><?php echo $entry_date; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_date; ?>"><?php echo $entry_date; ?></a>
                <?php } ?>
              </td>
              <td class="text-left" >
                <a>Detail</a>
              </td>
            </tr>
          </thead>

          <tbody>
            <?php if ($transactions) { ?>
            <?php foreach ($transactions as $result) { ?>
              <tr>
                <td class="text-left" ><?php echo $result['id']; ?></td>
                <td class="text-left"><?php echo $result['value']; ?></td>
                <td class="text-left"><?php echo $result['details']; ?></td>
                <td class="text-left"><?php echo $result['date']; ?></td>
                <td class="text-left"><button type="button" class="btn btn-primary"><a class="text-white text-decoration-none" >Detail</></button></td>
              </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="text-center" colspan="4" style="text-align:center;"><?php echo $text_no_records; ?></td>
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

<script type="text/javascript">
$('.date').datetimepicker({
  pickTime: false
});

$('#form-transaction input').keydown(function(e) {
  if (e.keyCode == 13) {
    filter();
  }
});

function filter() {

  url = 'index.php?route=account/customerpartner/transaction';

  var filter_id = $('input[name=\'filter_id\']').val();

  if (filter_id) {
    url += '&filter_id=' + encodeURIComponent(filter_id);
  }

  var filter_date = $('input[name=\'filter_date\']').val();

  if (filter_date) {
    url += '&filter_date=' + encodeURIComponent(filter_date);
  }

  var filter_details = $('input[name=\'filter_details\']').val();

  if (filter_details) {
    url += '&filter_details=' + encodeURIComponent(filter_details);
  }

  var filter_amount = $('input[name=\'filter_amount\']').val();

  if (filter_amount) {
    url += '&filter_amount=' + encodeURIComponent(filter_amount);
  }

  location = url;
}
//--></script>
<?php echo $footer; ?>
