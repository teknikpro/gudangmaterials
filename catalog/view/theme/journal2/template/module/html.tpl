<div id="cs-<?php echo $module; ?>" class="cs-<?php echo $module_id; ?> box custom-sections section-product <?php echo implode(' ', $disable_on_classes); ?> <?php echo $single_class; ?> <?php echo $show_title_class; ?> <?php echo isset($gutter_on_class) ? $gutter_on_class : ''; ?>" style="<?php echo isset($css) ? $css : ''; ?>">
  <?php if($heading_title) { ?>
    <!--<h2><?php echo $heading_title; ?></h2>-->
  <?php } ?>
  <?php echo $html; ?>
</div>
