<div id="cs-<?php echo $module; ?>" class="cs-<?php echo $module_id; ?> box custom-sections section-product <?php echo implode(' ', $disable_on_classes); ?> <?php echo $single_class; ?> <?php echo $show_title_class; ?> <?php echo isset($gutter_on_class) ? $gutter_on_class : ''; ?>" style="<?php echo isset($css) ? $css : ''; ?>">
  <?php if($heading_title) { ?>
    <!--<h2><?php echo $heading_title; ?></h2>-->
  <?php } ?>
  
			<h3 style="text-align: center;"> Cek Resi Pengiriman Barang </h3>
			<center><div id="cekresicom_id" ></div></center>
			<script type="text/javascript" src="https://cekresi.com/widget/widgetcekresicom_v1.js"></script>
			<script type="text/javascript">
			init_widget_cekresicom('w3',370,80)
			</script>
  
</div>
