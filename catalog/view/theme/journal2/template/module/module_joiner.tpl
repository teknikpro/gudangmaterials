
<?php if ($heading_title) { ?>
<h3 class="site-second-title"><?php echo $heading_title; ?></h3>
<?php } ?>
<?php if (!$row_wise) { ?>
<div class="box-content row"> 
  <div class="box-product">
	<?php if ($modules) { ?>
	<?php foreach ($modules as $module) { ?>
	 <div class="product-grid-item <?php echo $this->journal2->settings->get('product_grid_classes'); ?> display-<?php echo $this->journal2->settings->get('product_grid_wishlist_icon_display'); ?> <?php echo $this->journal2->settings->get('product_grid_button_block_button'); ?>">
	  <?php echo $module['module']; ?>
	</div>
	<?php } ?>
	<?php } ?>
</div></div>
<?php } else { ?>
	<?php if ($modules) { ?>
 
	
  
	<?php foreach ($modules as $module) { ?>
	
	<?php echo $module['module']; ?>
	<?php } ?>
	<?php } ?>
<?php } ?> 
<!--module joiner row-->