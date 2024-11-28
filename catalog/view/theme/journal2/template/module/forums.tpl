<?php echo $header; ?>
<div class="container">

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


  <div class="container-fluid">
  
    <div class="panel panel-default">
	
      <div class="panel-heading">

        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title; ?><span style="float:right;" title="Go back"><a href="<?php echo $base; ?>index.php?route=module/forum/addTopic" title="Add Topic">Start Discussion</a></span></h3>
	  <?php if ($success) { ?>
		<div class="success"><?php echo $success; ?></div>
	<?php } ?>	
      </div>

      <div class="panel-body">

        

          <div class="table-responsive Flipped">

            <table class="table table-bordered table-hover Contentt">
			  <thead>
				<tr>
				  <th>Topics</th>
				  <th>Posted On</th>
				  <th>Replies</th>
				  <th>Views</th>
				</tr>
			  </thead>

		   <tbody>	 
			  <?php if(!empty($forumdata)) { ?>
				<?php for($i=0;$i<count($forumdata);$i++) { ?>
				<tr>
				  <td><a href="<?php print $base; ?>index.php?route=module/forum/getForum&forum_id=<?php print $forumdata[$i]['forum_id']; ?>"><?php print $forumdata[$i]['name']; ?></a><div class="author"><?php if($forumdata[$i]['username'] == '') { print 'by admin'; } else { print ' by '.$forumdata[$i]['username']; } ?></div></td>
				  <td><?php print date('M d, Y h:i a', strtotime($forumdata[$i]['date'])); ?></td>
				  <td><?php print $forumdata[$i]['reply']; ?></td>
				  <td><?php print $forumdata[$i]['views']; ?></td>
				</tr>
				<?php } ?>
			  <?php } else { ?>
				<tr><td colspan="4" style="text-align:center;">No Results Found!</td></tr>
			  <?php } ?>	
		  </tbody>

            </table>

          </div>

        
		<div class="buttons clearfix">
			<div class="row">

			  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>

			  <div class="col-sm-6 text-right"><?php echo $results; ?></div>

			</div>
		</div>

      </div>

    </div>

  </div>
<?php echo $content_bottom; ?>
  </div><?php echo $column_right; ?>
</div>

<?php echo $footer; ?> 