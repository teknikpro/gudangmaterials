<div class="buttons clearfix">
<div class="row">
<div class="col-sm-6 text-left"><h3 id="forumid"><i class="fa fa-file-text-o" aria-hidden="true"></i>&nbsp;&nbsp;<?php echo $heading_title; ?></h3></div>
<div class="col-sm-6 text-right"><h3 style="font-size: 17px;padding: 10px;"><a href="<?php print $base; ?>index.php?route=module/forum/addTopic">Start Discussion</a></h3></div>
</div>
</div>
<div class="row">
<div class="col-xs-12"> 
	<div class="table-responsive">

	<table class="table table-bordered table-hover">
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
  </div>
  </div>
<style>
#forumid .fa {
	font-size:21px;
}
#forumid {
	color: #fff;
    background: #337ab7;
    padding: 10px;
    border-radius: 6px;
    font-weight: bold;
}
</style>