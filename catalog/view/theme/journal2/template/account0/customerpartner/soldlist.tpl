<?php echo $header; ?>
<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
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
      <h1 class="heading-title"><?php echo $heading_title; ?></h1>
      <?php echo $content_top; ?>
      <div class="buttons">
        <div class="pull-right">
          <a href="<?php echo $back; ?>" class="btn btn-default button"><i class="fa fa-reply"></i> <?php echo $button_back; ?></a>
        </div>
      </div>
      <div class="content">
      <?php if($chkIsPartner){ ?>
        <fieldset>
          <h2 class="secondary-title"><?php echo $heading_title." ".$product_id; ?></h2>
          <?php if(!isset($access_error) && isset($isMember) && $isMember) { ?>
            <div class="table-responsive">
              <table class="table table-bordered table-hover list">
                <thead>
                  <tr>
                    <td class="text-center"><?php echo $entry_wkorder ?></td>
                    <td class="text-center"><?php echo $entry_wkcustomer ?></td>
                    <td class="text-center"><?php echo $entry_wkqty ?></td>
                    <td class="text-center"><?php echo $entry_wkprice ?></td>
                    <td class="text-center"><?php echo $entry_wksold ?></td>
                    <td class="text-center"><?php echo $entry_transaction_status ?></td>
                    <td class="text-center"></td>
                  </tr>
                </thead>
                <tbody>
                  <?php if($orders){ ?>    
                    <?php foreach($orders as $order) {?>
                      <tr>
                        <td class="text-center"><?php echo "#".$order['order_id'] ?></td>
                        <td class="text-center"><?php echo $order['name'] ?></td>
                        <td class="text-center"><?php echo $order['quantity']?></td>
                        <td class="text-center"><?php echo $order['price']; ?></td>
                        <td class="text-center"><?php echo $order['date_added'];?></td>
                        <td class="text-center"><?php echo $order['paid_status'];?></td>
                        <td class="text-center"> <a href="<?php echo $order['link'];?>" class="btn btn-primary button btn-xs" data-toggle="tooltip" title="<?php echo $text_invoice; ?>"> <i class="fa fa-eye"></i></a></td>
                      <tr>
                    <?php } ?>
                  <?php }else{ ?>
                    <tr>
                      <td colspan="7" class="text-center"></td>
                    </tr>
                  <?php } ?> 
                </tbody>
              </table>
              <div class="row pagination">
                <div class="col-sm-6 text-left links"><?php echo $pagination; ?></div>
                <div class="col-sm-6 text-right results"><?php echo $results; ?></div>
              </div>
            </div>
          <?php }else{ ?>
            <?php echo $text_access; ?>
          <?php } ?>
        </fieldset>
      <?php } ?>
      </div>
      <?php echo $content_bottom; ?></div>
    </div>
</div>
<?php echo $footer; ?>