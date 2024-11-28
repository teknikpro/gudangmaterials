<?php echo $header; ?>
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
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2 class="secondary-title"><?php echo $heading_title; ?></h2>
      <?php if ($downloads) { ?>
      <div class="content">
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-right"><strong><font size="3" color="black"><?php echo $column_order_id; ?></font></strong></td>
            <td class="text-left"><strong><font size="3" color="black"><?php echo $column_name; ?></font></strong></td>
            <td class="text-left"><strong><font size="3" color="black"><?php echo $column_size; ?></font></strong></td>
            <td class="text-left"><strong><font size="3" color="black"><?php echo $column_date_added; ?></font></strong></td>
            <td></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($downloads as $download) { ?>
          <tr>
            <td class="text-right"><?php echo $download['order_id']; ?></td>
            <td class="text-left">		
		<!--<?php echo $download['name']; ?></br><b><?php echo $description; ?> </b><?php echo $download['description']; ?>-->
		<font size="4"  style="color:#F97001"><?php echo $download['description']; ?></font>
		</td>
            <td class="text-left"><?php echo $download['size']; ?></td>
            <td class="text-left"><?php echo $download['date_added']; ?></td>
            <td><a href="<?php echo $download['href']; ?>" data-toggle="tooltip" title="<?php echo $button_download; ?>" class="btn btn-primary"><i class="fa fa-cloud-download"></i></a></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      </div>
      <?php } else { ?>
      <p class="not_found"><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary button"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    </div>
</div>
<?php echo $footer; ?>
