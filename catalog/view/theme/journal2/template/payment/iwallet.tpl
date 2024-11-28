<div class="buttons">
  <div class="pull-right">
    <span id="confirmWait" style="display:none;"><img src="catalog/view/theme/default/image/ajax_load.gif" alt="" width="16" height="16" align="absmiddle" />&nbsp;&nbsp;Please wait...</span>	
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" />
  </div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').click(function() {
	$.ajax({
		type: 'get',
		url: 'index.php?route=payment/iwallet/confirm',
		dataType: 'json',
		beforeSend: function() {$("#confirmWait").show()},
		complete: function() {$("#confirmWait").hide()},
		success: function(data) {
			
			if(data.error !=''){
				alert(data.error);
			}else if(data.payToken != ''){
				window.location.href = data.pay_uri+'?pay_token='+data.payToken+'&order_id='+data.order_id
			}
			
		},
		error: function(error){
			alert('Ajax request error!');
		}
	});
	
});
//--></script>
