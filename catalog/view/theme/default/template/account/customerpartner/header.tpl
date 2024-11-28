<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<script type="text/javascript" src="admin/view/javascript/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="admin/view/javascript/bootstrap/js/bootstrap.min.js"></script>
<?php if (isset($version) && $version) { ?>
  <link href="admin/view/stylesheet/bootstrap.css" type="text/css" rel="stylesheet" />
<?php } else { ?>
  <link href="admin/view/javascript/bootstrap/opencart/opencart.css" type="text/css" rel="stylesheet" />
<?php } ?>
<link href="admin/view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
<script src="admin/view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
<script src="admin/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="admin/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<link type="text/css" href="admin/view/stylesheet/stylesheet.css" rel="stylesheet" media="screen" />
<?php foreach ($styles as $style) { ?>
<link type="text/css" href="<?php echo $style['href']; ?>" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="admin/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<link type="text/css" href="catalog/view/theme/default/stylesheet/MP/separate_seller.css" rel="stylesheet" media="screen" />
</head>
<?php if(isset($notification) && $notification) { echo $notification; } ?>
<body>
<div id="container">
<header id="header" class="navbar navbar-static-top">
  <div class="navbar-header">
    <?php if ($logged) { ?>
    <a type="button" id="button-menu" class="pull-left"><i class="fa fa-indent fa-lg"></i></a>
    <?php } ?>
    <a href="<?php echo $home; ?>" class="navbar-brand"><img src="<?php echo $logo; ?>" alt="<?php echo $name; ?>" title="<?php echo $name; ?>" style="max-height: 24px;" /></a></div>
  <?php if ($logged) { ?>
  <ul class="nav pull-right">

    <li><a href="<?php echo $default_view; ?>" title="<?php echo $text_default_view; ?>"><i class="fa fa-eye-slash fa-lg"></i>&nbsp;<?php echo $text_default_view; ?></a></li>

    <?php if(isset($asktoadmin) && $asktoadmin) { ?>
      <li><a data-toggle="modal" data-target="#myModal-seller-mail" title="<?php echo $text_ask; ?>"><i class="fa fa-question-circle fa-lg"></i>&nbsp;<?php echo $text_ask; ?></a></li>
    <?php } ?>

    <?php if(isset($notification) && $notification) { ?>
      <li><a id="notification" data-toggle="modal" data-target="#myModal-notification" title="<?php echo $text_notification; ?>"><i class="fa fa-bell" aria-hidden="true"></i>&nbsp;<?php echo $text_notification; ?></a></li>
    <?php } ?>

    <li><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"><i class="fa fa-user fa-lg"></i>&nbsp;<?php echo $text_account; ?></a></li>

    <li><a href="<?php echo $home; ?>" title="<?php echo $text_home; ?>"><i class="fa fa-home fa-lg"></i>&nbsp;<?php echo $text_home; ?></a></li>

    <li><a href="<?php echo $logout; ?>"><span class="hidden-xs hidden-sm hidden-md"><?php echo $text_logout; ?></span> <i class="fa fa-sign-out fa-lg"></i></a></li>
  </ul>
  <?php } ?>
</header>

<?php if($logged){ ?>
	<div class="modal fade" id="myModal-seller-mail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"><?php echo $text_close; ?></span></button>
	        <h3 class="modal-title"><?php echo $text_ask_question; ?></h3>
	      </div>
	      <form id="seller-mail-form">
		      <div class="modal-body">
		      	<div class="form-group required">
			        <label class="control-label" for="input-subject"><?php echo $text_subject; ?></label>
			        <input type="text" name="subject" id="input-subject" class="form-control" />
			        <?php if(isset($partner)){ ?>
			        	<input type="hidden" name="seller" value="<?php echo $seller_id;?>"/>
			        <?php } ?>
			    </div>
				<div class="form-group required">
			        <label class="control-label" for="input-message"><?php echo $text_ask; ?></label>
					<textarea class="form-control" name="message" rows="3" id="input-message"></textarea>
			    </div>
			    <div class="error text-center text-danger"></div>
		      </div>
		  </form>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $text_close; ?></button>
	        <button type="button" class="btn btn-primary" id="send-mail"><?php echo $text_send; ?></button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
<?php } ?>
<script>
  <?php if($logged){ ?>
    $('#send-mail').on('click',function(){
    	f = 0;
    	$('.alert').remove();
    	$('#myModal-seller-mail input[type=\'text\'],#myModal-seller-mail textarea').each(function () {
    		if ($(this).val() == '') {
    			$(this).parent().addClass('has-error');
    			f++;
    		}else{
    			$(this).parent().removeClass('has-error');
    		}
    	});

    	if (f > 0) {
    		$('#myModal-seller-mail .error').text('<?php echo $text_error_mail; ?>').slideDown('slow').delay(2000).slideUp('slow');
    	} else {
    		$('#send-mail').addClass('disabled');
    		$('#myModal-seller-mail').addClass('mail-procss');
    		$('.alert-success').remove();
    		$('#myModal-seller-mail .modal-body').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $text_success_mail; ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>');

    		$.ajax({
    			url: '<?php echo $send_mail; ?>',
    			data: $('#seller-mail-form').serialize()+'<?php echo $mail_for; ?>',
    			type: 'post',
    			dataType: 'json',
    			complete: function () {
    				$('#send-mail').removeClass('disabled');
    				$('#myModal-seller-mail input,#myModal-seller-mail textarea').each(function () {
    					if(this.type != 'hidden'){
    					  $(this).val('');
    					  $(this).text('');
    					}
    				});
    			}
    		});
    	}
    });
  <?php } ?>
</script>
