<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
      <div class="pull-right">
          <select id="order_access" class="form-control" style="display: inline-block;width: auto;">
            <option value="0"><?php echo $text_access; ?></option>
            <option value="1"><?php echo $text_notaccess; ?></option>
          </select>
          <button id="button_access" class="btn btn-primary" data-toggle="tooltip" title="<?php echo $button_save; ?>"><i class="fa fa-save"></i></button>
          <a href="<?php echo $cancel;?>" class="btn btn-danger" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"><?php echo $button_cancel;?></a>
       </div>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> Konfirmasi Ongkos Kirim</h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <center><h3 class="panel-title">Daftar Pra Order Customer</h3></center>
          </div>
        </div>
        <form method="post" enctype="multipart/form-data" id="form-order" action="<?php echo $access;?>">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-right">
                  Nomor
                  </td>
                  <td class="text-left">
                  Tanggal
                  </td>
                  <td class="text-left">
                  Nama Customer
                  </td>
                  <td class="text-left">
                  Status
                  </td>
                  <td class="text-left">
                    Action
                  </td>
                </tr>
              </thead>
              <tbody>
                <?php if ($orders) { ?>
                <?php $i = 1; ?>
                <?php foreach ($orders as $order) { ?>
                <tr>
                  <td class="text-right"><?php echo $i++; ?></td>
                  <td class="text-left"><?php echo $order['date_added']; ?></td>
                  <td class="text-left"><?php echo $order['firstname']; ?> <?php echo $order['lastname']; ?></td>
                  <td class="text-left">
                    <?php if($order['approve'] == 1) { ?> 
                      <button class="btn btn-warning">Belum Dihitung</button>
                    <?php }else { ?>
                      <button class="btn btn-success">Sudah Dihitung</button>
                    <?php } ?>
                  </td>
                  <td class="text-center">
										<a href="<?= $order['detail']; ?>" class="btn btn-primary" >
											Detail
										</a>
									</td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="9"><?php echo $text_no_results; ?></td>
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
  <script type="text/javascript"><!--

  $("#button_access").on('click', function(){

     var url = $('#form-order').attr('action');

     var tmpurl = url+ "&seller_access=" + $('#order_access').val();

     $('#form-order').attr('action', tmpurl);

     $('#form-order').submit();

  });

  $('#button-filter').on('click', function() {
    url = 'index.php?route=customerpartner/order&token=<?php echo $token; ?>';

    var filter_order_id = $('input[name=\'filter_order_id\']').val();

    if (filter_order_id) {
      url += '&filter_order_id=' + encodeURIComponent(filter_order_id);
    }

    var filter_customer = $('input[name=\'filter_customer\']').val();

    if (filter_customer) {
      url += '&filter_customer=' + encodeURIComponent(filter_customer);
    }

    var filter_order_status = $('select[name=\'filter_order_status\']').val();

    if (filter_order_status != '*') {
      url += '&filter_order_status=' + encodeURIComponent(filter_order_status);
    }

    var filter_order_access = $('select[name=\'filter_order_access\']').val();

    if (filter_order_access != '*') {
      url += '&filter_order_access=' + encodeURIComponent(filter_order_access);
    }

    var filter_total = $('input[name=\'filter_total\']').val();

    if (filter_total) {
      url += '&filter_total=' + encodeURIComponent(filter_total);
    }

    var filter_date_added = $('input[name=\'filter_date_added\']').val();

    if (filter_date_added) {
      url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
    }

    var filter_date_modified = $('input[name=\'filter_date_modified\']').val();

    if (filter_date_modified) {
      url += '&filter_date_modified=' + encodeURIComponent(filter_date_modified);
    }

    location = url;
  });
//--></script>
<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="all" />
<script type="text/javascript"><!--
$('.date').datetimepicker({
  pickTime: false
});
//--></script></div>
<?php echo $footer; ?>
