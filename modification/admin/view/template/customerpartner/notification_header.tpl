<style>
  .li_padding{
    padding: 4px;
    //font-family: monospace;
  }
  .span_height{
    height: 15px;
    margin: 5px;
  }
</style>
<a class="dropdown-toggle" data-toggle="dropdown"><span class="label label-danger pull-left"><?php if(isset($alerts) && $alerts) { echo $alerts; } ?></span> <img src="view/image/notify.png" title="Notifications"></a>
  <ul class="dropdown-menu dropdown-menu-right" style="min-width:470px;">
    <?php if(isset($seller_notifications) && $seller_notifications){ ?>
      <li class="li_padding">
        <ul style="display:inline-flex;margin-left:-8%;">
          <li class="dropdown-header li_padding" style="font-size:15px;min-width:60px;"><b><?php echo $text_order; ?></b></li>
          <a href="<?php echo $view_all; ?>" style="margin:5px 0px;"><span class="label label-warning span_height"><?php echo $processing_status_total; ?></span><?php echo $text_processing_status; ?></a>
          <a href="<?php echo $view_all; ?>" style="margin:5px 5px;"><span class="label label-success span_height" style="margin-left:2%;"><?php echo $complete_status_total; ?></span><?php echo $text_complete_status; ?></a>
          <a href="<?php echo $view_all; ?>" style="margin:5px 0px;"><span class="label label-danger span_height" style="margin-left:2%;"><?php echo $return_total; ?></span><?php echo $text_return; ?></a>
        </ul>
        <?php if(isset($seller_notifications) && $seller_notifications){ ?>
          <ul>
            <?php foreach($seller_notifications AS $seller_notification){ ?>
              <li class="li_padding"><?php echo $seller_notification; ?></li>
            <?php } ?>
            <li class="li_padding" style="display: block; overflow: auto;"><a href="<?php echo $view_all; ?>"><?php echo $text_view_all; ?></a></li>
          </ul>
        <?php } ?>
      </li>
      <?php if((isset($seller_product_reviews) && $seller_product_reviews) || (isset($seller_reviews) && $seller_reviews)){ ?>
        <li class="divider li_padding"></li>
      <?php } ?>
    <?php } ?>
    <?php if(isset($seller_product_reviews) && $seller_product_reviews){ ?>
      <li class="li_padding">
        <ul style="display:inline-flex;margin-left:-8%;">
          <li class="dropdown-header li_padding" style="font-size:15px;min-width:60px;"><b><?php echo $text_product; ?></b></li>
          <a href="<?php echo $view_all.'&tab=product'; ?>" style="margin:5px 0px;"><span class="label label-warning span_height"><?php echo $product_stock_total; ?></span><?php echo $text_stock; ?></a>
          <a href="<?php echo $view_all.'&tab=product'; ?>" style="margin:5px 5px;"><span class="label label-success span_height" style="margin-left:2%;"><?php echo $review_total; ?></span><?php echo $text_entry_review; ?></a>
          <a href="<?php echo $view_all.'&tab=product'; ?>" style="margin:5px 0px;"><span class="label label-danger span_height" style="margin-left:2%;"><?php echo $approval_total; ?></span><?php echo $text_approval; ?></a>
        </ul>
        <?php if(isset($seller_product_reviews) && $seller_product_reviews){ ?>
          <ul>
            <?php foreach($seller_product_reviews AS $seller_product_review){ ?>
              <li class="li_padding"><?php echo $seller_product_review; ?></li>
            <?php } ?>
            <li class="li_padding" style="display: block; overflow: auto;"><a href="<?php echo $view_all.'&tab=product'; ?>"><?php echo $text_view_all; ?></a></li>
          </ul>
        <?php } ?>
      </li>
      <?php if(isset($seller_reviews) && $seller_reviews){ ?>
        <li class="divider li_padding"></li>
      <?php } ?>
    <?php } ?>
    <?php if(isset($seller_reviews) && $seller_reviews){ ?>
      <li class="li_padding">
        <ul style="display:inline-flex;margin-left:-8%;">
          <li class="dropdown-header li_padding" style="font-size:15px;min-width:60px;"><b><?php echo $text_entry_seller; ?></b></li>
          <a href="<?php echo $view_all.'&tab=seller'; ?>" style="margin:5px 0px;"><span class="label label-success span_height"><?php echo $seller_review_total; ?></span><?php echo $text_entry_review; ?></a>
        </ul>
        <?php if(isset($seller_reviews) && $seller_reviews){ ?>
          <ul>
            <?php foreach($seller_reviews AS $seller_review){ ?>
              <li class="li_padding"><?php echo $seller_review; ?></li>
            <?php } ?>
            <li class="li_padding" style="display: block; overflow: auto;"><a href="<?php echo $view_all.'&tab=seller'; ?>"><?php echo $text_view_all; ?></a></li>
          </ul>
        <?php } ?>
      </li>
    <?php } ?>
    <?php if((!isset($seller_notifications) && !isset($seller_product_reviews) && !isset($seller_reviews)) || (!$seller_notifications && !$seller_product_reviews && !$seller_reviews)){ ?>
      <center><h4><?php echo $text_no_notification; ?></h4></center>
    <?php } ?>
  </ul>
