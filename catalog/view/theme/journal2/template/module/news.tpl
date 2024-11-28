<div id="container" class="container j-container">
<div class="box news">
	<div class="box-heading"><strong><font size="3" color="black"><?php echo $heading_title; ?></font></strong></div>
	
		<ul class="latest-scroll list-unstyled">
		<?php foreach ($all_news as $news) { ?>
			<li>
			
			<div style="margin-bottom:1px; margin-left:0px; padding-bottom: -10px; border-bottom: 0px solid #eee;">
				<a href="<?php echo $news['view']; ?>"><strong><font size="2" style="color:#F97001"><?php echo $news['title']; ?></font></strong></a>
				<br />
				<strong><font size="2"style="color:#fff99"><?php echo $news['description']; ?></font></strong>
			</div>
			
			</li>
		<?php } ?>
		</ul>
		
	
</div>
</div>
