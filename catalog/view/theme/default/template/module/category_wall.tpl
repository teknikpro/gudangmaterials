<h3><center><?php echo $heading_title; ?> </center> </h3>
<div class="row" style="opacity: 1; display: block;margin-bottom: 0px;">
    <?php foreach ($categories as $category) { ?>
          <!--<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">-->
      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
			<!--<div class="col-lg-6 col-md-5 col-sm-6 col-xs-12">-->
	       <!--<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">-->
            <!--<div class="product-thumb transition">-->
			<div class="product-thumb">
                <div class="image"  ><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['image']; ?>"  style="border: 0px solid;" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" /></a></div>
                <div class="caption" style="min-height: 0px">
                    <h5><a style="text-decoration: none" href="<?php echo $category['href']; ?>"></a></h5>
                </div> 
            </div>
        </div>
    <?php } ?>
</div>