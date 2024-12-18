<?php echo $header; ?>
<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
       <center><h1><?php echo $heading_title; ?></h1> </center></br>
      <table class="table table-bordered table-striped table-hover">
	    <thead>
		  <tr>
			<th></th>
			<th><?php echo $text_title; ?></th>
			<th><?php echo $text_description; ?></th>
			<th><?php echo $text_date; ?></th>
			<th class="text-right"></th>
		  </tr>
		</thead>
		<tbody>
		<?php foreach ($all_promo as $promo) { ?>
		  <tr>
		   <td style="vertical-align:middle" class="text-center"><img src="<?php echo $promo['image']; ?>" /></td>
		   <td style="vertical-align:middle"><?php echo $promo['title']; ?></td>
		   <td style="vertical-align:middle"><?php echo $promo['description']; ?></td>
		   <td style="vertical-align:middle"><?php echo $promo['date_added']; ?></td>
		   <td style="vertical-align:middle" class="text-right"><a href="<?php echo $promo['view']; ?>"><?php echo $text_view; ?></a></td>
		  </tr>
		<?php } ?>
		</tbody>
	  </table>
	  <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
	  <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 