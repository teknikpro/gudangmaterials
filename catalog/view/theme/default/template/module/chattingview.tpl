 <!--<?php
   $url1=$_SERVER['REQUEST_URI'];
   header("Refresh: 30; URL=$url1");
?>-->
<?php echo $header; ?>


<style type="text/css">
table { 
    border-collapse: separate; 
    border-spacing: 0 10px; 
    margin-top: -10px; /* correct offset on first border spacing if desired */
}
td {
    border: solid 0px #000;
    border-style: solid none;
    padding: 10px;
    background-color: #DDDDDD;
	color: #000;
	font-size: 14px;
	
	font-family: sans-serif;
	
}
td:first-child {
    border-left-style: solid;
    border-top-left-radius: 0px; 
    border-bottom-left-radius: 0px;
    color: #000;
}
td:last-child {
    border-right-style: solid;
    border-bottom-right-radius: 0px; 
    border-top-right-radius: 0px;
    color: #000; 
}
</style>

<script type="text/javascript">

function createCookie(name,value,days)
{
if (days)
{
var date = new Date();
date.setTime(date.getTime()+(days*24*60*60*1000));
var expires = "; expires="+date.toGMTString();
}
else var expires = "";
document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name)
{
var nameEQ = name + "=";
var ca = document.cookie.split(';');
for(var i=0;i < ca.length;i++)
{
var c = ca[i];
while (c.charAt(0)==' ') c = c.substring(1,c.length);
if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
}
return null;
}

function eraseCookie(name)
{
createCookie(name,"",-1);
}


var reIt

function doit(){
if (window.location.reload)
window.location.reload( true );
else if (window.location.replace)
window.location.replace(unescape(location.href))
else
window.location.href=unescape(location.href)
}

function startUp(){
// uncomment below line for testing only
//alert(readCookie('resetInt'))
if (readCookie('resetInt')!=null)
reIt=setTimeout("doit()", readCookie('resetInt'))
else
return;
}

function setRe(val){
clearTimeout(reIt)
if (val==0){
eraseCookie('resetInt')
return;
}
else
// 7 in the below line is the number of days persistence
createCookie('resetInt', val*1000, 7)
startUp();
}

//onload=startUp;

