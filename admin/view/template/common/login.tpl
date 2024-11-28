<!--**********************************
*** Perfect Admin Login
*** Date: 20.06.2017
*** version mod: 3.0
*** Opencart 3.0
*** Developer: reds
*** Site: www.agenciaprai.com
*** Email: suporte@agenciaprai.com
*************************************-->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>PAINEL</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
		<link rel="shortcut icon" href="view/image/reds_lock.png" />
		<script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
		<link href="view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
		<link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
		<link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="screen" />
<style rel="stylesheet">
.login_pg{overflow-x:hidden;background:#1872A2;background-image:url(view/image/bg-pattern.png),radial-gradient(ellipse at top,rgb(43, 144, 198) 2%,rgb(31, 158, 227) 35%,rgb(0, 62, 95) 75%)}
.login_painel{border:1px solid #1872A2;border-radius:3px;transition:all .5s ease 0s;-webkit-transition:all .5s ease 0s;-moz-transition:all .5s ease 0s}
.login_painel:hover{box-shadow:0 10px 3px -5px #0f648b;border:none;border-radius:0;transform:scale(1.05);-webkit-transform:scale(1.05);-moz-transform:scale(1.05)}
.panel-heading{border-top-left-radius:10px;border-top-right-radius:10px}
.panel-body{padding:25px}
.panel-title{font-size: 1.3em;text-transform: uppercase;padding: 20px 0;text-align: left;}
.panel-heading i{font-size: 2.5em;color: rgb(10, 174, 0);float: left;padding-right: 10px;}
.btn-primary{font-size:1.7em;font-weight:700;text-transform:uppercase;border-radius:5px;background-color:#1872a2;border:1px solid #0F648B;box-shadow:0 3px 0 #0F648B;transition:.3s ease-in}
.btn-primary:hover{background-color:#1E91CF}
.login-container {margin-top:10%;}
</style>




</head>
	<body class="login_pg">
<div id="content">
	<div class="container">
			<div class="container">
				<div class="row">
					<div class="login-container col-xs-12 col-sm-6 col-md-5 col-lg-5 col-sm-offset-3 col-md-offset-4">
						<div class="login_painel panel panel-default">

							<div class="panel-heading text-center">
								
								<h1 class="panel-title"><i class="fa fa-lock"></i><?php echo "Halaman Login Back-end Gudang Materials"; ?></h1>
								
							</div>
							
							
							<div class="panel-body">
								<?php if ($success) { ?>
								<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
									<button type="button" class="close" data-dismiss="alert">&times;</button>
								</div>
								<?php } ?>
								<?php if ($error_warning) { ?>
								<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
									<button type="button" class="close" data-dismiss="alert">&times;</button>
								</div>
								<?php } ?>
								<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label class="hidden" for="input-username"><?php echo $entry_username; ?></label>
										<div class="input-group"><span class="input-group-addon"><i class="fa fa-user"></i></span>
											<input type="text" name="username" value="<?php echo $username; ?>" placeholder="<?php echo $entry_username; ?>" id="input-username" class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label class="hidden" for="input-password"><?php echo $entry_password; ?></label>
										<div class="input-group"><span class="input-group-addon"><i class="fa fa-lock"></i></span>
											<input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
										</div>
									</div>
									<div class="text-center">
										<button style="width: 100%;" type="submit" class="btn btn-primary"><?php echo $button_login; ?>&nbsp;<i class="fa fa-unlock"></i></button>
									</div>
									<!--<?php if ($forgotten) { ?>
									<span class="help-block text-right"><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></span>
									<?php } ?>-->
									<?php if ($redirect) { ?>
									<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
									<?php } ?>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

 

		
  
		
	</body>
</html>
