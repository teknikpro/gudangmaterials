<div class="box account info" align="center">
	<div class="box-heading">
		<h2><?php echo $heading_title; ?>:</h2>
	</div>
	<div class="box-content">
		<ul><h2><center><b>
			<?php if (!$logged) { ?>
			<li><a href="<?php echo $login; ?>" ><?php echo $text_login; ?></a></li>
			<li><a href="<?php echo $register; ?>" ><?php echo $text_register; ?></a></li>
			<li><a href="<?php echo $forgotten; ?>" ><?php echo $text_forgotten; ?></a></li>
			<?php } ?>
			<li><a href="<?php echo $account; ?>" ><?php echo $text_account; ?></a></li>
			<?php if ($logged) { ?>
			<li><a href="<?php echo $edit; ?>" ><?php echo $text_edit; ?></a></li>
			<li><a href="<?php echo $password; ?>" ><?php echo $text_password; ?></a></li>
			<?php } ?>
			<li><a href="<?php echo $address; ?>" ><?php echo $text_address; ?></a></li>
			<li><a href="<?php echo $wishlist; ?>" ><?php echo $text_wishlist; ?></a> </li>
			<li><a href="<?php echo $order; ?>" ><?php echo $text_order; ?></a> </li>
			<!-- <li><a href="<?php echo $download; ?>" ><?php echo $text_download; ?></a></li> -->
			<!--<li><a href="<?php echo $reward; ?>" ><?php echo $text_reward; ?></a></li> -->
			<li><a href="<?php echo $return; ?>" ><?php echo $text_return; ?></a></li>
			<li><a href="<?php echo $klikpay; ?>" ><?php echo $text_klikpay; ?></a></li>
			<li><a href="<?php echo $transaction; ?>" ><?php echo $text_transaction; ?></a> </li>
			<li><a href="<?php echo $newsletter; ?>" ><?php echo $text_newsletter; ?></a></li>
			<!-- <li><a href="<?php echo $recurring; ?>" ><?php echo $text_recurring; ?></a></li> -->
			<?php if ($logged) { ?>
			<li><a href="<?php echo $logout; ?>" ><?php echo $text_logout; ?></a></li>
			<?php } ?>
		</b></center></h2></ul>
	</div>
</div>

