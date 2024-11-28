<?php echo $header; ?>

<div class="container">

  <ul class="breadcrumb">

    <?php foreach ($breadcrumbs as $breadcrumb) { ?>

    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>

    <?php } ?>

  </ul>


  <?php if ($success) { ?>

  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>

  <?php } ?>

  <div class="row"><?php echo $column_left; ?>

    <?php if ($column_left && $column_right) { ?>

    <?php $class = 'col-sm-6'; ?>

    <?php } elseif ($column_left || $column_right) { ?>

    <?php $class = 'col-sm-9'; ?>

    <?php } else { ?>

    <?php $class = 'col-sm-12'; ?>

    <?php } ?>

    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>

      <h1><?php echo $heading_title; ?></h1>
      

   <form action="<?php echo $action; ?>" class="form-horizontal" method="post" enctype="multipart/form-data" id="form">
	<fieldset>

          <legend><?php echo $post_topic; ?></legend>

          <div class="form-group required" style="display:none;">

            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>

            <div class="col-sm-10">

              <input type="text" name="username" value="<?php echo $customer_name;?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" required />
              <input type="text" name="customer_id" value="<?php echo $customer_id;?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" required />
			  
              <?php if ($error_username) { ?>

              <div class="text-danger"><?php echo $error_username; ?></div>
			<?php } ?>
            </div>

          </div>
		  
          <div class="form-group required" style="display:none;">

            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>

            <div class="col-sm-10">

              <input type="email" name="email" value="<?php echo $customer_email;?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              <input type="text" name="avatar" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
			  
              <?php if ($error_email) { ?>

              <div class="text-danger"><?php echo $error_email; ?></div>
			<?php } ?>
            </div>

          </div>

		  
          <div class="form-group required">

            <label class="col-sm-2 control-label" for="input-tname"><?php echo $entry_topic_title; ?></label>

            <div class="col-sm-10">

              <input type="text" name="name" value="" placeholder="<?php echo $entry_topic_title;?>" id="input-tname" class="form-control" />
			  
              <?php if ($error_name) { ?>

              <div class="text-danger"><?php echo $error_name; ?></div>
			
				<?php } ?>
            </div>

          </div>
		  
          <div class="form-group required">

            <label class="col-sm-2 control-label" for="input-tname"><?php echo $entry_topic_message; ?></label>

            <div class="col-sm-10">
			<textarea class="form-control" name="note_description"></textarea>              
			  
              <?php if ($error_description) { ?>

              <div class="text-danger"><?php echo $error_description; ?></div>
			
				<?php } ?>
            </div>

          </div>

	</fieldset>
 


        <div class="buttons clearfix">


          <div class="pull-right">

            <input type="submit" value="Post Topic" class="btn btn-primary" />

          </div>

        </div>

      </form>

      <?php echo $content_bottom; ?></div>

    <?php echo $column_right; ?></div>

</div>

<script type="text/javascript" src="admin/view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript"><!--
CKEDITOR.replace('note_description', {});
//--></script>
<?php echo $footer; ?>