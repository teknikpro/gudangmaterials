<div class="box oc-module">
<h3><center><?php echo $heading_title; ?> </center> </h3>
<div class="box-content row"> 
<div class="box-product">

    <?php foreach ($categories as $category) { ?> 			
			 <div class="product-grid-item <?php echo $this->journal2->settings->get('product_grid_classes'); ?> ">
			<div class="product-thumb transition">
                <div class="image"  ><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['image']; ?>"  style="border: 0px solid;" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" /></a></div>
                <div class="caption" style="min-height: 0px">
                    <h5><a style="text-decoration: none" href="<?php echo $category['href']; ?>"></a></h5>
                </div> 
            </div> </div>
      
    <?php } ?>
</div></div></div>