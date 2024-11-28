<?php echo $header; ?>
<!--<script src="https://www.gstatic.com/firebasejs/4.13.0/firebase-app.js"></script>
 <script src="https://www.gstatic.com/firebasejs/4.13.0/firebase-messaging.js"></script>-->

<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><span itemprop="title"><?php echo $breadcrumb['text']; ?></span></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <!--<h1 class="heading-title"><?php echo $heading_title; ?></h1>-->
      <?php echo $content_top; ?>
	  
	 <?php if ( $heading_title == "Dashboard") { ?>
		 <?php if ($data['is_seller']==1) { ?>
		  <?php if ($data['switch']==1) { ?>
		   <center><p><font size="3" style="color:#F97001"><span style="color:rgb(255, 0, 0)"><strong><?php echo $heading_title; ?> Seller</strong></span></font></p></center>
          <?php } else { ?>
		   <center><p><font size="5" style="color:#F97001"><span style="color:rgb(255, 0, 0)"><strong><?php echo $heading_title; ?> Seller</strong></span></font></p></center><br>
		  <?php } ?>
		  
		 <?php } elseif ($data['is_seller']==0) { ?>
		  <?php if ($data['switch']==1) { ?>
		   <center><p><font size="3" style="color:#F97001"><span style="color:rgb(255, 0, 0)"><strong><?php echo $heading_title; ?> Customer</strong></span></font></p></center>
          <?php } else { ?>
		   <center><p><font size="5" style="color:#F97001"><span style="color:rgb(255, 0, 0)"><strong><?php echo $heading_title; ?> Customer</strong></span></font></p></center><br>
		  <?php } ?>
		  
		  <?php } elseif ($data['is_seller']==2) { ?>

		  <?php if ($data['switch']==1) { ?>
		   <center><p><font size="3" style="color:#F97001"><span style="color:rgb(255, 0, 0)"><strong><?php echo $heading_title; ?> Transporter</strong></span></font></p></center>
          <?php } else { ?>
		   <center><p><font size="5" style="color:#F97001"><span style="color:rgb(255, 0, 0)"><strong><?php echo $heading_title; ?> Transporter</strong></span></font></p></center><br>
		  <?php } ?>

		  <?php } elseif ($data['is_seller']==3) { ?>

		  <?php if ($data['switch']==1) { ?>
		   <center><p><font size="3" style="color:#F97001"><span style="color:rgb(255, 0, 0)"><strong><?php echo $heading_title; ?> Brand</strong></span></font></p></center>
          <?php } else { ?>
		   <center><p><font size="5" style="color:#F97001"><span style="color:rgb(255, 0, 0)"><strong><?php echo $heading_title; ?> Brand</strong></span></font></p></center><br>
		  <?php } ?>
		  
		 <?php } ?>	 	

		
     <?php } else { ?>	  
      <?php echo $description; ?>
     <?php } ?>	  
	  
     <?php echo $content_bottom; ?>
    </div>
    </div>
</div>



<font style="color:#fff">
<!--<script src="catalog/view/theme/journal2/js/main.js"> </script>-->
echo "<script>document.write(localStorage.setItem('linkwebsite','<?php echo "https://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"; ?>' ))</script>";
echo "<script>document.write(localStorage.setItem('auth_email','<?php echo $email; ?>' ))</script>";
echo "<script src='catalog/view/theme/journal2/js/main.js'></script>";
</font>

<script type="text/javascript">



</script>


<?php echo $footer; ?>





