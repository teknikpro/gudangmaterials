<?php 
// if ($_SERVER["SERVER_NAME"] == "gudangmaterials.id")
//{
//header("Location: https://gudangmaterials.id/portal.html");
//die();
//}
?><!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>-->
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700,400italic&amp;subset=latin,cyrillic' rel='stylesheet' type='text/css'>

<link rel="stylesheet"  href="catalog/view/theme/theme505/js/fancybox/jquery.fancybox.css" media="screen" />
<link href="catalog/view/theme/theme505/stylesheet/livesearch.css" rel="stylesheet">
<link href="catalog/view/theme/theme505/stylesheet/photoswipe.css" rel="stylesheet">
<link href="catalog/view/theme/theme505/js/jquery.bxslider/jquery.bxslider.css" rel="stylesheet">
<link href="catalog/view/theme/theme505/stylesheet/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/theme505/stylesheet/superfish.css" rel="stylesheet">
<link href="catalog/view/theme/theme505/stylesheet/responsive.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/theme/theme505/js/common.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme505/js/tm-stick-up.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme505/js/jquery.unveil.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme505/js/jquery.bxslider/jquery.bxslider.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme505/js/fancybox/jquery.fancybox.pack.js"></script>
<script src="catalog/view/theme/theme505/js/elavatezoom/jquery.elevatezoom.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme505/js/superfish.js" type="text/javascript"></script>
<!--video script-->
<script src="catalog/view/theme/theme505/js/jquery.vide.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme505/js/jquery.touchSwipe.min.js" type="text/javascript"></script>
<!--Green Sock-->
<script src="catalog/view/theme/theme505/js/greensock/jquery.gsap.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme505/js/greensock/TimelineMax.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme505/js/greensock/TweenMax.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme505/js/greensock/jquery.scrollmagic.min.js" type="text/javascript"></script>

<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>

<!--photo swipe-->
<script src="catalog/view/theme/theme505/js/photo-swipe/klass.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme505/js/photo-swipe/code.photoswipe.jquery-3.0.5.js" type="text/javascript"></script>
<script src="catalog/view/theme/theme505/js/photo-swipe/code.photoswipe-3.0.5.min.js" type="text/javascript"></script>

<script src="catalog/view/theme/theme505/js/script.js" type="text/javascript"></script>

<!--custom script-->
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<!--<?php echo $google_analytics; ?>-->

<!--    hpwd - order tracking    -->
 <style type="text/css">
.no-receipt { text-align: center; font-size: 14px; padding-top: 10px; }

.li.complete .status {
    border-top: 2px solid <?php echo $hp_tracking_color_scheme;?>;
}

.item.active>span {
    background: <?php echo $hp_tracking_color_scheme;?>;
}

.li.complete .status span {
    background-color: <?php echo $hp_tracking_color_scheme;?>;
    border: none;
    transition: all 200ms ease-in;
}
        
.li .status span i.fa { 
    color: #fff; 
        padding: 14px;
    padding-left: 12px;
    font-size: 2em; }    

.hpot-phone-view-complete{
    background-color: <?php echo $hp_tracking_color_scheme;?>;
    padding:10px;
    border-radius:50%;
    color:white;
}
.hpot-phone-view{
    background-color: #eee;
    padding:10px;
    border-radius:50%;
    color:white;
}
          
.shipment-status-mobile span:after {
    height: 2px;
    content: '';
    position: absolute;
    background-color: #eee;
    top: 10px;
    left: 0;
    z-index: -1;
    width: 100%;
}
.shipment-status-mobile center { width: 250px; margin: 0 auto; position: relative; }
   
.shipment-status-mobile span { margin-right: 10px; }     

.shipment-status-mobile span:last-child:after {
content: none; }  
    </style>

</head>
<body class="<?php echo $class; ?>">
<!-- swipe menu -->
<?php 
 if ($_SERVER["SERVER_NAME"] == "gudangmaterials.id") {
?>
<div class="swipe">
	<div class="swipe-menu">
		<ul>
			
			<li><i class="fa fa-shopping-cart"></i> <span>Bandung</span></li>
					<li><i class="fa fa-shopping-cart"></i> <span>Karawang</span></li>
<li><i class="fa fa-shopping-cart"></i> <span>Cirebon</span></li>
		</ul>
	        <?php if ($maintenance == 0){ ?>
		<ul class="foot">
			<?php if ($informations) { ?>
			<?php foreach ($informations as $information) { ?>
			<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
			<?php } ?>
			<?php } ?>
		</ul>
		<?php } ?>
		<ul class="foot foot-1">
			<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
			<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
			<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
		</ul>		
		
		<ul class="foot foot-3">
		
			<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
		</ul>
	</div>
</div>
<?php } else { ?>
<div class="swipe">
	<div class="swipe-menu">
		<ul>
			
			<li><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"><i class="fa fa-user"></i> <span><?php echo $text_account; ?></span></a></li>
			<?php if ($logged) { ?>
			<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
			<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
			<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
			<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
			<?php } else { ?>
			<li><a href="<?php echo $register; ?>"><i class="fa fa-user"></i> <?php echo $text_register; ?></a></li>
			<li><a href="<?php echo $login; ?>"><i class="fa fa-lock"></i><?php echo $text_login; ?></a></li>
			<?php } ?>
			<li><a href="<?php echo $wishlist; ?>" id="wishlist-total2" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span><?php echo $text_wishlist; ?></span></a></li>
			<li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span><?php echo $text_shopping_cart; ?></span></a></li>
			<li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span><?php echo $text_checkout; ?></span></a></li>
		</ul>
		<?php if ($maintenance == 0){ ?>
		<ul class="foot">
			<?php if ($informations) { ?>
			<?php foreach ($informations as $information) { ?>
			<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
			<?php } ?>
			<?php } ?>
		</ul>
		<?php } ?>
		<ul class="foot foot-1">
			<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
			<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
			<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
		</ul>
		
		<ul class="foot foot-2">
			<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
			<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
			<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
			<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
		</ul>
		<ul class="foot foot-3">
			<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
			<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
		</ul>
	</div>
</div>
<?php } ?>
<div id="page">
<div class="shadow"></div>
<div class="toprow-1">
	<a class="swipe-control" href="#"><i class="fa fa-align-justify"></i></a>
