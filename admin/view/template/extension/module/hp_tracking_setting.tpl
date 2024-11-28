<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <style type="text/css">
        #iconlist { margin-top: 5px; }
        .iconitem input[type=text] { border-radius: 0; }    
    .iconitem {
        position: relative;
        display: block;
        margin-bottom: 9px;
        background-color: #fff;
    }
    
    .iconitem > div.heading { margin-top: 8px; display: none; }
    
        .list-group-item:hover { cursor: move; }
        .list-group-item { margin-top: 5px; } 
        .note-editor { margin-bottom: 0; }
</style>
    
<link href="view/javascript/order-tracking/css/octicons.min.css" type="text/css" rel="stylesheet" media="screen" />
<link href="view/javascript/bs-colorpicker/css/colorpicker.css" type="text/css" rel="stylesheet" media="screen" />

<link href="view/javascript/fa-iconpicker/css/fontawesome-iconpicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<script src="view/javascript/bs-colorpicker/js/colorpicker.js" type="text/javascript"></script>
<script src="view/javascript/fa-iconpicker/js/fontawesome-iconpicker.min.js" type="text/javascript"></script>
<script src="view/javascript/jquery/jquery-ui/jquery-ui.min.js"></script>
    
  <div class="page-header">
    <div class="container-fluid">
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
          
            <button type="submit" form="form-setting" data-toggle="tooltip" title="<?php echo $button_save_all_setting; ?>" class="btn btn-info pull-right"><i class="fa fa-save"></i> <?php echo $button_save_all_setting; ?> </button> 

          <div class="clearfix"></div>
      </div>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-setting" class="form-horizontal">

      <div class="panel-body">
           <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><i class="fa fa-home"></i> <?php echo $tab_general; ?></a></li>
            <li><a href="#tab-authentication" data-toggle="tab"><i class="fa fa-key"></i> <?php echo $tab_authentication; ?></a></li>
            <li><a href="#tab-translation" data-toggle="tab"><i class="fa fa-language"></i> <?php echo $tab_translation; ?></a></li>
            <li><a href="#tab-advance" data-toggle="tab"><i class="fa fa-gear"></i> <?php echo $tab_advance; ?></a></li>
            <li><a href="#tab-help" data-toggle="tab"><i class="fa fa-question-circle"></i> <?php echo $tab_help; ?></a></li>
          </ul>
       <div class="tab-content">
           <div class="clearfix"></div>
            <div class="tab-pane active" id="tab-general">   
    <fieldset>
        <legend><?php echo $text_options; ?></legend>        
    <div class="form-group required">
        <label class="col-sm-3" for="color-scheme">
                    <?php echo $entry_color_scheme; ?>
                   </label>
                <div class="col-sm-2">     
            <div class="input-group colorpicker-component"> 
            <input id="color-scheme" type="text" name="hp_tracking_color_scheme" value="<?php echo $hp_tracking_color_scheme; ?>" class="form-control" /><span id="color-scheme-button" class="input-group-addon"><i></i></span>
                        </div>                
                    </div>
        </div>
    <div class="form-group">
                  <label class="col-sm-3" for="order-status">
                      <?php echo $entry_order_status; ?>
                        <h5><?php echo $help_order_status; ?></h5>
                    </label>
                   <div class="col-sm-9">
                    <div class="well well-sm" style="height: 150px; overflow: auto;">                        
                      <?php foreach ($order_statuses as $order_status) { ?>
                      <div class="checkbox">
                        <label>
                    <?php if (in_array($order_status['order_status_id'], $hp_tracking_order_status)) { ?>
                          <input type="checkbox" name="hp_tracking_order_status[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked" />
                          <span><?php echo $order_status['name']; ?></span>
                          <?php } else { ?>
                          <input type="checkbox" name="hp_tracking_order_status[]" value="<?php echo $order_status['order_status_id']; ?>" />
                          <span><?php echo $order_status['name']; ?></span>
                          <?php } ?>
                        </label>
                      </div>
                      <?php } ?>
                    </div>
                  </div>
                </div>
