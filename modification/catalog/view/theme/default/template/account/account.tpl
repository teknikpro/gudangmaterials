<?php echo $header; ?>

              <style type="text/css">
                .btn-success{
                  background-image: linear-gradient(to bottom, #62c462, #51a351);
                }
              </style>
          
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
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

              <?php if(isset($is_seller) && $is_seller){ ?>
                  <form class="form-horizontal" action="<?php echo $action;?>" method="post" id="form-mode">
                      <div>
                        <?php if (isset($marketplace_seller_mode) && $marketplace_seller_mode) { ?>
                         <input value="1" name="marketplace_seller_mode" data-toggle="toggle" data-on="<?php echo $text_mode_seller;?>" data-off="<?php echo $text_mode_customer;?>" data-onstyle="success" data-offstyle="danger" type="checkbox" class="form-control hide" checked>
                        <?php }else{?>
                         <input value="1" name="marketplace_seller_mode" data-toggle="toggle" data-on="<?php echo $text_mode_seller;?>" data-off="<?php echo $text_mode_customer;?>" data-onstyle="success" data-offstyle="danger" type="checkbox" class="form-control hide">
                        <?php } ?>
                      </div>
                  </form>
                  <br/>
              <?php } ?>
          
      <h2><?php echo $text_my_account; ?></h2>
      <ul class="list-unstyled">
        <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
        <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
        <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
        <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      </ul>
      <h2><?php echo $text_my_orders; ?></h2>
      <ul class="list-unstyled">
        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
        <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
        <?php if ($reward) { ?>
        <li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
        <?php } ?>
        <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
        <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
        <li><a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></li>
      </ul>
      <h2><?php echo $text_my_newsletter; ?></h2>
      <ul class="list-unstyled">
        <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
      </ul>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

              <script type="text/javascript">
                $('input[name=\'marketplace_seller_mode\']').on('change',function() {
                  $("#form-mode").submit();
                });
              </script>
          
<?php echo $footer; ?>
