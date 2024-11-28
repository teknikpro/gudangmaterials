
<?php echo $header; ?>
<div id="container" class="container j-container success-page">
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
    <div id="content" class="<?php echo $class; ?>"><!--<?php echo $content_top; ?>
      <h1 class="heading-title"><?php echo $heading_title; ?></h1>-->
      <center><strong><?php echo $text_message; ?></strong></center>
      
      </div>
    </div>
</div> 


<?php echo $footer; ?>


<!--<script src="catalog/view/theme/journal2/js/main.js"></script> -->