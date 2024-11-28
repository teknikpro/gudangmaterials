<div class="box bestsellers">
	<div class="box-heading">
			<h3><?php echo $heading_title; ?></h3>
	</div>
	<div class="box-content">
		<div class="row">
			<?php foreach ($products as $product) { ?>
			<div class="product-layout col-lg-3 col-md-3 col-sm-3">
				<div class="product-thumb transition" >
				<div class="image">
				
				<span class="stickers">
				<?php if ($product['special']) { ?>
					<span class="sale"><?php echo $text_sale; ?></span>					
				<?php } ?>				
				
				<?php  
				$arr_last = $product['last_array'];
				foreach( $arr_last as $value ){
					if ($product['product_id']==$value) {								
						?>
						<span class="new_pr"><?php echo $text_new; ?></span>
						<?php
						 }  
					}
				?>
				</span>
				
				<a href="<?php echo $product['href']; ?>"><img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive lazy" data-src="<?php echo $product['thumb']; ?>" src="image/catalog/preload.gif" /></a></div>
				<div class="caption">
					<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
				</div>	
				
				<div class="cart-button">	
					<?php if ($product['price']) { ?>
					<div class="price">
					<?php if (!$product['special']) { ?>
					<?php echo $product['price']; ?>
					<?php } else { ?>
					<span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
					<?php } ?>
					<?php if ($product['tax']) { ?>
					<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
					<?php } ?>
					</div>
					<?php } ?>
					<?php if ($product['rating']) { ?>
					<div class="rating">
					<?php for ($i = 1; $i <= 5; $i++) { ?>
					<?php if ($product['rating'] < $i) { ?>
					<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
					<?php } else { ?>
					<span class="fa fa-stack"><i class="fa fa-star activ fa-stack-2x"></i></span>
					<?php } ?>
					<?php } ?>
					</div>
					<?php } ?>
				<div class="clear"></div>
					<button data-toggle="tooltip" title="<?php echo $button_cart; ?>" class="btn btn-icon btn-add" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i></button>
					<button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" class="btn btn-icon wishlist" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
					<button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" class="btn btn-icon compare" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
					
				</div>
				</div>
			</div>
			<?php } ?>
		</div>
	</div>
</div>
