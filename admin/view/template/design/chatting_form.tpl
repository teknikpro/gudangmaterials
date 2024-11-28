<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">

  <div class="page-header">

    <div class="container-fluid">

      <div class="pull-right">

        <button type="submit" form="form-attribute" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>

        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>

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

    <div class="panel panel-default">

      <div class="panel-heading">

        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php if(isset($_REQUEST['chatting_id']) && $_REQUEST['chatting_id']){ echo "Edit chatting Topic"; } else { echo "Add Chatting Topic"; }; ?></h3>

      </div>

      <div class="panel-body">

        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-attribute" class="form-horizontal">

          <div class="form-group required">

            <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>

            <div class="col-sm-10">

            

              <div class="form-group">

                <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control" />

              </div>

              <?php if ($error_name) { ?>

              <div class="text-danger"><?php echo $error_name; ?></div>

              <?php } ?>


            </div>

          </div>

         <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-customer"><span data-toggle="tooltip" title="<?php echo $help_customer; ?>"><?php echo $entry_customer; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="customer" value="<?php echo $customer; ?>" placeholder="<?php echo $entry_customer; ?>" id="input-customer" class="form-control" />
              <input type="hidden" name="customer_id" value="<?php echo $customer_id; ?>" />
              <?php if ($error_customer) { ?>
              <div class="text-danger"><?php echo $error_customer; ?></div>
              <?php } ?>
            </div>
          </div>
	  
		  
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-seller"><span data-toggle="tooltip" title="<?php echo $help_seller; ?>"><?php echo $entry_seller; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="seller" value="<?php echo $seller; ?>" placeholder="<?php echo $entry_seller; ?>" id="input-seller" class="form-control" />
              <input type="hidden" name="seller_id" value="<?php echo $seller_id; ?>" />
			  
              <!--<?php if ($error_seller) { ?>
              <div class="text-danger"><?php echo $error_seller; ?></div>
              <?php } ?>-->
			  
            </div>
          </div>		  
		  
		  
          <div class="form-group required">

            <label class="col-sm-2 control-label"><?php echo $entry_description; ?></label>

            <div class="col-sm-10">

            

              <div class="form-group">
				<textarea name="description" id="description1" class="form-control"><?php echo $description; ?></textarea>
              

              </div>

              <?php if ($error_name) { ?>

              <div class="text-danger"><?php echo $error_name; ?></div>

              <?php } ?>


            </div>

          </div>
          <div class="form-group required">

            <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>

            <div class="col-sm-10">

            

              <div class="form-group">
				<select name="status" class="form-control">
                <?php if ($status == 0) { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				<option value="2"><?php echo $text_closed; ?></option>
				<?php } else if ($status == 1) { ?>
				<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
				<option value="2"><?php echo $text_closed; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
				<option value="2" selected="selected"><?php echo $text_closed; ?></option>
                <?php } ?>
                </select>
              

              </div>

              <?php if ($error_name) { ?>

              <div class="text-danger"><?php echo $error_name; ?></div>

              <?php } ?>


            </div>

          </div>


        </form>

      </div>

    </div>

  </div>

</div>
<script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
    html  = '<tbody id="image-row' + image_row + '">';
	html += '<tr>';
    html += '<td class="left">';
	<?php foreach ($languages as $language) { ?>
	html += '<input type="text" name="chatting_image[' + image_row + '][chatting_image_description][<?php echo $language['language_id']; ?>][title]" value="" /> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />';
    <?php } ?>
	html += '</td>';	
	html += '<td class="left"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + image_row + '" /><input type="hidden" name="chatting_image[' + image_row + '][image]" value="" id="image' + image_row + '" /><br /><a onclick="image_upload(\'image' + image_row + '\', \'thumb' + image_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + image_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + image_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
	html += '<td class="left"><a onclick="$(\'#image-row' + image_row  + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '</tr>';
	html += '</tbody>'; 
	
	$('#images tfoot').before(html);
	
	image_row++;
}
//--></script>
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 700,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript"><!--
CKEDITOR.replace('description1', {
 filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
 filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
 filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
 filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
 filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
 filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
//--></script>

  <script type="text/javascript"><!--
  <?php if ($customer_id) {?>
     var customer_id = <?php echo $customer_id; ?>;
  <?php }else{?>
     var customer_id = '';
  <?php } ?>

   <?php if ($seller_id) {?>
     var seller_id = <?php echo $seller_id; ?>;
  <?php }else{?>
     var seller_id = '';
  <?php } ?>
  // var customer_id = '';
  // var seller_id = '';
  $('input[name=\'customer\']').autocomplete({
  	'source': function(request, response) {
  		$.ajax({
  			url: 'index.php?route=design/chatting/autocomplete&token=<?php echo $token; ?>&filter_customer=' +  encodeURIComponent(request)+'&seller_id='+seller_id,
  			dataType: 'json',
  			success: function(json) {
  				response($.map(json, function(item) {
  					return {
  						label: item['name'],
  						value: item['customer_id']
  					}
  				}));
  			}
  		});
  	},
  	'select': function(item) {
      
  		$('input[name=\'customer\']').val(item['label']);
  		$('input[name=\'customer_id\']').val(item['value']);
      customer_id = item['value'];
  	}
  });

  $('input[name=\'seller\']').autocomplete({
    'source': function(request, response) {
      $.ajax({
        url: 'index.php?route=design/chatting/autocomplete&token=<?php echo $token; ?>&filter_seller=' +  encodeURIComponent(request)+'&customer_id='+customer_id,
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            return {
              label: item['name'],
              value: item['customer_id']
            }
          }));
        }
      });
    },
    'select': function(item) {
      
      $('input[name=\'seller\']').val(item['label']);
      $('input[name=\'seller_id\']').val(item['value']);
      seller_id = item['value'];
    }
  });
//--></script>


<?php echo $footer; ?>