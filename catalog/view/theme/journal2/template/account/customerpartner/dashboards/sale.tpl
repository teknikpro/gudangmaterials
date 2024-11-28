<style type="text/css">
  .popover{
    color: #666;
  }
</style>

<div class="row low_stock_row">
  <div class="wk_lowstock_header">
    <div class="wk_lowstock_icon">
      <img src="image/MP/sales.png">
    </div>
    <div class="wk_lowstock_title"><?php echo $heading_title; ?></div>
  </div>
  <div class="wk_lowstock_footer">
    <div class="wk_lowstock_quantity" id="popover" data-toggle="popover" data-trigger="hover"><?php echo $percentage; ?>%</div>
    <div class="wk_lowstock_more">
      <a href="<?php echo $sale; ?>"><?php echo $text_view; ?></a>
    </div>
  </div>
</div>

<script type="text/javascript">
  $('#toggle-order').on('click',function(){
    $('a[href="#tab-order"]').trigger('click');
  })

  jQuery(document).ready(function(){
    html = '';
    html += '<table class="table">';
    html += '<tr><td>Seller Amount</td><td><?php echo $seller_amount; ?></td></tr>';
    html += '<tr><td>Admin Amount</td><td><?php echo $admin_amount; ?></td></tr>';
    html += '<tr><td>Paid Amount</td><td><?php echo $paid_amount; ?></td></tr>';
    html += '<tr><td>Payable Amount</td><td><?php echo $payable_amount; ?></td></tr>';
    html += '</table>';
    $("#popover").tooltip({
        title: html,
        html: true,
    });
  })
</script>
