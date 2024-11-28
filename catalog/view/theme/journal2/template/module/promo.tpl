<div id="container" class="container j-container">
<div class="box promo">
	<div class="box-heading"><strong><font size="3" color="black"><?php echo $heading_title; ?></font></strong></div>
	
		<ul class="latest-scroll list-unstyled">
		<?php foreach ($all_promo as $promo) { ?>
			<li>
			
			<div style="margin-bottom:1px; margin-left:0px; padding-bottom: -10px; border-bottom: 0px solid #eee;">
				<a href="<?php echo $promo['view']; ?>"><strong><font size="2" style="color:#F97001"><?php echo $promo['title']; ?></font></strong></a>
				<br />
				<strong><font size="2"style="color:#fff99"><?php echo $promo['description']; ?></font></strong>
			</div>
			
			</li>
		<?php } ?>
		</ul>
		
	
</div>
</div>
