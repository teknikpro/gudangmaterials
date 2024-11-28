<!--<h3><center><?php echo  ($heading_title) ? $heading_title : ''; ?></center></h3>-->
<div class="row">
  <?php foreach ($categories as $category) { ?>
  <div class="product-layout col-lg-6 col-md-3 col-sm-3 col-xs-12">
    <div class="product-thumb transition" >
      <!-- <div class="image" ><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" /></a></div> -->
	  
        <h4 style="padding: 0 30px;" align="center"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></h4>
    </div>
  </div>
  <?php } ?>
</div>
