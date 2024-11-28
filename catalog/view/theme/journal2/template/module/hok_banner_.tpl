<?php if ($heading_title) { ?>
<h3 class="deals-title"><span><?php echo $heading_title; ?></span></h3>
<?php } ?>
<?php if (count($banners) >2) { ?>
<?php $small_class = 4 ?>
<?php } else { ?>
<?php $small_class = 6 ?>
<?php } ?>
<div class="row">
  <?php foreach ($banners as $banner) { ?>  
	  <div class="product-layout col-lg-<?php echo $banner['grid_size']; ?> col-md-<?php echo $banner['grid_size']; ?> col-sm-<?php echo $small_class; ?> col-xs-6">
		<div class="product-thumb banner transition">
		  <div class="image">
			<?php if ($banner['link']) { ?>
			<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
			<?php } else { ?>
			<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
			<?php } ?>
		  </div>
		  <?php if($title_status) { ?>
		  <div class="category-title <?php echo $title_class;?>">
			<h4><a href="<?php echo $banner['link']; ?>"><?php echo $banner['title']; ?></a></h4>
		  </div>
		  <?php } ?>
		</div>
	  </div>
	  <?php } ?>
</div><!--end hok banner row-->