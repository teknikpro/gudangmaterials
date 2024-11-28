<?php echo $header; ?>

              <style type="text/css">
                .btn-success{
                  background-image: linear-gradient(to bottom, #62c462, #51a351);
                }
              </style>
          
<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><span itemprop="title"><?php echo $breadcrumb['text']; ?></span></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?><?php echo $column_right; ?>
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
          
      <h2 class="secondary-title"><?php echo $text_my_account; ?></h2>
      <div class="content my-account">
	  <font size="3" style="font-weight:normal; color: #FFFFFF;">
      <ul class="list-unstyled">
        <li><a href="<?php echo $edit; ?>"><?php echo ' ~ '; ?><?php echo $text_edit; ?></a></li>
        <li><a href="<?php echo $password; ?>"><?php echo ' ~ '; ?><?php echo $text_password; ?></a></li>
        <li><a href="<?php echo $address; ?>"><?php echo ' ~ '; ?><?php echo $text_address; ?></a></li>
       <li><a href="<?php echo $wishlist; ?>"><?php echo ' ~ '; ?><?php echo $text_wishlist; ?></a></li>
	   <li><a href="<?php echo $compare; ?>"><?php echo ' ~ '; ?><?php echo "Lihat perbandingan produk"; ?></a></li>
      </ul></font>
      </div>
      <?php if (isset($credit_cards) && $credit_cards) { ?>
      <h2><?php echo $text_credit_card; ?></h2>
      <ul class="list-unstyled">
        <?php foreach ($credit_cards as $credit_card) { ?>
        <li><a href="<?php echo $credit_card['href']; ?>"><?php echo $credit_card['name']; ?></a></li>
        <?php } ?>
      </ul>
      <?php } ?> 
      <h2 class="secondary-title"><?php echo $text_my_orders; ?></h2>
      <div class="content my-orders">
      <ul class="list-unstyled">
	    <font size="3" style="font-weight:normal; color: #FFFFFF;">
        <li><a href="<?php echo $order; ?>"><?php echo ' ~ '; ?><?php echo $text_order; ?></a></li>
        <!--<li><a href="<?php echo $download; ?>"><?php echo ' ~ '; ?><?php echo $text_download; ?></a></li>-->
        <?php if ($reward) { ?>
        <li><a href="<?php echo $reward; ?>"><?php echo ' ~ '; ?><?php echo $text_reward; ?></a></li>
        <?php } ?>
        <li><a href="<?php echo $return; ?>"><?php echo ' ~ '; ?><?php echo $text_return; ?></a></li>
        <!--<li><a href="<?php echo $transaction; ?>"><?php echo ' ~ '; ?><?php echo $text_transaction; ?></a></li>-->
        <!--<li><a href="<?php echo $recurring; ?>"><?php echo ' ~ '; ?><?php echo $text_recurring; ?></a></li>--> </font>
      </ul>
      </div>
      <!--<h2 class="secondary-title"><?php echo $text_my_newsletter; ?></h2>-->
      <div class="content my-newsletter">
      <!--<ul class="list-unstyled">
        <font size="2" style="font-weight:normal; color: #FFFFFF;"><li><a href="<?php echo $newsletter; ?>"><?php echo ' ~ '; ?><?php echo $text_newsletter; ?></a></li> </font>
      </ul>-->
      </div>
            <font size="3" style="font-weight:normal; color: #FFFFFF;">
            <?php if(isset($marketplace_status) && $marketplace_status){ ?>
            <?php if(isset($chkIsPartner) && $chkIsPartner){ ?>
              <?php if(isset($marketplace_seller_mode) && $marketplace_seller_mode){ ?>
                  <h2 class="secondary-title"><?php echo $text_marketplace; ?></h2>
                  <div class="content my-newsletter">
                    <ul class="list-unstyled">
                    <?php if(isset($marketplace_account_menu_sequence) && isset($marketplace_seller_mode) && $marketplace_seller_mode) { ?>
                      <?php foreach ($marketplace_account_menu_sequence as $key => $menu_option) { ?>
                        <?php if(isset($marketplace_allowed_account_menu) && $marketplace_allowed_account_menu && in_array($key,$marketplace_allowed_account_menu)) { ?>
                          <?php if($key == 'asktoadmin') { ?>
                          <li><a id="ask-to-admin" class="list-group-item"  data-toggle="modal" data-target="#myModal-seller-mail"><?php echo $menu_option; ?></a></li>
                          <?php }else{?>
						  
						    <?php if ($menu_option == "Dashboard") { ?>
                             <li><a href="<?php echo $account_menu_href[$key]; ?>"><?php echo $menu_option; ?> <font size="3" style="color:#F97001"> Untuk Mulai Chating & Belanja</font></a></li>
							<?php }else{?>
						     <li><a href="<?php echo $account_menu_href[$key]; ?>"><?php echo $menu_option; ?></a></li>
							<?php } ?>
						  
                          <?php } ?>
                        <?php } ?>
                      <?php } ?>
                    <?php } ?>
                    </ul>
                  </div>
              <?php } ?>
            <?php }else{?>
            		
            <?php } ?>
            <?php } ?> </font>
          
      </div>
    </div>
</div>

              <script type="text/javascript">
                $('input[name=\'marketplace_seller_mode\']').on('change',function() {
                  $("#form-mode").submit();
                });
              </script>
  


<!--<script src="catalog/view/theme/journal2/js/main.js"> </script>-->
  
<?php echo $footer; ?>
