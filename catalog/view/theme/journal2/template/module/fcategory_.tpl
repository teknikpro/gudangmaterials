<div id="cs-<?php echo $module; ?>" class="cs-<?php echo $module_id; ?> box custom-sections section-product <?php echo implode(' ', $disable_on_classes); ?> <?php echo $single_class; ?> <?php echo $show_title_class; ?> <?php echo isset($gutter_on_class) ? $gutter_on_class : ''; ?>" style="<?php echo isset($css) ? $css : ''; ?>">
 
<center><h2><?php echo  ($heading_title) ? $heading_title : ''; ?></h3></center>
<div class="box-content row"> 
 <div class="box-product">
  <?php foreach ($categories as $category) { ?>
  <div class="product-grid-item <?php echo $this->journal2->settings->get('product_grid_classes'); ?> display-<?php echo $this->journal2->settings->get('product_grid_wishlist_icon_display'); ?> <?php echo $this->journal2->settings->get('product_grid_button_block_button'); ?>">
   
    <div class="product-thumb transition" style="padding-bottom: 5px; border: 0px solid; ">
     <a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" style="border: 0px solid;" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" /></a>
      <center><strong><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a> </strong> </center>
    </div>
	
  </div> 
  <?php } ?>

</div></div></div>