</div>

<header>
	<div class="top-panel">
		<div class="container">
			<?php echo $currency; ?>
			<?php echo $language; ?>
		</div>
	</div>	
	
	<div id="logo-block">
	<div class="container">		
		<div id="logo">
			<?php if ($logo) { ?>
			<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
			<?php } else { ?>
			<h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
			<?php } ?>
		</div>
<?php 
 if ($_SERVER["SERVER_NAME"] != "gudangmaterials.id") {
?>
		<div class="box-right">
			<?php echo $cart; ?>
			<div class="register-top">
				<a class="button-register" href="<?php echo $register; ?>"><i class="fa fa-user"></i><?php echo $text_register; ?></a>
				<?php if ($logged) { ?>
					<a href="<?php echo $logout; ?>"><i class="fa fa-unlock"></i><?php echo $text_logout; ?></a>
				<?php } else { ?>
					<a href="<?php echo $login; ?>"><i class="fa fa-lock"></i><?php echo $text_login; ?></a>
				<?php } ?>
			</div>
		</div>
<?php } ?>
		</div>
	</div>
	<?php if ($categories) { ?>
	<div class="container">
		<div class="row">

		<div id="tm_menu" class="col-sm-3 hidden-sm">			
			<ul class="menu"><li><a class="button-category sf-with-ul" ><?php if (true || $_SERVER["SERVER_NAME"] != "gudangmaterials.id") echo $text_category; else echo "Pilih Wilayah"; ?><i class="fa fa-bars"></i></a><?php if (true || (($_SERVER["SERVER_NAME"] != "gudangmaterials.id") && $categories)) {  echo $categories; }
else
{
echo "<ul class=\"menu\" style=\"display: none;\">";
 echo "<li>Bandung</li>";
 echo "<li>Karawang</li>";
 echo "<li>Cirebon</li>";

} ?></li></ul>
		</div>

		<div class="col-sm-9 block-menu">
			<div>		
			<div id="top-links" class="nav pull-left">
				<ul class="list-inline">

		<?php if($link_order_status) { ?> 
 		 <li><a href="<?php echo $link_order_status; ?>" title="<?php echo $text_order_status; ?>"><i class="fa fa-truck"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_order_status; ?></span></a></li>
		<?php } ?>
			
					<li class="first"><a href="<?php echo $home; ?>"><i class="fa fa-home hidden-md hidden-lg"></i><span class="hidden-sm"><?php echo $text_home; ?></span></a></li>
					<!--li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart hidden-md hidden-lg"></i> <span class="hidden-sm"><?php echo $text_wishlist; ?></span></a></li-->

<li><a href="/index.php?route=information/information&information_id=12"><span class="hidden-sm">Profil</span></a></li>
<li><a href="/index.php?route=product/allproduct"><span class="hidden-sm">Produk</span></a></li>
<li><a href="/index.php?route=information/information&information_id=13"><span class="hidden-sm">Cara Order</span></a></li>
<li><a href="/index.php?route=information/contact"><span class="hidden-sm">Kontak</span></a></li>
<li><a href="/index.php?route=information/information&information_id=14"><span class="hidden-sm">DIY Project</span></a></li>
<li><a href="/index.php?route=information/news"><span class="hidden-sm">Berita</span></a></li>
<li><a href="/index.php?route=information/information&information_id=15"><span class="hidden-sm">Wilayah Pembelian</span></a></li>

<!--
<li><a href="http://tradelinkbdg.intrahive.com"><span class="hidden-sm">Bandung</span></a>

</li>
<li><a href="http://tradelinkkrw.intrahive.com"><span class="hidden-sm">Karawang</span></a></li>
<li><a href="http://tradelinkcrb.intrahive.com"><span class="hidden-sm">Cirebon</span></a></li>
					<li><a href="<?php echo $account; ?>"><i class="fa fa-user hidden-md hidden-lg"></i><span class="hidden-sm"><?php echo $text_account; ?></span></a></li>				
					<li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart hidden-md hidden-lg"></i> <span class="hidden-sm"><?php echo $text_shopping_cart; ?></span></a></li>
					<li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"> <i class="fa fa-share hidden-md hidden-lg"></i><span class="hidden-sm"><?php echo $text_checkout; ?></span></a></li>

-->
				</ul>
			</div>
			<?php echo $search; ?>
			</div>
		</div>
		</div>
	</div>
	<?php } ?>
</header>
<?php if ($categories) { ?>
<div class="container">
	<div id="menu-gadget">
		<div id="menu-icon"><?php echo $text_category; ?></div>
		<?php if ($categories) {  echo $categories; } ?>
	</div>
</div>
<?php } ?>
  
<p id="back-top"> <a href="#top"><span></span></a> </p>
