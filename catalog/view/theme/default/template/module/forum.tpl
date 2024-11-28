<div class="buttons clearfix">
<div class="row">
<!--<div class="col-sm-6 text-left"><h3 id="forumid"><i class="fa fa-file-text-o" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $heading_title; ?></h3></div>-->
<div class="col-sm-6 text-right"><h3 style="font-size: 17px;padding: 1px;"><a href="<?php print $base; ?>index.php?route=module/forum/addTopic">Klik disini -> Mulai Diskusi</a></h3></div>
</div>
</div>
<div id="cs-<?php echo $module; ?>" class="cs-<?php echo $module_id; ?> box custom-sections section-product <?php echo implode(' ', $disable_on_classes); ?> <?php echo $single_class; ?> <?php echo $show_title_class; ?> <?php echo isset($gutter_on_class) ? $gutter_on_class : ''; ?>" style="<?php echo isset($css) ? $css : ''; ?>">
 
<div class="row">
<div class="col-xs-12"> 
	<div class="table-responsive">

	<!--<table class="table table-bordered table-hover">-->
	<table class="table table-bordered table-hover" rules="none" border="1" >
      <thead>
        <tr>
          <th>Topik</th>
          
          <th>Balasan</th>
          <th> Dibaca </th>
		  <th>Diposting pada</th>
        </tr>
      </thead>
      <tbody>	 
	  <?php if(!empty($forumdata)) { ?>
        <?php for($i=0;$i<count($forumdata);$i++) { ?>
        <tr>
          <td><a href="<?php print $base; ?>index.php?route=module/forum/getForum&forum_id=<?php print $forumdata[$i]['forum_id']; ?>"><font size="3" color="blue"><?php print $forumdata[$i]['name']; ?></font></a><div class="author"><font size="2" color="red"><?php if($forumdata[$i]['username'] == '') { print 'oleh admin'; } else { print ' oleh '.$forumdata[$i]['username']; } ?></font></div></td>
         
         <td> <center><?php print $forumdata[$i]['reply']; ?></center></td>
         <td> <center><?php print $forumdata[$i]['views']; ?></center></td>
		  <td> <center><?php print date('M d, Y h:i a', strtotime($forumdata[$i]['date'])); ?></center></td>
        </tr>
        <?php } ?>
	  <?php } else { ?>
	  	<tr><td colspan="4" style="text-align:center;">No Results Found!</td></tr>
	  <?php } ?>	
      </tbody>
    </table>
  </div>
  </div>
  </div>
  </div>

<style>
table, th, td {
  border: 1px solid #999999;
}
</style>
  
<style>
#forumid .fa {
	font-size:21px;
}
#forumid {
	color: #ffffff;
    background: #337ab7;
    padding: 10px;
    border-radius: 6px;
    font-weight: bold;
}
</style>