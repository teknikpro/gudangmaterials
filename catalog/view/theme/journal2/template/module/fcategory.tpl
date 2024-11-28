<div id="cs-<?php echo $module; ?>" class="cs-<?php echo $module_id; ?> box custom-sections section-product <?php echo implode(' ', $disable_on_classes); ?> <?php echo $single_class; ?> <?php echo $show_title_class; ?> <?php echo isset($gutter_on_class) ? $gutter_on_class : ''; ?>" style="<?php echo isset($css) ? $css : ''; ?>">
 
<!--<center><h2><?php echo  ($heading_title) ? $heading_title : ''; ?></h3></center>-->
<div class="box-content row"> 

 <div class="box-product">
  <?php if ($data['switch']==1) { ?>


   <?php foreach ($categories as $category) { ?>
    <div class="product-grid-item <?php echo $this->journal2->settings->get('product_grid_classes'); ?> display-<?php echo $this->journal2->settings->get('product_grid_wishlist_icon_display'); ?> <?php echo $this->journal2->settings->get('product_grid_button_block_button'); ?>">

       <div class="product-thumb transition" style="padding-top: 0px; border: 0px solid; padding-right: 15px; padding-left: 0px;"> 
	     <a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']?>"  width="90%" style="border-radius: 60px;" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" /></a>
	   </div>
	   <?php if ($category['name']!="0Nonam1" and $category['name']!="0Nonam2") { ?>
	    <center><strong><a href="<?php echo $category['href']; ?>"><font size="1" style="padding-right: 15px; color:#0b7528"><?php echo $category['name']; ?></font></a> </strong></center>     
	   <?php } ?>	        	
    </div> 
   <?php } ?>
   
  <?php } else { ?>


   <?php foreach ($categories as $category) { ?>
    <?php if ($category['name']!="0Nonam1" and $category['name']!="0Nonam2") { ?>
		<div class="product-grid-item <?php echo $this->journal2->settings->get('product_grid_classes'); ?> display-<?php echo $this->journal2->settings->get('product_grid_wishlist_icon_display'); ?> <?php echo $this->journal2->settings->get('product_grid_button_block_button'); ?>">

		 
		 <div class="product-thumb transition" style="padding-top: 15px; border: 0px solid; padding-right: 15px; padding-left: 0px;">
		  <a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']?>" width="95%" style="border-radius: 60px;" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" /></a>
		 </div> 
		 <center><strong><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a> </strong> </center>   
		 </div> 
	 <?php } ?>
   <?php } ?>
   


  <?php } ?>

</div>




</div></div>