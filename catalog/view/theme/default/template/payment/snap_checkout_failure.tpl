<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div class="container" align="center"><?php echo $content_top; ?>
	<h2 class="text-center">Pembayaran Gagal!</h2>
	<p class="text-center"><?php echo $text_failure ?></p>
	<a href="<?php echo $checkout_url;?>">
		<div class="text-center">
			<button class="btn btn-primary">Re-Checkout!</button>
		</div>
	</a>
	<?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>