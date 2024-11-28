<div class="panel panel-default">
	<div class="panel-heading"><?php echo $heading_title; ?></div>
	<div class="panel-body">
		<?php foreach ($all_bantuan as $bantuan) { ?>
		<div style="margin-bottom:10px; padding-bottom: 5px; border-bottom:1px solid #eee;">
			<a href="<?php echo $bantuan['view']; ?>"><?php echo $bantuan['title']; ?></a><span style="float:right;"><?php echo $bantuan['date_added']; ?></span><br />
			<?php echo $bantuan['description']; ?>
		</div>
		<?php } ?>
	</div>
</div> 

<div class="Container">
<div class="box bantuan">
	<div class="box-heading"><h3><?php echo $heading_title; ?></h3></div>
	<div class="box-content">
		
		<ul class="latest-scroll list-unstyled">
		<?php foreach ($all_bantuan as $bantuan) { ?>
			<li>
			
			<div style="margin-bottom:10px; margin-left:15px; padding-bottom: 5px; border-bottom:1px solid #eee;">
				<a style="font-size: 18px;" href="<?php echo $bantuan['view']; ?>"><?php echo $bantuan['title']; ?></a>
				<br />
				<?php echo $bantuan['description']; ?>
			</div>
			
			</li>
		<?php } ?>
		</ul>
		
	</div>
</div>
</div>