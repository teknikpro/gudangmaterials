<div class="container"><?php if ($heading_title) { ?>
<h3 class="deals-title"><span><?php echo $heading_title; ?></span></h3>
<?php } ?>
<?php if (count($banners) >2) { ?>
<?php $small_class = 4 ?>
<?php } else { ?>
<?php $small_class = 6 ?>
<?php } ?>
<div class="row">
  <?php foreach ($banners as $banner) { ?>  
	  <!--<div class="product-layout col-lg-<?php echo $banner['grid_size']; ?> col-md-<?php echo $banner['grid_size']; ?> col-sm-<?php echo $small_class; ?> col-xs-6">-->
      <div class="product-layout col-lg-2 col-md-4 col-sm-6 col-xs-6">
	  <div class="product-thumb banner transition">
		  <div class="image">
			<?php if ($banner['link']) { ?>
			<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
			<?php } else { ?>
			<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
			<?php } ?>
            <strong><font size="1"  color="black"><?php echo $banner['title']; ?></font></strong><br>

			<?php if ($banner['title'] <> "Meteran Karet C8" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList7" size="1"><option value="http://localhost/index.php?route=product/search&amp;search=meteran%20karet%20C8%25bandung">Bandung</option></select><button type="button" data-toggle="tooltip" onclick="goTo7();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>		
			<?php } ?>

			<?php if ($banner['title'] <> "Meteran Karet C17" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList8" size="1"><option value="http://localhost//index.php?route=product/search&amp;search=meteran%25C17%25bandung">Bandung</option></select><button type="button" data-toggle="tooltip" onclick="goTo8();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>

			<?php if ($banner['title'] <> "Waterpass Aluminium Silver" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">Region</span></strong>&nbsp;:</span><select id="urlList9" size="1"><option value="http://localhost//index.php?route=product/search&amp;search=waterpass%25aluminium%25silver%25bandung">Bandung</option> </select><button type="button" data-toggle="tooltip" onclick="goTo9();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>

			<?php if ($banner['title'] <> "Siku Tukang 25 cm" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">Region</span></strong>:</span><select id="urlList10" size="1"><option value="http://localhost//index.php?route=product/search&amp;search=siku%25tukang%2525%25bandung">Bandung</option></select><button type="button" data-toggle="tooltip" onclick="goTo10();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>
			
			<?php if ($banner['title'] <> "Siku Tukang 30 cm" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList11" size="1"><option value="http://localhost//index.php?route=product/search&amp;search=siku%25tukang%2530%25bandung">Bandung</option></select><button type="button" data-toggle="tooltip" onclick="goTo11();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>

			<?php if ($banner['title'] <> "Gunting Seng" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList12" size="1"><option value="http://localhost//index.php?route=product/search&amp;search=gunting%25seng%25bandung">Bandung</option></select><button type="button" data-toggle="tooltip" onclick="goTo12();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?> 

			<?php if ($banner['title'] <> "Eter Atap Gelombang" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">Region</span></strong>:</span><select id="urlList" size="1"><option value="http://localhost//index.php?route=product/search&amp;search=eter%2514%25bandung">Bandung</option><option value="http://localhost//index.php?route=product/search&amp;search=eter%2514%25cirebon">Cirebon</option> </select><button type="button" data-toggle="tooltip" onclick="goTo();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>

			<?php if ($banner['title'] <> "Asbes Shica Flex" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">Region</span></strong>:</span><select id="urlList2" size="1"><option value="http://localhost//index.php?route=product/search&amp;search=asbes%25shica%25karawang">Karawang</option></select><button type="button" data-toggle="tooltip" onclick="goTo2();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>			

			<?php if ($banner['title'] <> "Tripilar Asbes 80X80" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList3" size="1"><option value="http://localhost//index.php?route=product/search&amp;search=tripilar%25asbes%25bandung">Bandung</option> </select><button type="button" data-toggle="tooltip" onclick="goTo3();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>

			<?php if ($banner['title'] <> "KalsiFloor 20" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList4" size="1"><option value="http://localhost//index.php?route=product/search&amp;search=kalsifloor%2520%25bandung">Bandung</option><option value="http://localhost//index.php?route=product/search&amp;search=kalsifloor%2520%25cirebon">Cirebon</option> </select><button type="button" data-toggle="tooltip" onclick="goTo4();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>

			<?php if ($banner['title'] <> "KalsiClad 10" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList5" size="1"><option value="http://localhost//index.php?route=product/search&amp;search=kalsiclad%2510%25bandung">Bandung</option></select><button type="button" data-toggle="tooltip" onclick="goTo5();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>

			<?php if ($banner['title'] <> "KalsiPlank 8" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList6" size="1"><option value="http://localhost//index.php?route=product/search&amp;search=kalsiplank%208%25bandung">Bandung</option><option value="http://localhost//index.php?route=product/search&amp;search=kalsiplank%208%25cirebon">Cirebon</option> </select><button type="button" data-toggle="tooltip" onclick="goTo6();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>

			<?php if ($banner['title'] <> "A Plus Cornice Adhesive" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList13" size="1"><option value="http://localhost//index.php?route=product/search&search=aplus%25cornice%25karawang">Karawang</option></select><button type="button" data-toggle="tooltip" onclick="goTo13();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>

			<?php if ($banner['title'] <> "Toyo Mortar 168" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList14" size="1"><option value="http://localhost//index.php?route=product/search&search=toyo%25mortar%25168%25cirebon">Cirebon</option><option value="http://localhost//index.php?route=product/search&search=toyo%25mortar%25168%25karawang">Karawang</option></select><button type="button" data-toggle="tooltip" onclick="goTo14();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>
			
			<?php if ($banner['title'] <> "Ultramix Mortar" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList15" size="1"><option value="http://localhost//index.php?route=product/search&search=ultramix%25100%25bandung">Bandung</option>
			<option value="http://localhost//index.php?route=product/search&search=ultramix%25100%25cirebon">Cirebon</option><option value="http://localhost//index.php?route=product/search&search=ultramix%25100%25karawang">Karawang</option></select><button type="button" data-toggle="tooltip" onclick="goTo15();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>

			<?php if ($banner['title'] <> "Yoshino Cornice Compound" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList16" size="1"><option value="http://localhost//index.php?route=product/search&search=yoshino%25cornice%25compound%25jakarta">Jakarta</option>	</select><button type="button" data-toggle="tooltip" onclick="goTo16();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>

			<?php if ($banner['title'] <> "Yoshino GL Bon" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList17" size="1"><option value="http://localhost//index.php?route=product/search&search=yoshino%25gl%25bond%25jakarta">Jakarta</option>	</select><button type="button" data-toggle="tooltip" onclick="goTo17();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>			

			<?php if ($banner['title'] <> "Mortar Utama 380 Perekat" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList18" size="1"><option value="http://localhost//index.php?route=product/search&search=mu%25380%25karawang">Karawang</option>	</select><button type="button" data-toggle="tooltip" onclick="goTo18();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>

			<?php if ($banner['title'] <> "SCG Semen" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList19" size="1"><option value="http://localhost//index.php?route=product/search&search=semen%25scg%25bandung">Bandung</option>	</select><button type="button" data-toggle="tooltip" onclick="goTo19();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>
			
			<?php if ($banner['title'] <> "Tiga Roda Semen" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList20" size="1"><option value="http://localhost//index.php?route=product/search&search=semen%25tiga%25roda%25bandung">Bandung</option>	</select><button type="button" data-toggle="tooltip" onclick="goTo20();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>

			<?php if ($banner['title'] <> "Tangga Aluminium Fortuna" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList21" size="1"><option value="http://localhost//index.php?route=product/search&search=tangga%25alumunium%25bandung">Bandung</option>	</select><button type="button" data-toggle="tooltip" onclick="goTo21();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>

			<?php if ($banner['title'] <> "Indoboard" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList22" size="1"><option value="http://localhost//index.php?route=product/search&search=indoboard%25bandung">Bandung</option><option value="http://localhost//index.php?route=product/search&search=indoboard%25cirebon">Cirebon</option></select><button type="button" data-toggle="tooltip" onclick="goTo22();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>
			
			<?php if ($banner['title'] <> "Jayaboard Sheetrock" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList23" size="1"><option value="http://localhost/index.php?route=product/search&search=jayaboard%25sheetrock%25bandung">Bandung</option>			<option value="http://localhost/index.php?route=product/search&search=jayaboard%25sheetrock%25cirebon">Cirebon</option>			<option value="http://localhost/index.php?route=product/search&search=jayaboard%25sheetrock%25karawang">Karawang</option>	</select><button type="button" data-toggle="tooltip" onclick="goTo23();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>

			<?php if ($banner['title'] <> "Yoshino Gypsum" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList24" size="1"><option value="http://localhost//index.php?route=product/search&search=yoshino%25gypsum%25jabodetabek">Jakarta</option>			</select><button type="button" data-toggle="tooltip" onclick="goTo24();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>

			<?php if ($banner['title'] <> "Aplus Gypsum" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList25" size="1"><option value="http://localhost//index.php?route=product/search&search=aplus%25gypsum%25karawang">Karawang</option>			</select><button type="button" data-toggle="tooltip" onclick="goTo25();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>			

			<?php if ($banner['title'] <> "Cornice Compound" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList26" size="1"><option value="http://localhost//index.php?route=product/search&search=cornice%25compound%25bandung">Bandung</option>			
			<option value="http://localhost//index.php?route=product/search&search=cornice%25compound%25cirebon">Cirebon</option>
			</select><button type="button" data-toggle="tooltip" onclick="goTo26();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>			

			<?php if ($banner['title'] <> "Liss Casting" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList27" size="1"><option value="http://localhost//index.php?route=product/search&search=liss%25casting%25bandung">Bandung</option>			
			<option value="http://localhost//index.php?route=product/search&search=liss%25casting%25cirebon">Cirebon</option>
			</select><button type="button" data-toggle="tooltip" onclick="goTo27();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>	
			
			<?php if ($banner['title'] <> "Screw X-083" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList28" size="1"><option value="http://localhost//index.php?route=product/search&search=screw%25x%2583%25cirebon">Cirebon</option></select><button type="button" data-toggle="tooltip" onclick="goTo28();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>	

			<?php if ($banner['title'] <> "Kalsi Ecoplus" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList29" size="1"><option value="http://localhost//index.php?route=product/search&search=kalsi%25ecoplus%25cirebon">Cirebon</option>
			<option value="http://localhost//index.php?route=product/search&search=kalsi%25ecoplus%25karawang">Karawang</option>
			</select><button type="button" data-toggle="tooltip" onclick="goTo29();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>	

			<?php if ($banner['title'] <> "KalsiBoard LIng 3.5" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList30" size="1"><option value="http://localhost//index.php?route=product/search&search=kalsi%253.5%25bandung">Bandung</option>
			<option value="http://localhost//index.php?route=product/search&search=kalsi%253.5%25cirebon">Cirebon</option>
			</select><button type="button" data-toggle="tooltip" onclick="goTo30();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>	

			<?php if ($banner['title'] <> "KalsiBoard LIng 4" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList31" size="1"><option value="http://localhost//index.php?route=product/search&search=kalsi%25ling%254%25bandung">Bandung</option>
			<option value="http://localhost//index.php?route=product/search&search=kalsi%25ling%254%25cirebon">Cirebon</option>
			</select><button type="button" data-toggle="tooltip" onclick="goTo31();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>				

			<?php if ($banner['title'] <> "KalsiBoard LIng 6" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList32" size="1"><option value="http://localhost//index.php?route=product/search&search=kalsi%25ling%256%25bandung">Bandung</option>
			<option value="http://localhost//index.php?route=product/search&search=kalsi%25ling%256%25cirebon">Cirebon</option>
			</select><button type="button" data-toggle="tooltip" onclick="goTo32();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>				
			
			<?php if ($banner['title'] <> "UB Tape" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList33" size="1"><option value="http://localhost//index.php?route=product/search&search=ub%25tape%25bandung">Bandung</option>
			</select><button type="button" data-toggle="tooltip" onclick="goTo33();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>					
			
			<?php if ($banner['title'] <> "Kalsi Screw FL" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList34" size="1"><option value="http://localhost/index.php?route=product/search&search=screw%25fl%25bandung">Bandung</option>
			</select><button type="button" data-toggle="tooltip" onclick="goTo34();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>		

			<?php if ($banner['title'] <> "Kalsi Screw PC" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList35" size="1"><option value="http://localhost/index.php?route=product/search&search=screw%25pc%25bandung">Bandung</option>
			</select><button type="button" data-toggle="tooltip" onclick="goTo35();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>	
			
			<?php if ($banner['title'] <> "Hollow Rangka Metal" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList36" size="1"><option value="http://localhost//index.php?route=product/search&search=hollow%25bandung">Bandung</option>
			<option value="http://localhost//index.php?route=product/search&search=hollow%25cirebon">Cirebon</option>
			</select><button type="button" data-toggle="tooltip" onclick="goTo36();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>				
			
			<?php if ($banner['title'] <> "Wasser Jet Shower" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList37" size="1"><option value="http://localhost//index.php?route=product/search&search=jet%25shower%25bandung">Bandung</option>
			</select><button type="button" data-toggle="tooltip" onclick="goTo37();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>			

			<?php if ($banner['title'] <> "KalsiBoard LIng 4.5" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList38" size="1"><option value="http://localhost/index.php?route=product/search&search=kalsiboard%25ling%254.5%25bandung">Bandung</option>
			</select><button type="button" data-toggle="tooltip" onclick="goTo38();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>		

			<?php if ($banner['title'] <> "KalsiPart 8" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList39" size="1"><option value="http://localhost/index.php?route=product/search&search=kalsipart%258%25bandung">Bandung</option>
			<option value="http://localhost/index.php?route=product/search&search=kalsipart%258%25cirebon">Cirebon</option>
			</select><button type="button" data-toggle="tooltip" onclick="goTo39();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>			
			
			<?php if ($banner['title'] <> "Wetarea" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList40" size="1"><option value="http://localhost/index.php?route=product/search&search=wetarea%25bandung">Bandung</option>
			</select><button type="button" data-toggle="tooltip" onclick="goTo40();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>			

			<?php if ($banner['title'] <> "Bor Bitec IDM 130 RE" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList41" size="1"><option value="http://localhost/index.php?route=product/search&search=bor%25bitec%25bandung">Bandung</option>
			</select><button type="button" data-toggle="tooltip" onclick="goTo41();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>			
			
			<?php if ($banner['title'] <> "Mesin Ampelas Mod M-2540" ) { ?>
			<?php } else { ?>
			<span style="font-size:10px;"><strong><span style="color:#FF0000;">&nbsp;Region</span></strong>:</span><select id="urlList42" size="1"><option value="http://localhost/index.php?route=product/search&search=mesin%25ampelas%25bandung">Bandung</option>
			</select><button type="button" data-toggle="tooltip" onclick="goTo42();" data-original-title="" title="" style="border:none;"><font size="3" style="color:#F97001"> <i class="fa fa-chevron-circle-left"></i></font> </button>
			<?php } ?>						
			
			</div>
		  <?php if($title_status) { ?>
		  <div class="category-title <?php echo $title_class;?>">
			<h4><a href="<?php echo $banner['link']; ?>"><?php echo $banner['title']; ?></a></h4>
		  </div>
		  <?php } ?>
		</div>
	  </div>
	  <?php } ?>
</div>
</div>



<!--end hok banner row-->

<script type="text/javascript">function goTo7() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList7');} else if(document.all) {sE = document.all['urlList7'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo8() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList8');} else if(document.all) {sE = document.all['urlList8'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo9() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList9');} else if(document.all) {sE = document.all['urlList9'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo10() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList10');} else if(document.all) {sE = document.all['urlList10'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo11() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList11');} else if(document.all) {sE = document.all['urlList11'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo12() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList12');} else if(document.all) {sE = document.all['urlList12'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList');} else if(document.all) {sE = document.all['urlList'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo2() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList2');} else if(document.all) {sE = document.all['urlList2'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo3() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList3');} else if(document.all) {sE = document.all['urlList3'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo4() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList4');} else if(document.all) {sE = document.all['urlList4'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo5() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList5');} else if(document.all) {sE = document.all['urlList5'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo6() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList6');} else if(document.all) {sE = document.all['urlList6'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo13() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList13');} else if(document.all) {sE = document.all['urlList13'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo14() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList14');} else if(document.all) {sE = document.all['urlList14'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo15() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList15');} else if(document.all) {sE = document.all['urlList15'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo16() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList16');} else if(document.all) {sE = document.all['urlList16'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo17() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList17');} else if(document.all) {sE = document.all['urlList17'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo18() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList18');} else if(document.all) {sE = document.all['urlList18'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo19() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList19');} else if(document.all) {sE = document.all['urlList19'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo20() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList20');} else if(document.all) {sE = document.all['urlList20'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo21() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList21');} else if(document.all) {sE = document.all['urlList21'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo22() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList22');} else if(document.all) {sE = document.all['urlList22'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo23() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList23');} else if(document.all) {sE = document.all['urlList23'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo24() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList24');} else if(document.all) {sE = document.all['urlList24'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo25() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList25');} else if(document.all) {sE = document.all['urlList25'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo26() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList26');} else if(document.all) {sE = document.all['urlList26'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo27() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList27');} else if(document.all) {sE = document.all['urlList27'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo28() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList28');} else if(document.all) {sE = document.all['urlList28'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo29() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList29');} else if(document.all) {sE = document.all['urlList29'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo30() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList30');} else if(document.all) {sE = document.all['urlList30'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo31() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList31');} else if(document.all) {sE = document.all['urlList31'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo32() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList32');} else if(document.all) {sE = document.all['urlList32'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo33() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList33');} else if(document.all) {sE = document.all['urlList33'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo34() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList34');} else if(document.all) {sE = document.all['urlList34'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo35() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList35');} else if(document.all) {sE = document.all['urlList35'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo36() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList36');} else if(document.all) {sE = document.all['urlList36'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo37() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList37');} else if(document.all) {sE = document.all['urlList37'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo38() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList38');} else if(document.all) {sE = document.all['urlList38'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo39() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList39');} else if(document.all) {sE = document.all['urlList39'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo40() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList40');} else if(document.all) {sE = document.all['urlList40'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo41() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList41');} else if(document.all) {sE = document.all['urlList41'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo42() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList42');} else if(document.all) {sE = document.all['urlList42'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
<script type="text/javascript">function goTo43() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList43');} else if(document.all) {sE = document.all['urlList43'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script><script type="text/javascript">function goTo44() {var sE = null, url;if(document.getElementById) {sE = document.getElementById('urlList44');} else if(document.all) {sE = document.all['urlList44'];}if(sE && (url = sE.options[sE.selectedIndex].value)) {location.href = url;}}</script>