<!--        <?php // if($shipping_hp_tracking_status) { ?> -->
        <?php if(0) { ?> 
        <div class="form-group">
            <div class="col-sm-12">
                    <div class="clearfix alert alert-success">
                                    <?php echo $text_found_shipping_bundle; ?>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3" for="shipment-tracking-status"><?php echo $entry_shipment_status; ?></label>
            <div class="col-sm-9">
              <select name="hp_tracking_shipment_status" id="shipment-tracking-status" class="form-control">
                <?php if ($hp_tracking_shipment_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        <?php } ?>
<!--
        
        <div class="form-group">
                                <label>As a component</label>

                                <div class="input-group">
                                    <input data-placement="bottomRight" class="form-control icp icp-auto" value="fa-archive" type="text" />
                                    <span class="input-group-addon"></span>
                                </div>
                            </div>
-->
        
        </fieldset> 
    <div id="sortorder-section" class="form-group">
                 <label class="col-sm-3" for="input-sort-order">
                <?php echo $entry_sort_order; ?>
                    <h5><?php echo $help_sort_order; ?></h5>
                </label>
                    <div class="col-sm-4">
                <section>
                    <ul class="list-group list-group-sortable">
                    <?php $nomer = 1; ?>
                        <?php foreach($sort_orders as $key => $sort_order) { ?>
                        <li class="list-group-item" data-value="<?php echo $sort_order['order_status_id']; ?>"><?php echo $nomer.". ".$sort_order['name']; ?></li>
                          
                            <?php $nomer++; ?>
                        <?php } ?>
                    </ul>
                </section>
                <div id="sortorders">
                    <?php foreach($sort_orders as $key => $sort_order) { ?>
                        <input type="hidden" name="hp_tracking_sort_order[]" value="<?php echo $sort_order['order_status_id']; ?>" />
                        <?php } ?>
                    </div> 
                </div>
        <div class="col-sm-5" id="iconlist">
                         <?php $nomer = 1; ?>
                        <?php foreach($sort_orders as $key => $sort_order) { ?>
                                  
                        <div class="iconitem"><div class="col-sm-8 heading"><?php echo $nomer.". ".$sort_order['name']; ?></div><div class="input-group col-sm-6"><input data-placement="bottomRight" style="opacity: 1;" class="form-control icp<?php echo $nomer; ?> icp-auto" value="<?php echo $sort_order['icon']; ?>" name="hp_tracking_icons[]" readonly type="text" /><span class="input-group-addon"></span></div></div>
                          
                            <?php $nomer++; ?>
                        <?php } ?>
        
                 </div>
           </div>
                
<!--
             <div id="icons-section" class="form-group">
                 <label class="col-sm-3" for="input-sort-order">
                <?php echo $entry_icons; ?>
                    <h5><?php echo $help_icons; ?></h5>
                </label>
                    
                </div>
-->
                                
                <div class="buttons clearfix">
                        <div class="pull-right"><a id="button-save-sortordericon" class="btn btn-success"><?php echo $button_save_icon_sortorder; ?></a></div>
                    </div>   
           </div>       
        <div class="tab-pane" id="tab-authentication">
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_api_notification; ?></div>
            
            <div class="form-group required">
                <label class="col-sm-3" for="hp_tracking_rajaongkirapi">
                    <?php echo $entry_select_used_api; ?> 
                 </label>
                <div class="col-sm-9">
                <select name="hp_tracking_apitype" class="form-control">
                    <?php if($hp_tracking_apitype == "ownapi") { ?>
                        <option value="ownapi" selected="selected"><?php echo $text_use_your_api; ?></option>
                        <option value="hpwdapi"><?php echo $text_use_hpwd_api; ?></option> 
                     <?php } else { ?> 
                        <option value="ownapi"><?php echo $text_use_your_api; ?></option>
                        <option value="hpwdapi" selected="selected"><?php echo $text_use_hpwd_api; ?></option> 
                    <?php } ?>
                    </select>
                </div>
              </div>
       <div id="own-api">     
        <legend><?php echo $text_use_your_api; ?></legend>            
             <div class="form-group required">
                <label class="col-sm-3" for="hp_tracking_rajaongkirapi">
                    <?php echo $entry_rajaongkirapi; ?> 
                 <h5><?php echo $help_rajaongkirapi; ?></h5>
                 </label>
                <div class="col-sm-9">
                  <input type="text" name="hp_tracking_rajaongkirapi" value="<?php echo $hp_tracking_rajaongkirapi; ?>" id="hp_tracking_rajaongkirapi" size="10" class="form-control" />
          
                </div>
              </div>
            
              <div class="pull-right">
                  <button type="button" id="button-apply-api" data-dismiss="alert" class="btn btn-success"><i class="fa fa-save"></i> <?php echo $button_apply_api; ?></button>
                  <button type="button" id="button-clear-api" data-dismiss="alert" class="btn btn-default"><i class="fa fa-close"></i> <?php echo $button_clear; ?></button>
                </div>  
            <div class="clearfix"></div>
         </div>
            
        <div id="hpwd-api">
        <legend id="validate-order"><?php echo $text_use_hpwd_api; ?></legend>
              <div class="form-group required">
                <label class="col-sm-3" for="hp_tracking_username">
                    <?php echo $entry_username; ?>
                    <h5><?php echo $entry_username_help; ?></h5>
                    
                  </label>
                <div class="col-sm-9">
                  <input type="text" name="hp_tracking_username" value="<?php echo $hp_tracking_username; ?>" id="hp_tracking_username" class="form-control" />
                </div>
              </div>
        
        <div class="form-group required">
                <label class="col-sm-3" for="hp_tracking_order_id">
                    <?php echo $entry_order_id; ?>                    
                  </label>
                <div class="col-sm-9">
                  <input type="text" name="hp_tracking_order_id" value="<?php echo $hp_tracking_order_id; ?>" id="hp_tracking_order_id" class="form-control" />
                </div>
              </div>
                    
            <div class="pull-right">
                  <button type="button" id="button-validate-order" data-dismiss="alert" class="btn btn-success"><i class="fa fa-save"></i> <?php echo $button_validate_order; ?></button>
                </div>
            </div>
           </div>
           
            <div class="tab-pane" id="tab-translation">
                <fieldset>
        <legend><?php echo $text_options; ?></legend>  
               <div class="form-group required">
        <label class="col-sm-3" for="heading-title">
                    <?php echo $entry_heading_title; ?>
                   <h6><?php echo $help_heading_title; ?></h6>
                   </label>
                <div class="col-sm-9">
              <?php foreach ($languages as $language) { ?>
                <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                <input type="text" name="hp_tracking_heading_title_<?php echo $language['language_id']; ?>" value="<?php echo ${'hp_tracking_heading_title_'.$language['language_id']}; ?>" class="form-control" />
              </div>
            <?php } ?>
                </div>
              </div>         
       
        <div class="form-group required">
        <label class="col-sm-3">
                    <?php echo $entry_text_noreceipt; ?>
                   </label>
                <div class="col-sm-9">     
  <?php foreach ($languages as $language) { ?>
            <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
            <input type="text" name="hp_tracking_no_receipt_<?php echo $language['language_id']; ?>" value="<?php echo ${'hp_tracking_no_receipt_'.$language['language_id']}; ?>" class="form-control" />
          </div>
        <?php } ?>
                    </div>
              </div>
              
              <div class="form-group required">
        <label class="col-sm-3" for="heading-title">
                    <?php echo $entry_text_instruction; ?>
                   <h6><?php echo $help_text_instruction; ?></h6>
                   </label>
                <div class="col-sm-9">
        <?php foreach ($languages as $language) { ?>            
            <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
            <textarea rows="3" id="text-instruction-<?php echo $language['language_id']; ?>" name="hp_tracking_text_instruction_<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo ${'hp_tracking_text_instruction_'.$language['language_id']}; ?></textarea>
          </div>
        <?php } ?>
                </div>
              </div> 
              
        </fieldset> 
            </div>
            <div class="tab-pane" id="tab-advance">
                      <div class="form-group">
            <label class="col-sm-2" for="module_bundle_total_shipping">
                <?php echo $entry_uninstall_table; ?>
                <h5><?php echo $help_uninstall_table; ?></h5>
            </label>        
                    <div class="col-sm-10">            
                        <span onclick="confirm('<?php echo $text_confirm; ?>') ? location.href='<?php echo $uninstall; ?>' : false;" class="btn btn-danger"><?php echo $button_uninstall_table; ?></span>
                    </div>
                </div> 
                <?php if ($hp_tracking_apitype == "hpwdapi") { ?> 
               <div class="form-group">
                <label class="col-sm-2">
                    <?php echo $text_eligible_api_usage; ?>
                    <h6><?php echo $help_eligible_api_usage; ?></h6>
                </label>        
                <div class="col-sm-10">   
                    <h3 class="label label-success"><?php echo $eligible_status; ?></h3>
                    <h3 class="label label-info"><?php echo $eligible_date; ?></h3>
                </div>
            </div> 
               <?php } ?>
           </div>
           
            <div class="tab-pane" id="tab-help">
                <div class="alert alert-info"><?php echo $text_support_content; ?></div>
                <div>
                    <img width="150" src="view/image/logohpwd.png" />
                      <p>
                        <a target="_blank" href="http://hpwebdesign.id">http://hpwebdesign.id</a>  <br />
                        <a target="_blank" href="mailto:support@hpwebdesign.id">support@hpwebdesign.id</a>  
                      </p>
                  </div>
           </div>
           
          </div>
      </div>
          </form> 
    
    </div>
  </div>
</div>
<script type="text/javascript"><!--       
$('.input-group-addon i').css('background-color', '#' + $('#color-scheme').val());
    
jQuery("#color-scheme-button").ColorPicker({
    color: jQuery('#color-scheme').val(),
    onShow: function (colpkr) {
        jQuery(colpkr).fadeIn(500);
        return false;
    },
    onHide: function (colpkr) {
        jQuery(colpkr).fadeOut(500);
        return false;
    },
    onChange: function (hsb, hex, rgb) {
        jQuery('.input-group-addon i').css('background-color', '#' + hex);
        jQuery('#color-scheme').val('#' + hex);
    }
});
    
var validated = '<?php echo $validated; ?>';
$( document ).ready(function() {    
$('#button-save-sortordericon').on('click', function() {
    $.ajax({
		url: 'index.php?route=module/hp_tracking_setting/sortorder&token=<?php echo $token; ?>',
        data: $('#sortorders input[type=\'hidden\'], #iconlist input[type=\'text\']'),
        type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#button-save-sortordericon').after('<i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
          $('.alert').remove();
            
             if(json['success'])    {
                $('#sortorder-section').prepend('<div class="clearfix alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
            }  
            
            // $('html, body').animate({ scrollTop: 0 }, 'slow');
                               
            $('.alert-danger, .alert-success').fadeIn('slow');
            $('.alert-danger, .alert-success').delay(2000).fadeOut("slow");
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

});  
//--></script>

<script type="text/javascript"><!--   
$('#button-validate-order').on('click', function() {
    var username = $('input[name=\'hp_tracking_username\']').val();
    var order_id = $('input[name=\'hp_tracking_order_id\']').val();
    
    $.ajax({
		url: 'index.php?route=module/hp_tracking_setting/validateOrder&token=<?php echo $token; ?>&username=' + username + '&order_id=' + order_id,
		dataType: 'json',
		beforeSend: function() {
			$('#button-validate-order').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
        $('.alert').remove();

            if(json['error']) {
               $('#hpwd-api legend').after('<div class="clearfix alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }
            
             if(json['success']) {
                $('#hpwd-api legend').after('<div class="clearfix alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                 
                $('select[name=\'hp_tracking_province_id\']').trigger('change');
            }  
                
            $('.alert-danger, .alert-success').fadeIn('slow');
            $('.alert-danger, .alert-success').delay(2000).fadeOut("slow");
                
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
    
$('#button-apply-api').on('click', function() {
    var apikey = $('input[name=\'hp_tracking_rajaongkirapi\']').val();
    
    $.ajax({
		url: 'index.php?route=module/hp_tracking_setting/applyApi&token=<?php echo $token; ?>&apikey=' + apikey,
		dataType: 'json',
		beforeSend: function() {
			$('#button-apply-api').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
        $('.alert').remove();

            if(json['error']) {
               $('#own-api legend').after('<div class="clearfix alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
            
             if(json['success']) {
                $('#own-api legend').after('<div class="clearfix alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                $('select[name=\'hp_tracking_province_id\']').trigger('change');
            }
    
            $('.alert-danger, .alert-success').fadeIn('slow');
            $('.alert-danger, .alert-success').delay(2000).fadeOut("slow");
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
  
$('#own-api, #hpwd-api').hide();    

$('select[name=hp_tracking_apitype]').on('change', function() {
    
    if($('select[name=hp_tracking_apitype]').val() == 'ownapi') {
       $('#own-api').show();   
       $('#hpwd-api').hide();   
    } else {
       $('#own-api').hide();   
       $('#hpwd-api').show();   
    }
    
});
    
$('select[name=hp_tracking_apitype]').trigger('change');
    
$('#button-clear-api').on('click', function() {
    var apikey = $('input[name=\'hp_tracking_rajaongkirapi\']').val();
    
    if(confirm('<?php echo $text_confirm; ?>')) {
    $.ajax({
		url: 'index.php?route=module/hp_tracking_setting/clearApi&token=<?php echo $token; ?>&apikey=' + apikey,
		dataType: 'json',
		beforeSend: function() {
			$('#button-clear-api').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
        $('.alert').remove();

            if(json['error']) {
               $('#own-api legend').after('<div class="clearfix alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }
            
             if(json['success']) {
               $('#own-api legend').after('<div class="clearfix alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                $('input[name=\'hp_tracking_rajaongkirapi\']').val('');
                $('select[name=\'hp_tracking_province_id\']').trigger('change');
            }
    
            $('.alert-success, .alert-danger').fadeIn('slow');
            $('.alert-success, .alert-danger').delay(2000).fadeOut("slow");
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		  }
});
   }
});
    
if($('input[name="hp_tracking_order_status[]"]:checked').length) {
    $('#sortorder-section').show();
} else {
    $('#sortorder-section').hide();
}   
// icons lists
var icon_values = [];
// Sort Order
$("input[name='hp_tracking_order_status[]']").on('change', function() {
    var list_items = '';
    var sort_orders = '';
    var nomer = 1;
    
    if($('input[name="hp_tracking_order_status[]"]:checked').length) {
        $('#sortorder-section').show();
    } else {
        $('#sortorder-section').hide();
    }   
    
    var numbers = [1];
    
    $("input[name='hp_tracking_order_status[]']:checked").each(function() {
        
        numbers.push(nomer);
        
        list_items += '<li data-value="'+ $(this).val() +'" class="list-group-item">' + nomer + '. ' + $(this).next().text() + '</li>';
    
        sort_orders += '<input type="hidden" name="hp_tracking_sort_order[]" value="'+ $(this).val() +'" />';
        nomer += 1;
       
    });
    
 $('ul.list-group-sortable').html(list_items);
 $('#sortorders').html(sort_orders);
    
 $(function() {
         $('ul.list-group-sortable').sortable();
         $('ul.list-group-sortable').disableSelection();
    });

    iconList();
});

$('.list-group-sortable').sortable().bind('create', function(e, ui) { 
    console.log('test');
});
    
$('.list-group-sortable').sortable().bind('sortupdate', function(e, ui) {
    var html = '';
    var numbers = [1];
     $( "ul li.list-group-item" ).each(function(index) {
         var teks = $(this).text()
             teks = teks.split('.');
         numbers.push(parseInt(index+1));
         
         $('li.list-group-item').eq(index).text(index+1 + '.' + teks[1]);
                 
         html += '<input name="hp_tracking_sort_order[]" value="'+ $('li.list-group-item').eq(index).attr('data-value') +'" type="hidden">';     
        });
    
    $('#sortorders').html(html);
    
    iconList();
});
    
    
function iconList() {
var html = '';
var number = 0;
var numbers = [0];
    
$( "ul li.list-group-item" ).each(function(index) {
        
      numbers.push(number);

      html += '<div class="iconitem"><div class="col-sm-8 heading">'+$(this).text()+'</div><div class="input-group col-sm-6"><input data-placement="bottomRight" style="opacity: 1;" class="form-control icp'+ number +' icp-auto" value="fa-archive" name="hp_tracking_icons[]" readonly type="text" /><span class="input-group-addon"></span></div></div>';
        
    number = number + 1;
});    
    
$('#iconlist').html(html);    
    
numbers.forEach(function(item, index) {
    $('.icp'+ item ).iconpicker();
    
    window.icon_values.push($('.icp'+ item).val());
            
    $('.icp'+ item).on('iconpickerSelected', function(e) {
        
         $('.iconpicker-popover').hide();
                
         $(this).attr("value",e.iconpickerInstance.getValue(e.iconpickerValue));
        
        });
    }); 
}
    
$( document ).ready(function() {    
    //iconList();
    $( "ul li.list-group-item" ).each(function(index) {
        $('.icp'+parseInt(index+1)).iconpicker();
    });
});
    
<?php foreach ($languages as $language) { ?>
$('#text-instruction-<?php echo $language['language_id']; ?>').summernote({height: 100});
<?php } ?>    
//--></script>

<?php echo $footer; ?>