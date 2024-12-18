<script>
	$(document).ready(function() {
		$(".quickview").fancybox({
			maxWidth	: 800,
			maxHeight	: 600,
			fitToView	: false,
			width		: '70%',
			height		: '70%',
			autoSize	: false,
			closeClick	: false,
			openEffect	: 'elastic',
			closeEffect	: 'elastic',
			
		});
	});
</script>
<div class="box featured">
	<div class="box-heading"><h3><?php echo $heading_title; ?></h3></div>
	<div class="box-content">
		<div class="row">
		<?php $f=0; foreach ($products as $product) { $f++ ?>
		<div class="product-layout col-lg-3 col-md-3 col-sm-3 col-xs-12">
			<div class="product-thumb transition">
				
				<div class="quick_info">
					<div id="quickview_<?php echo $f?>">
						<div>
							<div class="left col-sm-4">
									<div class="quickview_image image"><a href="<?php echo $product['href']; ?>"><img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" src="<?php echo $product['thumb']; ?>" /></a></div>
								</div>
								<div class="right col-sm-8">
									<h2><?php echo $product['name']; ?></h2>
									<div class="inf">
										<?php if ($product['author']) {?>
											<p class="quickview_manufacture manufacture manufacture"><?php echo $text_manufacturer; ?> <a href="<?php echo $product['manufacturers'];?>"><?php echo $product['author']; ?></a></p>
										<?php }?>
										<?php if ($product['model']) {?>
											<p class="product_model model"><?php echo $text_model; ?> <?php echo $product['model']; ?></p>
										<?php }?>

										<?php if ($_SERVER["SERVER_NAME"] != "tokobahanbangunan-online.com") { ?>
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
										<?php } ?>
										
										
									</div>
									<div class="cart-button">
										<?php if ($_SERVER["SERVER_NAME"] != "tokobahanbangunan-online.com") { ?>
											<button class="btn btn-icon btn-add" data-toggle="tooltip" title="<?php echo $button_cart; ?>" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i></button>
											<button class="btn btn-icon wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
										<?php } ?>
										
										<button class="btn btn-icon compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>										
									</div>
									<div class="clear"></div>
									<div class="rating">
										<?php for ($i = 1; $i <= 5; $i++) { ?>
										<?php if ($product['rating'] < $i) { ?>
										<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
										<?php } else { ?>
										<span class="fa fa-stack"><i class="fa fa-star activ fa-stack-2x"></i></span>
										<?php } ?>
										<?php } ?>
									</div>
										
								</div>
								<div class="col-sm-12">
									<div class="quickview_description description">
										<?php echo $product['description1'];?>
									</div>
								</div>
						</div>
					</div>
				</div>
			
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
				
				<a href="<?php echo $product['href']; ?>"><img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive lazy" data-src="<?php echo $product['thumb']; ?>" src="image/catalog/preload.gif"  /></a>
				<a class="quickview" rel="group" href="#quickview_<?php echo $f?>">
					<?php echo $text_quick; ?>
				</a>
				</div>
			<div class="caption">
				<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
								
			</div>
			
			<div class="cart-button">
				<?php if ($_SERVER["SERVER_NAME"] != "tokobahanbangunan-online.com") { ?>
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
				
				<?php if ($_SERVER["SERVER_NAME"] != "tokobahanbangunan-online.com") { ?>				
					<button data-toggle="tooltip" title="<?php echo $button_cart; ?>" class="btn btn-icon btn-add" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');">
						<i class="fa fa-shopping-cart"></i>
					</button>
				<?php } ?>
				
				<a class="btn details" href="<?php echo $product['href']; ?>" ><span><?php echo $button_details; ?></span><i class="fa fa-chevron-right "></i><i class="fa fa-info"></i></a>
				
			</div>
			
			</div>
		</div>
		<?php } ?>
		</div>
	</div>
</div>
