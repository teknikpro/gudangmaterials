<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">

  <div class="page-header">

    <div class="container-fluid">

      <div class="pull-right">

   
		
		<a onclick="$('form').submit();"  data-toggle="tooltip" title="Delete" class="btn btn-primary"><i class="fa fa-trash"></i></a>

    
       

      </div>

      <h1><?php echo $heading_title; ?></h1>

      <ul class="breadcrumb">

        <?php foreach ($breadcrumbs as $breadcrumb) { ?>

        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>

        <?php } ?>

      </ul>

    </div>

  </div>

  <div class="container-fluid">

    <?php if ($error_warning) { ?>

    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>

      <button type="button" class="close" data-dismiss="alert">&times;</button>

    </div>

    <?php } ?>

    <?php if ($success) { ?>

    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>

      <button type="button" class="close" data-dismiss="alert">&times;</button>

    </div>

    <?php } ?>

    <div class="panel panel-default">

      <div class="panel-heading">

        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo "Chatting List"; ?></h3>

      </div>

      <div class="panel-body">

		<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
		<div class="table-responsive">

		<table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
			  <td class="right"><?php echo "Chatting Id"; ?></td>
			  <td class="right"><?php echo "Id"; ?></td>
              <td class="left"><?php if ($sort == 'name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?></td>
              <td class="left">
                <a href="javascript:void(0);"><?php echo "Reply"; ?></a>
                </td>
              <td class="left"><?php if ($sort == 'status') { ?>
                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($chattings) { ?>
            <?php foreach ($chattings as $chatting) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($chatting['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $chatting['chatting_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $chatting['chatting_id']; ?>" />
                <?php } ?></td>
			  <td class="left"><?php echo $chatting['chatting_id']; ?></td>
			  <td class="left"><?php echo $chatting['id']; ?></td>
              <td class="left"><?php echo $chatting['name']; ?></td>
              <td class="left"><?php echo $chatting['reply']; ?></td>
              <td class="left"><?php echo $chatting['status']; ?></td>
              <td class="right"><?php foreach ($chatting['action'] as $action) { ?>
                <a href="<?php echo $action['href']; ?>" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Edit"><i class="fa fa-pencil"></i></a>   
				
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="5"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
		</div>
      </form>

        <div class="row">

          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>

          <div class="col-sm-6 text-right"><?php echo $results; ?></div>

        </div>

      </div>

    </div>

  </div>

</div>

<?php echo $footer; ?> 