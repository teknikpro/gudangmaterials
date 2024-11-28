<div class="container">
<?php if ($heading_title) { ?>
<h3 class="site-second-title"><?php echo $heading_title; ?></h3>
<?php } ?>
<?php if (!$row_wise) { ?>
<div class="row">
	<?php if ($modules) { ?>
	<?php foreach ($modules as $module) { ?>
	<div class="col-lg-<?php echo $module['weightage']; ?> col-md-6 col-sm-6 col-xs-12">
	  <?php echo $module['module']; ?>
	</div>
	<?php } ?>
	<?php } ?>
</div>
<?php } else { ?>
	<?php if ($modules) { ?>
	<?php foreach ($modules as $module) { ?>
	<?php echo $module['module']; ?>
	<?php } ?>
	<?php } ?>
<?php } ?> </div>
<!--module joiner row-->