<style>
	.xl-20{
		width: 20%;
	}
</style>
<div id="seller-collection">
	<?php if ($products) { ?>
		<div class="row collection-top">
			<!-- <p><a href="<?php echo $compare; ?>" id="compare-total" class="default-work"><?php echo $text_compare; ?></a></p> -->
			<div class="product-filter">
					<div class="display">
						<a onclick="Journal.gridView()" id="grid-view" class="default-work"><?php echo $this->journal2->settings->get("category_grid_view_icon", $button_grid); ?></a>
						<a onclick="Journal.listView()" id="list-view" class="default-work"><?php echo $this->journal2->settings->get("category_list_view_icon", $button_list); ?></a>
					</div>
					<div class="product-compare">
						<a href="<?php echo $compare; ?>" id="compare-total" class="default-work"><?php echo $text_compare; ?></a>
					</div>
					<div class="limit"><b><?php echo $text_limit; ?></b>
						<select id="input-limit" class="form-control">
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
						<select id="input-sort" class="form-control">
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
			</div>
	<?php } ?>
	<div class="row" style="display:inline-flex;">
		<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
			<!-- for category list-->
			<?php if($categories) { ?>
				<column id="column-left">
					<ul class="mp-list-group" id="category-menu" style="border:none;box-shadow:unset;">

						<li class="mp-list-group-item mp-list-group-collection active">
						  <a data-collection-url="<?php echo $collection_url; ?>" class="default-work"><?php echo 'All'; ?></a>
						  <i class="fa fa-caret-down" style="font-size:20px;float:right;"></i>
						</li>

						<?php foreach ($categories as $category) { ?>
							<?php if ($category['category_id'] == $category_id) { ?>
								<li class="mp-list-group-item mp-list-group-collection active">
									<a data-collection-url="<?php echo $category['href']; ?>" class="default-work"><?php echo $category['name']; ?></a>
									<i class="fa fa-caret-down" style="font-size:20px;float:right;"></i>
								</li>
								<?php if ($category['children']) { ?>
									<?php foreach ($category['children'] as $child) { ?>
										<?php if ($child['category_id'] == $child_id) { ?>
											<li class="mp-list-group-item mp-list-group-collection active hide-child">
												<a data-collection-url="<?php echo $child['href']; ?>" class="default-work">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
											</li>
										<?php } else { ?>
											<li class="mp-list-group-item mp-list-group-collection active hide-child">
												<a data-collection-url="<?php echo $child['href']; ?>" class="default-work">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
											</li>
										<?php } ?>
									<?php } ?>
								<?php } ?>
							<?php } else { ?>
							<li class="mp-list-group-item mp-list-group-collection active">
								<a data-collection-url="<?php echo $category['href']; ?>" class="default-work"><?php echo $category['name']; ?></a>
								<i class="fa fa-caret-down" style="font-size:20px;float:right;"></i>
							</li>
							<?php } ?>
						<?php } ?>
					</ul>
				</column>
			<?php } ?>
		</div>

		<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
			<?php if ($products) { ?>
				<div id="mp-products">
					<div id="seller-collection">
						<div class="row main-products product-list" data-grid-classes="<?php echo $this->journal2->settings->get('product_grid_classes'); ?> display-<?php echo $this->journal2->settings->get('product_grid_wishlist_icon_display'); ?> <?php echo $this->journal2->settings->get('product_grid_button_block_button'); ?>">
						  <?php foreach ($products as $product) { ?>
						    <div class="product-grid-item xs-100 sm-50 md-33 lg-25 xl-25 display-both block-button">
						      <div id="<?php echo $product['product_id']; ?>" class="seller-thumb product-thumb product-wrapper <?php echo isset($product['labels']) && is_array($product['labels']) && isset($product['labels']['outofstock']) ? 'outofstock' : ''; ?>">
						        <div class="image">
						          <a href="<?php echo $product['href']; ?>" class="default-work" <?php if(isset($product['thumb2']) && $product['thumb2']): ?> class="has-second-image" style="background: url('<?php echo $product['thumb2']; ?>') no-repeat;" <?php endif; ?>>
						              <img class="lazy first-image" width="<?php echo $this->journal2->settings->get('config_image_width'); ?>" height="<?php echo $this->journal2->settings->get('config_image_height'); ?>" src="<?php echo $product['thumb']; ?>" data-src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
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
						              <div class="wishlist" style="margin-left:10%;"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="default-work hint--top" data-hint="<?php echo $button_wishlist; ?>"><i class="wishlist-icon"></i><span class="button-wishlist-text"><?php echo $button_wishlist;?></span></a></div>
						              <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="default-work hint--top" data-hint="<?php echo $button_compare; ?>"><i class="compare-icon"></i><span class="button-compare-text"><?php echo $button_compare;?></span></a></div>
						          <?php endif; ?>
						        </div>
						        <div class="product-details">
						          <div class="caption">
						             <!--<h4 class="name"><a href="<?php echo $product['href']; ?>" class="default-work"><?php echo $product['name']; ?></a></h4>-->
									<a href="<?php echo $product['href']; ?>" class="default-work"><center><strong><font size="3" style="color:#F97001"><?php echo $product['name']; ?></font></strong></center></a>
						            <!--<p class="description"><?php echo $product['description']; ?></p>-->
									<center><b><font size="2" color="black"><?php echo $product['description']; ?></font></b></center>
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
						              <center><strong><font size="2"  color="red"><?php echo $product['price']; ?></font></strong> <strong><font size="2"  color="blue">/ <?php echo $product['sku']; ?></font></strong></center>
						              <?php } else { ?>
						              <span style="color:red;"><strike><?php echo $product['price']; ?></strike></span> <span <?php echo isset($product['date_end']) && $product['date_end'] ? "data-end-date='{$product['date_end']}'" : ""; ?>><?php echo $product['special']; ?></span>
						              <?php } ?>
						              <?php if ($product['tax']) { ?>
						              <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
						              <?php } ?>
						            </p>
						            <?php } ?>
						          </div>
						          <div class="button-group">
						            <?php if (Journal2Utils::isEnquiryProduct($this, $product['product_id'])): ?>
						            <div class="cart enquiry-button">
						              <a href="javascript:Journal.openPopup('<?php echo $this->journal2->settings->get('enquiry_popup_code'); ?>', '<?php echo $product['product_id']; ?>');" data-clk="addToCart('<?php echo $product['product_id']; ?>');" class="button hint--top default-work" data-hint="<?php echo $this->journal2->settings->get('enquiry_button_text'); ?>"><?php echo $this->journal2->settings->get('enquiry_button_icon') . '<span class="button-cart-text">' . $this->journal2->settings->get('enquiry_button_text') . '</span>'; ?></a>
						            </div>
						            <?php else: ?>
						            <div class="cart <?php echo isset($product['labels']) && is_array($product['labels']) && isset($product['labels']['outofstock']) ? 'outofstock' : ''; ?>">
						              <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button hint--top default-work btn_cart" data-hint="<?php echo $button_cart; ?>"><i class="button-left-icon"></i><span class="button-cart-text"><?php echo $button_cart; ?></span><i class="button-right-icon"></i></a>
						            </div>
						            <?php endif; ?>
						            <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="hint--top default-work" data-hint="<?php echo $button_wishlist; ?>"><i class="wishlist-icon"></i><span class="button-wishlist-text"><?php echo $button_wishlist;?></span></a></div>
						            <!--<div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="hint--top default-work" data-hint="<?php echo $button_compare; ?>"><i class="compare-icon"></i><span class="button-compare-text"><?php echo $button_compare;?></span></a></div>-->
									<div align="center"><font size="2" color="red"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="hint--top default-work" data-hint="<?php echo $button_compare; ?>"><i class="compare-icon"> </i> <span class="button-compare-text"><?php echo $button_compare;?></span></a></font></div>
						          </div>
						        </div>
						      </div>
						    </div>
						  <?php } ?>
						</div>

						<div class="row pagination">
						  <div class="col-sm-6 text-left links"><?php echo $pagination; ?></div>
						  <div class="col-sm-6 text-right results" style="text-align:right;"><?php echo $results; ?></div>
						</div>
					</div>
				</div>
			<?php } ?>
		</div>
		<?php if (!$categories && !$products) { ?>
			<p><?php echo $text_empty; ?></p>
		<?php } ?>
	</div>
</div>
<script type="text/javascript">
	Journal.enableQuickView();
    $('.quickview-button a').addClass('default-work');
</script>
