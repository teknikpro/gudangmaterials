<?php echo $header; ?>
<style>
  .wk-seller-thumb {
    margin-bottom: 20px;
    margin-right: 10%;
    box-shadow:0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19) !important
  }

  .wk-seller-thumb .thumbnail {
    border: none;
    border-radius:
    none;margin: 0;
  }

  .wk-seller-thumb .wk-caption {
    background: #0b9bc2;
    padding: 15px 15px 15px 15px;
  }

  .wk-seller-thumb{
    color: white;
  }

  .wk-caption a{
    color: #0000EE; 
	border-radius: 3px;
  }

  .wk-seller-thumb .wk-caption p {
    margin: 3px 0;
    color: white;
  }
</style>
<div id="container" class="container j-container">
  <div class="row"><?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="text-center" style="text-align:center">
        <h3 class="information"><?php echo $sell_header; ?></h3>
        <br/>
        <a href="index.php?route=account/register" type="button" class="button">
          <?php echo $sell_title; ?>
        </a>
	
      </div>
     
      <ul id="tabs" class="nav nav-tabs htabs">
        <?php if($tabs){ ?>
          <?php foreach ($tabs as $key => $value) { ?>
              <li <?php if(!$key){ ?>class="active"<?php } ?>><a href="<?php echo "#tab-".$key; ?>" data-toggle="tab"><?php echo $value['hrefValue']; ?></a></li>
          <?php }?>
        <?php }?>
      </ul>

      <div class="tabs-content">
        <?php foreach ($tabs as $key => $value) { ?>
          <div id="<?php echo "tab-".$key; ?>" class="tab-pane tab-content <?php if(!$key){ ?>active<?php } ?>"><?php echo $value['description']; ?></div>
        <?php }?>
      </div>

      <br/>
      <div class="content">

        <?php if($showpartners) { ?>
		
		  <div class="text-center" style="text-align:center">
			<a href="index.php?route=module/chatting/getchattings" type="button" class="button">
			  <?php echo "Beranda Chatting Penjual"; ?>
			</a>
		  </div>  <br/>	
		
		
          <h3 class="text-info">
            <center><b><?php echo $text_long_time_seller; ?></b></center>
          </h3>
        		  
	  
		  
          <div class="row product-grid" data-grid-classes="xs-50 sm-33 md-33 lg-25 xl-20 display-icon inline-button">
            <?php foreach ($partners as $partner) { ?>
              <div class="product-grid-item xs-50 sm-33 md-33 lg-25 xl-20 display-icon inline-button" >
                <div class="wk-seller-thumb">
                  <!--<div class="thumbnail">
                    <a href="<?php echo $partner['sellerHref']; ?>">
                      <?php  if($partner['thumb']) { ?>
                        <img src="<?php echo $partner['thumb']; ?>" alt="<?php echo $partner['name']; ?>"
                        title="<?php echo $partner['name']; ?>" class="img-responsive"/>
                      <?php } else { ?>
                        <div style="background-color:<?php echo $partner['backgroundcolor']; ?>"></div>
                      <?php } ?>

                    </a>
                  </div>-->
                  <div class="wk-caption">
                    <a href="<?php echo $partner['sellerHref']; ?>"><b><font size="2" color="black"><?php echo $partner['screenname']; ?></font></b></a>
                    <!--<?php if($partner['country']){ ?>
                      <p style="line-height:14px;"><?php echo $text_from; ?><span data-toggle="tooltip" title="<?php echo $text_from; ?>"><i class="fa fa-home"></i></span><b><?php echo $partner['country']; ?></b></p>
                    <?php } ?>-->
                    <p><?php echo $text_total_products; ?> (<?php echo $partner['total_products']; ?>)</p>
                  </div>
                </div>
              </div>
            <?php } ?>
          </div>
        <?php } ?>

        <?php if($showproducts) {?>
          <h3 class="text-info">
            <b><?php echo $text_latest_product; ?></b>
          </h3>
          <br/>

          <div class="product-filter">
            <div class="display">
              <a onclick="Journal.gridView()" class="grid-view"><?php echo $this->journal2->settings->get("category_grid_view_icon", $button_grid); ?></a>
              <a onclick="Journal.listView()" class="list-view"><?php echo $this->journal2->settings->get("category_list_view_icon", $button_list); ?></a>
            </div>
            <div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
            <div class="limit"><b><?php echo $text_limit; ?></b>
              <select onchange="location = this.value;">
                <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
            <div class="sort"><b><?php echo $text_sort; ?></b>
              <select onchange="location = this.value;">
                <?php foreach ($sorts as $sorts) { ?>
                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
      <br>
      <div class="row main-products product-grid" data-grid-classes="xs-50 sm-33 md-33 lg-25 xl-20 display-icon inline-button">
        <?php foreach ($latest as $product) { ?>
        <div class="product-grid-item xs-50 sm-33 md-33 lg-25 xl-20 display-icon inline-button">
          <div id="<?php echo $product['product_id']; ?>" class="seller-thumb product-thumb product-wrapper <?php echo isset($product['labels']) && is_array($product['labels']) && isset($product['labels']['outofstock']) ? 'outofstock' : ''; ?>">
            <div class="image">
              <a href="<?php echo $product['href']; ?>" <?php if(isset($product['thumb2']) && $product['thumb2']): ?> class="has-second-image" style="background: url('<?php echo $product['thumb2']; ?>') no-repeat;" <?php endif; ?>>
                  <img class="lazy first-image" width="<?php echo $this->journal2->settings->get('config_image_width'); ?>" height="<?php echo $this->journal2->settings->get('config_image_height'); ?>" src="<?php echo $this->journal2->settings->get('product_dummy_image'); ?>" data-src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
              </a>
              <?php if (isset($product['labels']) && is_array($product['labels'])): ?>
              <?php foreach ($product['labels'] as $label => $name): ?>
              <?php if ($label === 'outofstock'): ?>
              <img class="outofstock" <?php echo Journal2Utils::getRibbonSize($this->journal2->settings->get('out_of_stock_ribbon_size')); ?> style="position: absolute; top: 0; left: 0" src="<?php echo Journal2Utils::generateRibbon($name, $this->journal2->settings->get('out_of_stock_ribbon_size'), $this->journal2->settings->get('out_of_stock_font_color'), $this->journal2->settings->get('out_of_stock_bg')); ?>" alt="" />
              <?php else: ?>
              <span class="label-<?php echo $label; ?>"><b><?php echo $name; ?></b></span>
              <?php endif; ?>
              <?php endforeach; ?>
              <?php endif; ?>
              <?php if($this->journal2->settings->get('product_grid_wishlist_icon_position') === 'image' && $this->journal2->settings->get('product_grid_wishlist_icon_display', '') === 'icon'): ?>
                  <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="hint--top" data-hint="<?php echo $button_wishlist; ?>"><i class="wishlist-icon"></i><span class="button-wishlist-text"><?php echo $button_wishlist;?></span></a></div>
                  <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="hint--top" data-hint="<?php echo $button_compare; ?>"><i class="compare-icon"></i><span class="button-compare-text"><?php echo $button_compare;?></span></a></div>
              <?php endif; ?>
            </div>
            <div class="product-details">
              <div class="caption">
                <h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                <p class="description"><?php echo $product['description']; ?></p>
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
                  <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new" <?php echo isset($product['date_end']) && $product['date_end'] ? "data-end-date='{$product['date_end']}'" : ""; ?>><?php echo $product['special']; ?></span>
                  <?php } ?>
                  <?php if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
                </p>
                <?php } ?>
              </div>
			  <!--<p><strong><center><font size="1" color="black"><?php echo $text_supplied; ?> <?php echo $product['seller_name']; ?></font></center></strong></p>-->
              <div class="button-group">
                <?php if (Journal2Utils::isEnquiryProduct($this, $product['product_id'])): ?>
                <div class="cart enquiry-button">
                  <a href="javascript:Journal.openPopup('<?php echo $this->journal2->settings->get('enquiry_popup_code'); ?>', '<?php echo $product['product_id']; ?>');" data-clk="addToCart('<?php echo $product['product_id']; ?>');" class="button hint--top" data-hint="<?php echo $this->journal2->settings->get('enquiry_button_text'); ?>"><?php echo $this->journal2->settings->get('enquiry_button_icon') . '<span class="button-cart-text">' . $this->journal2->settings->get('enquiry_button_text') . '</span>'; ?></a>
                </div>
                <?php else: ?>
                <div class="cart <?php echo isset($product['labels']) && is_array($product['labels']) && isset($product['labels']['outofstock']) ? 'outofstock' : ''; ?>">
                  <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button hint--top" data-hint="<?php echo $button_cart; ?>"><i class="button-left-icon"></i><span class="button-cart-text"><?php echo $button_cart; ?></span><i class="button-right-icon"></i></a>
                </div>
                <?php endif; ?>
                <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="hint--top" data-hint="<?php echo $button_wishlist; ?>"><i class="wishlist-icon"></i><span class="button-wishlist-text"><?php echo $button_wishlist;?></span></a></div>
                <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="hint--top" data-hint="<?php echo $button_compare; ?>"><i class="compare-icon"></i><span class="button-compare-text"><?php echo $button_compare;?></span></a></div>
              </div>
            </div>
             <!--<div class="seller_info text-white">
               <img class="img-circle pull-left" src="<?php echo $product['avatar']; ?>"/>
                <p class="text-center">
                  <?php echo $text_seller; ?>
                  <span data-toggle="tooltip" title="<?php echo $text_seller; ?>"><i class="fa fa-user"></i></span>
                  <a href="<?php echo $product['sellerHref']; ?>" target="_blank"> <b class="text-white" ><?php echo $product['seller_name']; ?></b></a>
                </p>

                <?php if($product['country']){ ?>
                  <br/>
                  <p class="text-center">
                    <?php echo $text_from; ?>
                    <span data-toggle="tooltip" title="<?php echo $text_from; ?>"><i class="fa fa-home"></i></span>
                    <b><?php echo $product['country']; ?></b>
                  </p>
                <?php } ?>
              </div>-->
          </div>
        </div>

          <?php } ?>
        </div>
        <div class="row pagination">
          <div class="col-sm-6 text-left links"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right results"><?php echo $results; ?></div>
        </div>

        <?php } ?>


      </div>
      <?php echo $content_bottom; ?></div>
    </div>
</div>

<script>
var seller_display = function (data){

  thisid = data.currentTarget.id; //get id of current selector
  $('#'+ thisid + ' .seller_info').slideDown();
  $('#'+ thisid).unbind('mouseenter');
}
var seller_hide = function (data){
  thisid = data.currentTarget.id; //get id of current selector
  $('#'+ thisid + ' .seller_info').slideUp('slow',function(){
    $('.seller-thumb').bind('mouseenter',seller_display);
  });
}

$('.seller-thumb').bind({'mouseenter' : seller_display,'mouseleave':seller_hide });

</script>

<?php echo $footer; ?>
