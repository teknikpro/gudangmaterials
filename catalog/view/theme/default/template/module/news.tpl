<div class="panel panel-default">
	<div class="panel-heading"><?php echo $heading_title; ?></div>
	<div class="panel-body">
		<?php foreach ($all_news as $news) { ?>
		<div style="margin-bottom:10px; padding-bottom: 5px; border-bottom:1px solid #eee;">
			<a href="<?php echo $news['view']; ?>"><?php echo $news['title']; ?></a><span style="float:right;"><?php echo $news['date_added']; ?></span><br />
			<?php echo $news['description']; ?>
		</div>
		<?php } ?>
	</div>
</div> 

<div class="Container">
<div class="box news">
	<div class="box-heading"><h3><?php echo $heading_title; ?></h3></div>
	<div class="box-content">
		
		<ul class="latest-scroll list-unstyled">
		<?php foreach ($all_news as $news) { ?>
			<li>
			
			<div style="margin-bottom:10px; margin-left:15px; padding-bottom: 5px; border-bottom:1px solid #eee;">
				<a style="font-size: 18px;" href="<?php echo $news['view']; ?>"><?php echo $news['title']; ?></a>
				<br />
				<?php echo $news['description']; ?>
			</div>
			
			</li>
		<?php } ?>
		</ul>
		
	</div>
</div>
</div>