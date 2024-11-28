<style>
.bannergroup, .bannergroup > * {
    box-sizing: border-box;
}
.bannergroup:before, .bannergroup:after, .bannergroup > *:before, .bannergroup > *:after  {
    box-sizing: border-box;
}
.bannergroup:before,
.bannergroup:after {
  display: table;
  content: " ";
}
.bannergroup:after,
.bannergroup:after {
  clear: both;
}
.bannergroup > div { float: left; }
.bannergroup img { width: 100%; image-rendering: optimizeQuality; }
<?php if ($remove_left == 1) { ?>
.bannergroup div:first-child { padding-left: 0!important;}
<?php } ?>
<?php if ($remove_right == 1) { ?>
.bannergroup div:last-child { padding-right: 0!important;}
<?php } ?>
@media screen and (max-width: 480px) {
.bannergroup > div { width: 100%!important; }
}
</style>
<?php switch ($banner_num) {
        case "1":
            $width = '100%';
            break; 
        case "2":
        	$width = '50%';
            break;
        case "3":
        	$width = '33.33333%';
            break;
        case "4": 
        	$width = '25%';
        	break;
        case "5":
        	$width = '20%';
        	break;
        case "6":
        	$width = '16.66666%';
        	break;
        }
?>
<div class="bannergroup">
    <?php foreach ($banners as $banner) { ?>
    	<div style="width: <?php echo $width; ?>; padding: <?php echo $toppadding; ?>px <?php echo $rightpadding; ?>px <?php echo $bottompadding; ?>px <?php echo $leftpadding; ?>px;"> 
            <?php if ($banner['link']) { ?>
                <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a>
            <?php } else { ?>
                    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" />
            <?php } ?>
			<center><strong><font size="3" color="black"><?php echo $banner['title']; ?></font></strong></center>
        </div>        
    <?php } ?>
</div>