</script>


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


  <div class="container-fluid">  
  
    <div class="panel panel-default">
	
      <div>

        <!--<h3 class="panel-title"><i class="fa fa-list"></i>  <?php echo $heading_title; ?><span style="float:right;" title="Go back"><a href="<?php echo $base; ?>index.php?route=module/chatting/addTopic" title="Add Topic">Start Discussion</a></span></h3>-->

        <!--<h3 class="panel-title"><i class="fa fa-list"></i>  <?php echo $heading_title; ?><span style="float:right;" title="Go back"><a href="<?php echo $base; ?>index.php?route=module/chatting/addTopic" title="Add Topic"><font size="2" style="color:#FFF">Hapus Chatting</font></a></span></h3>-->
		 <!--<center><h3 class="panel-title"><font size="2" style="background: #fff;color:#000;"><?php echo ""; ?> Pesan Chatting akan terhapus setelah dua hari</font></h3></center>-->
		<center><a href="<?php echo $delete; ?>" class="btn btn-danger button"><?php echo $button_delete; ?></a></center>
  

      </div>
  <?php if ($success) { ?>

  <!--<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>-->

  <?php } ?>
      <div class="panel-body">

        

          <div class="table-responsive">

  <?php for($i=0;$i<count($chattingdata);$i++) { ?>
  <table class="table table-bordered table-hover">
    <tbody>
      <tr style="background: #000;color:#fff;">

       <!--<td><strong><a style="color:#000;" href="<?php if($chattingdata[$i]['customer_id'] == 0) { print $base.'index.php?route=module/chatting/getchattings'; } else { print $base.'index.php?route=module/chatting/getchattings&author_id='.base64_encode($chattingdata[$i]['customer_id']); } ?>">
          <?php if($chattingdata[$i]['customer_id'] == 0) { print 'Admin'; } else { print $chattingdata[$i]['username']; } ?>
          </a>&nbsp;:&nbsp;</strong> <?php print $chattingdata[$i]['name']; ?> </td> -->
		  
       <td><strong><a style="color:#000;" href="<?php if($chattingdata[$i]['customer_id'] == 0) { print $base.'index.php?route=module/chatting/getchattings'; } else { print $base.'index.php?route=module/chatting/getchattings&author_id='.base64_encode($chattingdata[$i]['customer_id']); } ?>">
          <?php if($chattingdata[$i]['customer_id'] == 0) { print ''; } else { print ''; } ?>
          </a></strong><?php print $chattingdata[$i]['name']; ?>  
		  
		  <!--&nbsp;&nbsp;(<?php print date("M d, Y h:i a",strtotime($chattingdata[$i]['date'])); ?>) -->
		  
		  </td>
      </tr>
      <tr>
	  <?php 
		$supported_image = array(
		'gif',
		'jpg',
		'jpeg',
		'png'
		);
		$ext = strtolower(pathinfo($chattingdata[$i]['avatar'], PATHINFO_EXTENSION));
		if (in_array($ext, $supported_image)) {
		?>
         <td><img style="width:50px; height:50px;" src="<?php print $base.'image/'.$chattingdata[$i]['avatar'];  ?>"/> </td>
		 
  <?php } else { ?>
   <!--<td><img style="width:20px; height:20px;" src="image/data/admin.png"/> </td>-->
  <?php  } ?>
        <!--<td><?php print html_entity_decode($chattingdata[$i]['description']); ?></td>-->
		<td style="background: #fff;color:#000;"><strong><font size="2" style="color:#F97001;"><?php print html_entity_decode($chattingdata[$i]['description']); ?></strong></font></td>
		
      </tr>
    </tbody>
  </table>
  <?php } ?>
  <?php $j=1; ?>
  <?php for($i=0;$i<count($chattingreplydata);$i++) { ?>
  
 
  
  <table class="table table-bordered table-hover">
    <tbody>
      <tr>
        <!--<td><strong><?php print "  #".$j; ?><?php print " reply on : "; ?></strong> <?php print $chattingreplydata[$i]['name']." by "; ?><a href="<?php print $base.'index.php?route=module/chatting/getchattings&author_id='.base64_encode($chattingreplydata[$i]['customer_id']);?>"><?php print $chattingreplydata[$i]['username']; ?></a> </td>
        <td><?php print  date("M d, Y h:i a",strtotime($chattingreplydata[$i]['date'])); ?> </td>-->
		
        <!--<td><strong><?php print "  #".$j; ?><?php print " reply on : "; ?></strong> <a href="<?php print $base.'index.php?route=module/chatting/getchattings&author_id='.base64_encode($chattingreplydata[$i]['customer_id']);?>"><?php print $chattingreplydata[$i]['username']; ?></a> </td>-->
        
	    <td><strong><?php print "  #".$j; ?><?php print " chat on : "; ?></strong><?php print $chattingreplydata[$i]['username']; ?>
		<strong><font size="1" style="color:#000;">&nbsp;&nbsp;(<?php print  date("M d, Y h:i a",strtotime($chattingreplydata[$i]['date'])); ?>)</font></strong>
		</td>
        	
      </tr>
      <tr>
	  	  <?php 
		$supported_image = array(
		'gif',
		'jpg',
		'jpeg',
		'png'
		);
		$ext = strtolower(pathinfo($chattingreplydata[$i]['avatar'], PATHINFO_EXTENSION));
		if (in_array($ext, $supported_image)) {
		?>
         <!--<td><img style="width:20px; height:20px;" src="<?php print $base.'image/'.$chattingreplydata[$i]['avatar'];  ?>"/> </td>-->
        <?php } else { ?>
         <!--<td><img style="width:20px; height:20px;" src="image/data/admin.png"/> </td>-->
        <?php  } ?>
		
		<td bgcolor="#F0C5C5"><?php echo html_entity_decode($chattingreplydata[$i]['reply']); ?></td>
      </tr>
    </tbody>
  </table>
  <?php $j++; ?>
  <?php } ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form"> 
  <?php if($customer_id){ ?>
		<fieldset>

          <!--<legend><?php echo $post_reply; ?></legend>-->
		  <legend><?php echo "Isi Pesan Chatting :"; ?></legend>

          <div class="form-group required" style="display:none;">

            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>

            <div class="col-sm-10">

              <input type="text" name="username" value="<?php echo $customer_name;?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" required />
              <input type="text" name="customer_id" value="<?php echo $customer_id;?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" required />
			  <input type="hidden" name="chatting_id" value="<?php print $chatting_id; ?>" />

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

            <!--<label class="col-sm-2 control-label" for="input-tname"><?php echo $entry_topic_reply; ?></label>-->

            <div class="col-sm-10">
			<textarea class="form-control" name="reply" required></textarea>              
	
            </div>

          </div>

	</fieldset>
  <?php } else { ?>
      
      
	   
	   <div class="buttons clearfix"> 
         <div class="pull-right">
            Refresh:-> <input type="button" value="5 Second" onclick="setRe(5);">
			<input type="button" value="2 Menit" onclick="setRe(1800);">
			<input type="button" value="5 Menit" onclick="setRe(3600);">
			<input type="button" value="Stop" onclick="setRe(0);"> 		 
            <a href="<?php echo $login_url;?>" class="btn btn-primary">Login to Chat</a>
         </div>

      </div>
	  
  
	  
	  
	  
  <?php } ?>

    <?php if($customer_id){ ?>
  
        <div class="buttons clearfix">
          <div class="pull-right"> 
		  
		     Refresh:-> <input type="button" value="5 Second" onclick="setRe(5);">
			<input type="button" value="2 Menit" onclick="setRe(1800);">
			<input type="button" value="5 Menit" onclick="setRe(3600);">
			<input type="button" value="Stop" onclick="setRe(0);"> 		 
		  
           <input type="submit" value="Chat Reply" class="btn btn-primary" />
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