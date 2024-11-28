<?php echo $header; ?>
<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><span itemprop="title"><?php echo $breadcrumb['text']; ?></span></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <?php echo $content_top; ?>
      <div class="row login-content">
        <div class="col-sm-6 left">
          <div class="well">
            <h2 class="secondary-title"><?php echo $text_new_customer; ?></h2>
            <div class="login-wrap">
            <p><strong><?php echo $text_register; ?></strong></p>
            <p><?php echo $text_register_account; ?></p>
            </div>
            <hr/>
            <a href="<?php echo $register; ?>" class="btn btn-primary button"><?php echo $button_continue; ?></a></div>
        </div>
        <div class="col-sm-6 right">
          <div class="well">
            <h2 class="secondary-title"><?php echo $text_returning_customer; ?></h2>
			
            <!--<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="login-wrap">
                <p><?php echo $text_i_am_returning_customer; ?></p>
              <div class="form-group">
                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
                </div>
              <hr/>
              <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary button" />
              <?php if ($redirect) { ?>
              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
              <?php } ?>
            </form>-->

 <?php if ($data['switch']==1) { ?>
	<font style="color:#fff">
	echo "<script>document.write(localStorage.setItem('model','1' ))</script>";
	</font>	
 <?php } else { ?>
	<font style="color:#fff">
	echo "<script>document.write(localStorage.setItem('model','0' ))</script>";
	</font>	
  <?php } ?>
			
			  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
			     <div class="form-group">
					<label class="control-label" for="input-email"><font size="3" style="color:#000000"><?php echo $entry_email; ?></font></label>
					<input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
				</div>
				<div class="form-group">
					<label class="control-label" for="input-password"><font size="3" style="color:#000000"><?php echo $entry_password; ?></font></label>
					<input class="form-password" type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
					<input type="checkbox" class="form-checkbox"> Show
					

					<br />
					
				    <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary" />					
					<a href="<?php echo $forgotten; ?>"><font size="3" style="color:#000000"><?php echo $text_forgotten; ?></font></a></div>
				  <?php if ($redirect) { ?>
				   <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
				  <?php } ?>
			  </form>	
			  
            <!--<div id='back'>
				<input type="button"  onclick="initFirebaseMessagingRegistration()"  value="Akses Notifikasi">
			</div>-->


						  			
			
          </div>
        </div>
      </div>
      </div>
    </div>
</div>
<?php echo $footer; ?>


<script type="text/javascript">
	$(document).ready(function(){		
		$('.form-checkbox').click(function(){
			if($(this).is(':checked')){
				$('.form-password').attr('type','text');
			}else{
				$('.form-password').attr('type','password');
			}
		});
		
	
	});
</script>

   <script src="https://www.gstatic.com/firebasejs/4.13.0/firebase-app.js"></script>
   <script src="https://www.gstatic.com/firebasejs/4.13.0/firebase-messaging.js"></script>
  
   <script>
	
        firebase.initializeApp({
            'messagingSenderId': '706992871380'
        })
     	 
        const messaging = firebase.messaging();
        function initFirebaseMessagingRegistration() {
			const messaging = firebase.messaging();
			 messaging
			   .requestPermission()
			   .then(function () {
				 //MsgElem.innerHTML = "Notification permission granted."
				 window.alert("Izin Notifikasi Aktif.");

				 // get the token in the form of promise
				 return messaging.getToken()
			   })
			   .then(function(token) {
				 // print the token on the HTML page
				 //TokenElem.innerHTML = "Device token is : <br>" + token
				 localStorage.deviceid = token;
			   })
			   .catch(function (err) {
			   ErrElem.innerHTML = ErrElem.innerHTML + "; " + err
			   window.alert("Unable to get permission to notify.", err);
			 });
        }
        messaging.onMessage(function (payload) {
            window.alert("Message received. ", JSON.stringify(payload));
            notificationElement.innerHTML = notificationElement.innerHTML + " " + payload.data.notification;
        });
        messaging.onTokenRefresh(function () {
            messaging.getToken()
                .then(function (refreshedToken) {
                    window.alert('Token refreshed.');
                    tokenElement.innerHTML = "Token is " + refreshedToken;
                }).catch(function (err) {
                    errorElement.innerHTML = "Error: " + err;
                    window.alert('Unable to retrieve refreshed token ', err);
                });
        });
		
    </script>
 




