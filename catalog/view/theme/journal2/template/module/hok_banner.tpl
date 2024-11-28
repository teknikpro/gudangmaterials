<div id="cs-<?php echo $module; ?>" class="cs-<?php echo $module_id; ?> box custom-sections section-product <?php echo implode(' ', $disable_on_classes); ?> <?php echo $single_class; ?> <?php echo $show_title_class; ?> <?php echo isset($gutter_on_class) ? $gutter_on_class : ''; ?>" style="<?php echo isset($css) ? $css : ''; ?>">
 
<!--<center><h2><?php echo  ($heading_title) ? $heading_title : ''; ?></h3></center>-->

<div class="row"> 
 <div class="box-product">
  <?php foreach ($banners as $banner) { ?>
 <!-- <div class="product-grid-item <?php echo $this->journal2->settings->get('product_grid_classes'); ?> display-<?php echo $this->journal2->settings->get('product_grid_wishlist_icon_display'); ?> <?php echo $this->journal2->settings->get('product_grid_button_block_button'); ?>"> -->
 
   <div class="product-grid-item  <?php echo $this->journal2->settings->get('product_grid_classes'); ?> ">
    <div class="product-thumb transition" style="padding-bottom: 0px; border: 0px solid; ">
	

	<?php if ($data['is_seller']==1 ) { ?>

			<?php if ($banner['title'] == "Chatting") { ?>
			   <a href="../seller/apps/">
			   <img src="<?php echo $banner['image']; ?>" style="border: 0px solid;" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" class="img-responsive" /></a>&nbsp; &nbsp;
			   <center><a href="<?php echo $banner['link2']; ?>"><?php echo $banner['title']; ?> (<span id="jmlchat" ></span>)</a></center>		  
	
					 <?php if ( !empty($_COOKIE['KeyNote']) ) { ?>
						<audio style="width:0px;">
							<source src="catalog/view/theme/journal2/music/alarm.mp3" type="audio/mpeg">							
						</audio>

						<script>
						setInterval(function()
						{
							var useridkey = localStorage.useridkey;
							var is_partner = localStorage.is_partner;
							var dataString = "useridkey=" + useridkey + "&is_partner=" + is_partner ;																		
							$.ajax({
								type: "POST",
								url: "https://gudangmaterials.id/api4/android/index.php/notifikasi/profile2/",			
								data: dataString,								
								success:function(data)            {
									if(data>0)
									{
										$("#jmlchat").html(data);
										$("#jmlchat").show(); 
										$('audio')[0].play();
									}
									else
									{
									   $("#jmlchat").hide(); 
									   $('audio')[0].pause();
									}
									console.log(data);
								}
								 
							});
						}, 5000); //10000 milliseconds = 10 seconds
						</script>
					<?php } ?>	 	


			<?php } else { ?>
			   <a href="<?php echo $banner['link2']; ?>"><img src="<?php echo $banner['image']; ?>" style="border: 0px solid;" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" class="img-responsive" /></a>&nbsp; &nbsp;
			   <center><font size="2"  color="black"><a href="<?php echo $banner['link']; ?>"><?php echo $banner['title']; ?></a></font></center> 
			<?php } ?>	   
	  
	<?php } elseif ($data['is_seller']==0 ) { ?>
			<?php if ($banner['title'] == "Chatting" or $banner['title'] == "PasswordKu" or $banner['title'] == "AlamatKu" or $banner['title'] == "Bayar OrderKu" or $banner['title'] == "Riwayat Pesanan" or $banner['title'] == "Promo" or $banner['title'] == "Notifikasi") { ?>
 
				<?php if ($banner['title'] == "Chatting") { ?>
				  <a href="../customer/apps/"><img src="<?php echo $banner['image']; ?>" style="border: 0px solid;" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" class="img-responsive" /></a></center>&nbsp; &nbsp;
				  <center><a href="<?php echo $banner['link2']; ?>"><?php echo $banner['title']; ?> (<span id="jmlchat" ></span>)</a></center>
	
					 <?php if ( !empty($_COOKIE['KeyNote']) ) { ?>
						<audio style="width:0px;">
							<source src="catalog/view/theme/journal2/music/alarm.mp3" type="audio/mpeg">							
						</audio>

						<script>
						setInterval(function()
						{
							var useridkey = localStorage.useridkey;
							var is_partner = localStorage.is_partner;
							var dataString = "useridkey=" + useridkey + "&is_partner=" + is_partner ;																		
							$.ajax({
								type: "POST",
								url: "https://gudangmaterials.id/api4/android/index.php/notifikasi/profile2/",			
								data: dataString,								
								success:function(data)            {
									if(data>0)
									{
										$("#jmlchat").html(data);
										$("#jmlchat").show(); 
										$('audio')[0].play();
									}
									else
									{
									   $("#jmlchat").hide(); 
									   $('audio')[0].pause();
									}
									console.log(data);
								}
								 
							});
						}, 5000); //10000 milliseconds = 10 seconds
						</script>
					<?php } ?>	 	



				<?php } else { ?>
				  <a href="<?php echo $banner['link2']; ?>"><img src="<?php echo $banner['image']; ?>" style="border: 0px solid;" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" class="img-responsive" /></a>&nbsp; &nbsp;
				  <center><font size="2"  color="black"><a href="<?php echo $banner['link']; ?>"><?php echo $banner['title']; ?></a></font></center> 
				<?php } ?>	 
			<?php } ?>	  
	   
	<?php } elseif ($data['is_seller']==2 ) { ?>   
			<?php if ($banner['title'] != "Produk Saya" and $banner['title'] != "Ulasan Produk" and $banner['title'] != "Bayar OrderKu") { ?>
 
				<?php if ($banner['title'] == "Chatting") { ?>
				  <a href="../transporter/apps/"><img src="<?php echo $banner['image']; ?>" style="border: 0px solid;" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" class="img-responsive" /></a>&nbsp; &nbsp;
				  <center><a href="<?php echo $banner['link2']; ?>"><?php echo $banner['title']; ?> (<span id="jmlchat" ></span>)</a></center>
	
					 <?php if ( !empty($_COOKIE['KeyNote']) ) { ?>
						<audio style="width:0px;">
							<source src="catalog/view/theme/journal2/music/alarm.mp3" type="audio/mpeg">							
						</audio>

						<script>
						setInterval(function()
						{
							var useridkey = localStorage.useridkey;
							var is_partner = localStorage.is_partner;
							var dataString = "useridkey=" + useridkey + "&is_partner=" + is_partner ;																		
							$.ajax({
								type: "POST",
								url: "https://gudangmaterials.id/api4/android/index.php/notifikasi/profile2/",			
								data: dataString,								
								success:function(data)            {
									if(data>0)
									{
										$("#jmlchat").html(data);
										$("#jmlchat").show(); 
										$('audio')[0].play();
									}
									else
									{
									   $("#jmlchat").hide(); 
									   $('audio')[0].pause();
									}
									console.log(data);
								}
								 
							});
						}, 5000); //10000 milliseconds = 10 seconds
						</script>
					<?php } ?>	 	


				<?php } else { ?>
				  <a href="<?php echo $banner['link2']; ?>"><img src="<?php echo $banner['image']; ?>" style="border: 0px solid;" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" class="img-responsive" /></a>&nbsp; &nbsp;
				  <center><font size="2"  color="black"><a href="<?php echo $banner['link']; ?>"><?php echo $banner['title']; ?></a></font></center> 
				<?php } ?>	 
			<?php } ?>		   
	<?php } elseif ($data['is_seller']==3 ) { ?>   
			<?php if ($banner['title'] == "Chatting" or $banner['title'] == "PasswordKu" or $banner['title'] == "AlamatKu" or $banner['title'] == "Bayar OrderKu" or $banner['title'] == "Riwayat Pesanan" or $banner['title'] == "Promo") { ?>
 
				<?php if ($banner['title'] == "Chatting") { ?>
				  <a href="../brand/apps/"><img src="<?php echo $banner['image']; ?>" style="border: 0px solid;" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" class="img-responsive" /></a>&nbsp; &nbsp;
				  <center><a href="<?php echo $banner['link2']; ?>"><?php echo $banner['title']; ?> (<span id="jmlchat" ></span>)</a></center>

	
					 <?php if ( !empty($_COOKIE['KeyNote']) ) { ?>
						<audio style="width:0px;">
							<source src="catalog/view/theme/journal2/music/alarm.mp3" type="audio/mpeg">							
						</audio>

						<script>
						setInterval(function()
						{
							var useridkey = localStorage.useridkey;
							var is_partner = localStorage.is_partner;
							var dataString = "useridkey=" + useridkey + "&is_partner=" + is_partner ;																		
							$.ajax({
								type: "POST",
								url: "https://gudangmaterials.id/api4/android/index.php/notifikasi/profile2/",			
								data: dataString,								
								success:function(data)            {
									if(data>0)
									{
										$("#jmlchat").html(data);
										$("#jmlchat").show(); 
										$('audio')[0].play();
									}
									else
									{
									   $("#jmlchat").hide(); 
									   $('audio')[0].pause();
									}
									console.log(data);
								}
								 
							});
						}, 5000); //10000 milliseconds = 10 seconds
						</script>
					<?php } ?>	 	


				<?php } else { ?>
				  <a href="<?php echo $banner['link2']; ?>"><img src="<?php echo $banner['image']; ?>" style="border: 0px solid;" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" class="img-responsive" /></a>&nbsp; &nbsp;
				  <center><font size="2"  color="black"><a href="<?php echo $banner['link']; ?>"><?php echo $banner['title']; ?></a></font></center> 
				<?php } ?>	 
			<?php } ?>		 	  
	  
	<?php } ?>
	  	  
    </div>
	
  </div> 
  <?php } ?>


</div></div></div>

