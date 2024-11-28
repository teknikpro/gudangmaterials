<div class="box">
  <div class="box-content list-group">
        <center>

        <?php if($check_order_status) { ?> 
            <li style="list-style: none;"><a class="list-group-item" href="<?php echo $check_order_status; ?>"><i class="fa fa-truck"></i> <?php echo $text_check_order_status; ?></a></li>
        <?php } ?>
        
        <?php if (!$logged) { ?>  <strong><font size="2"  color="red" background-color="black">
        > <a href="<?php echo $login; ?>" class="list-group-item"><?php echo $text_login; ?></a> &nbsp;
        > <a href="<?php echo $register; ?>" class="list-group-item"><?php echo $text_register; ?> &nbsp;
        > <a href="<?php echo $forgotten; ?>" class="list-group-item"><?php echo $text_forgotten; ?> </strong></font>&nbsp;
        <?php } ?>
        <strong><font size="2"  color="red" background-color="black">> <a href="<?php echo $account; ?>" class="list-group-item"><?php echo $text_account; ?></a> &nbsp;</strong></font>
        <?php if ($logged) { ?><strong><font size="2"  color="red" background-color="black">
        > <a href="<?php echo $edit; ?>" class="list-group-item"><?php echo $text_edit; ?></a></li>
        > <a href="<?php echo $password; ?>" class="list-group-item"><?php echo $text_password; ?></a> &nbsp;
        <?php } ?>  </strong></font>&nbsp;
		<strong><font size="2"  color="red" background-color="black">
        > <a href="<?php echo $address; ?>" class="list-group-item"><?php echo $text_address; ?></a> &nbsp;
        > <a href="<?php echo $wishlist; ?>" class="list-group-item"><?php echo $text_wishlist; ?></a> &nbsp;
        > <a href="<?php echo $order; ?>" class="list-group-item"><?php echo $text_order; ?></a> &nbsp;
       
        > <a href="<?php echo $reward; ?>" class="list-group-item"><?php echo $text_reward; ?></a> &nbsp;
        > <a href="<?php echo $return; ?>" class="list-group-item"><?php echo $text_return; ?></a> &nbsp;
        > <a href="<?php echo $transaction; ?>" class="list-group-item"><?php echo $text_transaction; ?></a> &nbsp;</strong></font>
       
       
        <?php if ($logged) { ?> <strong><font size="2"  color="red" background-color="black">
        > <a href="<?php echo $logout; ?>" class="list-group-item"><?php echo $text_logout; ?></a> &nbsp; </strong></font>
        <?php } ?>  </center>
     
  </div>
</div>


<!-- asal <div class="box">
  <div class="box-content list-group">
      <ul>

        <?php if($check_order_status) { ?> 
            <li style="list-style: none;"><a class="list-group-item" href="<?php echo $check_order_status; ?>"><i class="fa fa-truck"></i> <?php echo $text_check_order_status; ?></a></li>
        <?php } ?>
        
        <?php if (!$logged) { ?>
        <li><a href="<?php echo $login; ?>" class="list-group-item"><?php echo $text_login; ?></a></li>
        <li><a href="<?php echo $register; ?>" class="list-group-item"><?php echo $text_register; ?></a></li>
        <li><a href="<?php echo $forgotten; ?>" class="list-group-item"><?php echo $text_forgotten; ?></a></li>
        <?php } ?>
        <li><a href="<?php echo $account; ?>" class="list-group-item"><?php echo $text_account; ?></a></li>
        <?php if ($logged) { ?>
        <li><a href="<?php echo $edit; ?>" class="list-group-item"><?php echo $text_edit; ?></a></li>
        <li><a href="<?php echo $password; ?>" class="list-group-item"><?php echo $text_password; ?></a></li>
        <?php } ?>
        <li><a href="<?php echo $address; ?>" class="list-group-item"><?php echo $text_address; ?></a></li>
        <li><a href="<?php echo $wishlist; ?>" class="list-group-item"><?php echo $text_wishlist; ?></a></li>
        <li><a href="<?php echo $order; ?>" class="list-group-item"><?php echo $text_order; ?></a></li>
        <li><a href="<?php echo $download; ?>" class="list-group-item"><?php echo $text_download; ?></a></li>
        <li><a href="<?php echo $reward; ?>" class="list-group-item"><?php echo $text_reward; ?></a></li>
        <li><a href="<?php echo $return; ?>" class="list-group-item"><?php echo $text_return; ?></a></li>
        <li><a href="<?php echo $transaction; ?>" class="list-group-item"><?php echo $text_transaction; ?></a></li>
        <li><a href="<?php echo $newsletter; ?>" class="list-group-item"><?php echo $text_newsletter; ?></a></li>
        <li><a href="<?php echo $recurring; ?>" class="list-group-item"><?php echo $text_recurring; ?></a></li>
        <?php if ($logged) { ?>
        <li><a href="<?php echo $logout; ?>" class="list-group-item"><?php echo $text_logout; ?></a></li>
        <?php } ?>
      </ul>
  </div>
</div>-->