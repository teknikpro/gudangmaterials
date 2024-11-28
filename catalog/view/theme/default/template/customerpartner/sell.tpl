<?php echo $header; ?>
<style>
  .wk-seller-thumb {
    margin-bottom: 20px;
    box-shadow:0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19) !important
  }

  .wk-seller-thumb .thumbnail {
    border: none;
    border-radius:
    none;margin: 0;
  }

  .wk-seller-thumb .wk-caption {
    background: #0b9bc2;
    padding: 15px 5px 5px 5px;
  }

  .wk-seller-thumb{
    color: white;
  }

  .wk-caption a{
    color: #0000EE;
  }

  .wk-seller-thumb .wk-caption p {
    margin: 3px 0;
    color: white;
  }
</style>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="text-center">
        <h1 class="text-info"><?php echo $sell_header; ?></h1>
        <a href="index.php?route=account/register" type="button" class="btn btn-primary btn-lg">
          <?php echo $sell_title; ?>
        </a>
      </div>
      <br/>
      <?php if($tabs){ ?>
      <ul class="nav nav-tabs">
        <?php foreach ($tabs as $key => $value) { ?>
            <li <?php if(!$key){ ?>class="active"<?php } ?>><a href="<?php echo "#tab-".$key; ?>" data-toggle="tab"><?php echo $value['hrefValue']; ?></a></li>
        <?php }?>
      </ul>
      <div class="tab-content">
        <?php foreach ($tabs as $key => $value) { ?>
          <div id="<?php echo "tab-".$key; ?>" class="tab-pane <?php if(!$key){ ?>active<?php } ?>"><?php echo $value['description']; ?></div>
        <?php }?>
      </div>
      <?php }?>
      <br/>
      <?php if($showpartners) { ?>
      <h3><b><?php echo $text_long_time_seller; ?></b></h3>
      <div class="row">
        <?php foreach ($partners as $partner) { ?>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
          <div class="wk-seller-thumb">
            <div class="thumbnail">
              <a href="<?php echo $partner['sellerHref']; ?>">
                <?php  if($partner['thumb']) { ?>
                  <img src="<?php echo $partner['thumb']; ?>" alt="<?php echo $partner['name']; ?>"
                  title="<?php echo $partner['name']; ?>" class="img-responsive"/>
                <?php } else { ?>
                  <div style="background-color:<?php echo $partner['backgroundcolor']; ?>"></div>
                <?php } ?>

              </a>
            </div>
            <div class="wk-caption">
              <a href="<?php echo $partner['sellerHref']; ?>"><b><?php echo $partner['name']; ?></b></a>
              <?php if($partner['country']){ ?>
                <p><?php echo $text_from; ?><span data-toggle="tooltip" title="<?php echo $text_from; ?>"><i class="fa fa-home"></i></span><b><?php echo $partner['country']; ?></b></p>
              <?php } ?>
              <p><?php echo $text_total_products; ?><?php echo $partner['total_products']; ?></p>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if($showproducts) {?>
      <h3><b><?php echo $text_latest_product; ?></b></h3>
      <div class="row">
        <div class="col-sm-3 hidden-xs">
          <div class="btn-group">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>
        <div class="col-sm-1 col-sm-offset-2 text-right">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="col-sm-3 text-right">
          <select id="input-sort" class="form-control col-sm-3" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-1 text-right">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="col-sm-2 text-right">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>
      <br>
      <div class="row">
        <?php foreach ($latest as $product) { ?>
        <div class="product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12">
          <div class="product-thumb seller-thumb" id="<?php echo $product['product_id']; ?>">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div style="position: relative;">
              <div class="caption">
                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                <p style="height:100px;overflow:hidden;"><?php echo $product['description']; ?></p>
                <?php if ($product['rating']) { ?>
                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php } ?>
                <?php if ($product['price']) { ?>
                <p class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                  <?php } ?>
                  <?php if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
                </p>
                <?php } ?>
              </div>
              <?php if (isset($showpartnerdetails) && $showpartnerdetails) {?>
              <div id="wk_seller_info_container" class="wk_seller_info">
                <div style="padding: 10px;background-color: #f8f8f8;border-top: 8px solid orange;">
                  <div id="wk_seller_info_profpic">
                    <img src="<?php echo $product['avatar']; ?>" width="100%" height="100%" style="vertical-align:baseline;">
                  </div>
                  <div id="wk_seller_info_box">
                    <h4 style="margin-bottom: 15px;margin-top: 0px;font-size: 13px;"><b><?php echo $text_seller; ?></b></h4>
                    <a href="<?php echo $product['sellerHref']; ?>"><p style="margin:0; line-height: 15px;"><b><?php echo $product['seller_name']; ?></b></p></a>
                    <?php if($product['country']){ ?>
                    <p style="max-width:135px;line-height:14px;"><?php echo $text_from; ?>
                        <span data-toggle="tooltip" title="<?php echo $text_from; ?>"><i class="fa fa-home"></i></span>
                        <b><?php echo $product['country']; ?></b>
                      </p>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <?php } ?>
              <div class="button-group">
                <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script>
var seller_display = function (data){
  thisid = data.currentTarget.id; //get id of current selector
  $('#'+ thisid + ' .wk_seller_info').slideDown();
  $('#'+ thisid).unbind('mouseenter');
}
var seller_hide = function (data){
  thisid = data.currentTarget.id; //get id of current selector
  $('#'+ thisid + ' .wk_seller_info').slideUp('slow',function(){
    $('.seller-thumb').bind('mouseenter',seller_display);
  });
}

$('.seller-thumb').bind({'mouseenter' : seller_display,'mouseleave':seller_hide });

</script>
<?php echo $footer; ?>
