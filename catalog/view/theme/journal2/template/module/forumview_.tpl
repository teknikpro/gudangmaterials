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

        <h3 class="panel-title"><i class="fa fa-list"></i>  <?php echo $heading_title; ?><span style="float:right;" title="Go back"><a href="<?php echo $base; ?>index.php?route=module/forum/addTopic" title="Add Topic">Start Discussion</a></span></h3>

      </div>
  <?php if ($success) { ?>

  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>

  <?php } ?>
      <div class="panel-body">

        

          <div class="table-responsive">

  <?php for($i=0;$i<count($forumdata);$i++) { ?>
  <table class="table table-bordered table-hover">
    <tbody>
      <tr style="background: #2094c0;color:#fff;">
        <td><strong><a style="color:#e1e1e1;" href="<?php if($forumdata[$i]['customer_id'] == 0) { print $base.'index.php?route=module/forum/getForums'; } else { print $base.'index.php?route=module/forum/getForums&author_id='.base64_encode($forumdata[$i]['customer_id']); } ?>">
          <?php if($forumdata[$i]['customer_id'] == 0) { print 'Admin'; } else { print $forumdata[$i]['username']; } ?>
          </a>&nbsp;:&nbsp;</strong> <?php print $forumdata[$i]['name']; ?> </td>
        <td> <?php print  date("M d, Y h:i a",strtotime($forumdata[$i]['date'])); ?> </td>
      </tr>
      <tr>
	  <?php 
		$supported_image = array(
		'gif',
		'jpg',
		'jpeg',
		'png'
		);
		$ext = strtolower(pathinfo($forumdata[$i]['avatar'], PATHINFO_EXTENSION));
		if (in_array($ext, $supported_image)) {
		?>
         <td><img style="width:50px; height:50px;" src="<?php print $base.'image/'.$forumdata[$i]['avatar'];  ?>"/> </td>
  <?php } else { ?>
  <td><img style="width:50px; height:50px;" src="image/data/admin.png"/> </td>
  <?php  } ?>
  
		<td><?php print html_entity_decode($forumdata[$i]['description']); ?></td>
		
      </tr>
    </tbody>
  </table>
  <?php } ?>
  <?php $j=1; ?>
  <?php for($i=0;$i<count($forumreplydata);$i++) { ?>
  <table class="table table-bordered table-hover">
    <tbody>
      <tr>
        <td><strong><?php print "  #".$j; ?><?php print " reply on : "; ?></strong> <?php print $forumreplydata[$i]['name']." by "; ?><a href="<?php print $base.'index.php?route=module/forum/getForums&author_id='.base64_encode($forumreplydata[$i]['customer_id']);?>"><?php print $forumreplydata[$i]['username']; ?></a> </td>
        <td><?php print  date("M d, Y h:i a",strtotime($forumreplydata[$i]['date'])); ?> </td>
      </tr>
      <tr>
	  	  <?php 
		$supported_image = array(
		'gif',
		'jpg',
		'jpeg',
		'png'
		);
		$ext = strtolower(pathinfo($forumreplydata[$i]['avatar'], PATHINFO_EXTENSION));
		if (in_array($ext, $supported_image)) {
		?>
         <td><img style="width:50px; height:50px;" src="<?php print $base.'image/'.$forumreplydata[$i]['avatar'];  ?>"/> </td>
  <?php } else { ?>
  <td><img style="width:50px; height:50px;" src="image/data/admin.png"/> </td>
  <?php  } ?>
		
		<td><?php print html_entity_decode($forumreplydata[$i]['reply']); ?></td>
      </tr>
    </tbody>
  </table>
  <?php $j++; ?>
  <?php } ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form"> 
  <?php if($customer_id){ ?>
		<fieldset>

          <legend><?php echo $post_reply; ?></legend>

          <div class="form-group required" style="display:none;">

            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>

            <div class="col-sm-10">

              <input type="text" name="username" value="<?php echo $customer_name;?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" required />
              <input type="text" name="customer_id" value="<?php echo $customer_id;?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" required />
			  <input type="hidden" name="forum_id" value="<?php print $forum_id; ?>" />

            </div>

          </div>
		  
          <div class="form-group required" style="display:none;">

            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>

            <div class="col-sm-10">

              <input type="email" name="email" value="<?php echo $customer_email;?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              <input type="text" name="avatar" value="<?php echo $customer_photo;?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
			  
    
            </div>

          </div>


		  
          <div class="form-group required">

            <label class="col-sm-2 control-label" for="input-tname"><?php echo $entry_topic_reply; ?></label>

            <div class="col-sm-10">
			<textarea class="form-control" name="reply" required></textarea>              
	
            </div>

          </div>

	</fieldset>
  <?php } else { ?>
          <div class="buttons clearfix">


          <div class="pull-right">

            <a href="<?php echo $login_url;?>" class="btn btn-primary">Login to Reply</a>

          </div>

        </div>
  <?php } ?>

  <?php if($customer_id){ ?>
        <div class="buttons clearfix">


          <div class="pull-right">

            <input type="submit" value="Post Reply" class="btn btn-primary" />

          </div>

        </div>
		 <?php } ?>
  </form>

          </div>

      </div>

    </div>

  </div>
<?php echo $content_bottom; ?>
  </div><?php echo $column_right; ?>
</div>

<?php echo $footer; ?> 