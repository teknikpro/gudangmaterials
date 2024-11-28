<?php echo $header; ?>
<link type="text/css" href="catalog/view/theme/journal2/stylesheet/MP/journal2.css" rel="stylesheet"  />
<style type="text/css">
  header, .breadcrumb{
    z-index: 0 !important;
  }

  .cke_combopanel {
    z-index: 10 !important;
  }

  .imgoption{
    display: block;
    margin-top: 5px;
    width: 14%;
  }

  .imgoption button {
    width: 100%;
  }

  .img-thumbnail {
    border: 1px solid grey;
  }
  @media only screen and (width: 768px) {
  .pull-right{
    margin-right: 47px;
  }
  label{
    margin-right: 1px;
  }
}
</style>
<?php if($chkIsPartner){ ?>
<div id="container" class="container j-container">
   <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
    <div class="alert alert-danger warning"><i class="fa fa-check-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if($success){ ?>
    <div class="alert alert-success success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
<?php echo $column_right; ?>
    <div id="content" class="<?php echo $class; ?>">
      <?php echo $content_top; ?>
     <h1 class="heading-title"><?php echo $heading_title; ?></h1>

          <h2 class="secondary-title"><?php echo $text_account_information; ?></h2>
          <div class="buttons">
            <div class="pull-left">
              <a href="<?php echo $back; ?>" class="btn btn-default button"><i class="fa fa-reply"></i> <?php echo $button_back; ?></a></div>
            <div class="pull-right">
              <a href="<?php echo $view_profile; ?>" class="btn btn-primary button" target="_blank"><i class="fa fa-user"></i> <?php echo $text_view_profile; ?></a>
              <button type="submit" form="form-profile" class="btn btn-primary button"><i class="fa fa-save"></i> <?php echo $button_continue; ?></button>
            </div>
          </div>
          <?php if($isMember) { ?>
          <?php if(isset($allowed) && $allowed) { ?>
            <div class="alert alert-info information"><i class="fa fa-exclamation-circle"></i> <?php echo $text_profile_info; ?><button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
          <?php } ?>

          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-profile" class="form-horizontal">
          <ul id="tabs" class="nav nav-tabs htabs">
            <li class="active"><a href="#tab-profile_details" data-toggle="tab"><?php echo $tab_profile_details; ?></a></li>
            <?php if(isset($allowed['paypalid']) || isset($allowed['otherpayment']) || isset($allowed['taxinfo'])) { ?>
              <li><a href="#tab-paymentmode" data-toggle="tab"><?php echo $tab_paymentmode; ?></a></li>
            <?php } ?>
          </ul>

          <div class="tabs-content">

            <div class="tab-pane tab-content active" id="tab-profile_details">

              <div class="alert alert-info information"><i class="fa fa-exclamation-circle"></i> <?php echo $text_general; ?>
                <button type="button" class="close" data-dismiss="alert" >&times;</button>
              </div>

              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-firstname">
                  <span data-toggle="tooltip" title="<?php echo $text_firstname; ?>"><?php echo $text_firstname; ?></span>
                </label>
                <div class="col-sm-9">
                  <input disabled type="text" name="firstname" value="<?php echo $customer_details['firstname']; ?>" id="input-firstname" class="form-control" />
                    </div>
                </div>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-lastname">
                  <span data-toggle="tooltip" title="<?php echo $text_lastname; ?>"><?php echo $text_lastname; ?></span>
                </label>
                <div class="col-sm-9">
                  <input disabled type="text" name="lastname" value="<?php echo $customer_details['lastname']; ?>" id="input-lastname" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-email">
                  <span data-toggle="tooltip" title="<?php echo $text_email; ?>"><?php echo $text_email; ?></span>
                </label>
                <div class="col-sm-9">
                  <input disabled type="text" name="email" value="<?php echo $customer_details['email']; ?>" id="input-email" class="form-control" />
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-screenname"><span data-toggle="tooltip" title="<?php echo $text_sef_url; ?>"><?php echo $text_screen_name; ?></span></label>
                <div class="col-sm-9">
                  <input type="text" name="screenName" value="<?php echo $partner['screenname']; ?>"  id="input-screenname" class="form-control" />
                  <?php if(isset($screenname_error) && $screenname_error) { ?>
                    <div class="text-danger">
                        <?php echo $screenname_error; ?>
                    </div>
                  <?php } ?>
                </div>
              </div>

              <?php if(isset($allowed['avatar'])) { ?>
               <div class="form-group">
                <label class="col-sm-3 control-label" for="input-avatar"><span data-toggle="tooltip" title="<?php echo $hover_avatar; ?>"><?php echo $text_avatar; ?></span></label>
                <div class="col-sm-9">
                  <div style="width:100px;height:100px;overflow:hidden" class="img-thumbnail wk_upload_img">
                    <img id="avatar-thumb-image" src="<?php echo $partner['avatar']?>" alt="" title=""/>
                  </div>
                  <input type="hidden" name="avatar" value="<?php echo $partner['avatar_img']; ?>" id="avatar-target-image"/>
                  <div class="btn-group imgoption">
                    <button class="btn btn-sm delete_img button" type="button"><?php echo $text_remove;?></button>
                  </div>
                </div>
              </div>
              <?php } ?>

              <?php if(isset($allowed['gender'])) { ?>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-gender"><?php echo $text_gender; ?></label>
                <div class="col-sm-9">
                  <select name="gender" class="form-control">
                    <option value="#"></option>
                    <option value="M" <?php if($partner['gender']=='M'){ echo 'selected'; }?>><?php echo $text_male; ?></option>
                    <option value="F" <?php if($partner['gender']=='F'){ echo 'selected'; }?>><?php echo $text_female; ?></option>
                  </select>
                </div>
              </div>
              <?php } ?>

              <?php if(isset($allowed['shortprofile'])) { ?>
              <div class="form-group">
                 <label class="col-sm-3 control-label" for="input-shortprofile"><?php echo $text_short_profile; ?></label>
                <div class="col-sm-9">
                  <textarea name="shortProfile" id="input-shortprofile" class="form-control"><?php echo $partner['shortprofile']; ?></textarea>
                </div>
              </div>
              <?php } ?>

              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-companyName">
                  <span data-toggle="tooltip" title="<?php echo $text_company_name; ?>"><?php echo $text_company_name; ?></span>
                </label>
                <div class="col-sm-9">
                  <input type="text" name="companyName" value="<?php echo $partner['companyname']; ?>" id="input-companyName" class="form-control" />
                  <?php if(isset($companyname_error) && $companyname_error) { ?>
                    <div class="text-danger">
                        <?php echo $companyname_error; ?>
                    </div>
                  <?php } ?>
                </div>
              </div>

              <?php if(isset($allowed['twitterid'])) { ?>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-twitterId">
                  <span data-toggle="tooltip" title="<?php echo $text_twitter_id; ?>"><?php echo $text_twitter_id; ?></span>
                </label>
                <div class="col-sm-9">
                  <input type="text" name="twitterId" value="<?php echo $partner['twitterid']; ?>" id="input-twitterId" class="form-control" />
                </div>
              </div>
              <?php } ?>

              <?php if(isset($allowed['facebookid'])) { ?>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-facebookId">
                  <span data-toggle="tooltip" title="<?php echo $text_facebook_id; ?>"><?php echo $text_facebook_id; ?></span>
                </label>
                <div class="col-sm-9">
                  <input type="text" name="facebookId" value="<?php echo $partner['facebookid']; ?>" id="input-facebookId" class="form-control" />
                </div>
              </div>
              <?php } ?>

              <?php if(isset($allowed['companylocality'])) { ?>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-companyLocality">
                  <span data-toggle="tooltip" title="<?php echo $text_company_locality; ?>"><?php echo $text_company_locality; ?></span>
                </label>
                <div class="col-sm-9">
                  <input type="text" name="companyLocality" value="<?php echo $partner['companylocality']; ?>" id="input-companyLocality" class="form-control" />
                </div>
              </div>
              <?php } ?>


              <?php if(isset($allowed['country'])) { ?>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-countryLogo">
                  <span data-toggle="tooltip" title="<?php echo $text_country_logo; ?>"><?php echo $text_country_logo; ?></span>
                </label>
                <div class="col-sm-9">
                  <div class="input-group"><!-- <span class="input-group-addon">
                    <img class="wk_countrylogo" src="<?php echo $partner['countrylogo']?>" /></span> -->
                    <input id="countryLogo" class="form-control" type="hidden" name="countryLogo" value="<?php echo $partner['countrylogo']; ?>"/>
                    <select id="country" class="form-control" name="country" style="margin-left:0px;">
                      <?php foreach($countries as $countr){ if($partner['country']==$countr['iso_code_2']){ ?>
                      <option value="<?php echo $countr['iso_code_2'];?>" selected><?php echo $countr['name'];?></option>
                      <?php } else { ?>

                      <option value="<?php echo $countr['iso_code_2'];?>"><?php echo $countr['name'];?></option>
                        <?php } }?>
                    </select>
                  </div>
                </div>
              </div>
              <?php } ?>

              <?php if(isset($allowed['backgroundcolor'])) { ?>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-backgroundcolor"><span data-toggle="tooltip" title="<?php echo $text_theme_background_color; ?>"><?php echo $text_theme_background_color; ?></span></label>
                <div class="col-sm-9">
                  <div class="input-group bgcolorpicker">
                    <span class="input-group-addon"><i></i></span>
                    <div id="color">
                    <input type="text" name="backgroundcolor" value="<?php echo $partner['backgroundcolor']; ?>"  id="input-backgroundcolor" class="form-control"/>
                    </div>
                  </div>
                </div>
              </div>
              <?php } ?>

              <?php if(isset($allowed['companybanner'])) { ?>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-companybanner"><span data-toggle="tooltip" title="<?php echo $hover_banner; ?>"><?php echo $text_company_banner; ?></span></label>
                <div class="col-sm-9">
                  <div style="width:100px;height:100px;overflow:hidden" class="img-thumbnail wk_upload_img">
                    <img id="companybanner-thumb-image" src="<?php echo $partner['companybanner']?>" alt="" title=""/>
                  </div>
                  <input type="hidden" name="companybanner" value="<?php echo $partner['companybanner_img']; ?>" id="companybanner-target-image"/>
                  <div class="btn-group imgoption">
                    <button class="btn btn-sm delete_img button" type="button" ><?php echo $text_remove;?></button>
                  </div>
                </div>
              </div>
              <?php } ?>

              <?php if(isset($allowed['companylogo'])) { ?>
               <div class="form-group">
                <label class="col-sm-3 control-label" for="input-companylogo">
                  <span data-toggle="tooltip" title="<?php echo $hover_company_logo; ?>"><?php echo $text_company_logo; ?></span>
                </label>
                <div class="col-sm-9">
                  <div style="width:100px;height:100px;overflow:hidden" class="img-thumbnail wk_upload_img">
                    <img id="companylogo-thumb-image" src="<?php echo $partner['companylogo']?>" alt="" title=""/>
                  </div>
                  <input type="hidden" name="companylogo" value="<?php echo $partner['companylogo_img']; ?>" id="companylogo-target-image"/>
                  <div>
                    <br><button class="btn btn-sm delete_img button" type="button"><?php echo $text_remove;?><?php echo " Logo";?></button>
                  </div>
                </div>
              </div>
              <?php } ?>

              <?php if(isset($allowed['companydescription'])) { ?>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-companydescription"><?php echo $text_company_description; ?></label>
                <div class="col-sm-9">
                  <textarea name="companyDescription" id="input-companydescription" class="form-control"><?php echo $partner['companydescription']; ?></textarea>
                </div>
              </div>
              <?php } ?>

            </div>

            <?php if(isset($allowed['paypalid']) || isset($allowed['otherpayment']) || isset($allowed['taxinfo'])) { ?>
              <div class="tab-pane tab-content" id="tab-paymentmode">
                <div class="alert alert-info information"><i class="fa fa-exclamation-circle"></i> <?php echo $text_paymentmode; ?>
                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
                <?php if(isset($allowed['paypalid'])) { ?>
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="input-paypalfirst">
                      <span data-toggle="tooltip" title="<?php echo $help_paypal_firstname; ?>"><?php echo $text_paypal_ . ' ' . $text_firstname; ?></span>
                    </label>
                    <div class="col-sm-9">
                      <input type="text" name="paypalfirst" value="<?php echo $partner['paypalfirst']; ?>" id="input-paypalfirst" class="form-control" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-3 control-label" for="input-paypallast">
                      <span data-toggle="tooltip" title="<?php echo $help_paypal_lastname; ?>"><?php echo $text_paypal_ . ' ' . $text_lastname; ?></span>
                    </label>
                    <div class="col-sm-9">
                      <input type="text" name="paypallast" value="<?php echo $partner['paypallast']; ?>" id="input-paypallast" class="form-control" />
                    </div>
                  </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label" for="input-paypalid">
                    <span data-toggle="tooltip" title="<?php echo $text_payment_detail; ?>"><?php echo $text_payment_detail; ?></span>
                  </label>
                  <div class="col-sm-9">
                    <input type="text" name="paypalid" value="<?php echo $partner['paypalid']; ?>" id="input-paypalid" class="form-control" />
                    <?php if(isset($paypal_error) && $paypal_error) { ?>
                      <div class="text-danger"><?php echo $paypal_error; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>
                <?php if(isset($allowed['otherpayment'])) { ?>
				
				
                <div class="form-group">
                  <!--<label class="col-sm-3 control-label" for="input-paypalid">
                    <span data-toggle="tooltip" title="<?php echo $text_otherpayment; ?>"><?php echo $text_otherpayment; ?></span>
                  </label>-->
                  <div class="col-sm-9">
                    <textarea data-placeholder="<?php echo $text_bankinfo; ?>" class="form-control" name="otherpayment"><?php echo $partner['otherpayment']; ?></textarea>
                  </div>
                </div>				
				
     
                <?php } ?>

                <?php if(isset($allowed['taxinfo'])) { ?>
                <div class="form-group">
                  <label class="col-sm-3 control-label" for="input-paypalid">
                    <span data-toggle="tooltip" title="<?php echo $text_taxinfo; ?>"><?php echo $text_taxinfo; ?></span>
                  </label>
                  <div class="col-sm-9">
                    <textarea data-placeholder="<?php echo $text_taxinfo; ?>" class="form-control" name="taxinfo"><?php echo $partner['taxinfo']; ?></textarea>
                  </div>
                </div>
                <?php } ?>
              </div>
            <?php } ?>
        </div>
      </form>
      <?php } else { ?>
        <div class="text-danger">
          <?php echo $error_warning_authenticate; ?>
        </div>
      <?php } ?>

  </div>
  <?php }else{ ?>
    <div class="alert alert-danger warning"><i class="fa fa-exclamation-circle"></i><?php echo $warning_become_seller; ?><button type="button" class="close" data-dismiss="alert">×</button> </div>
  <?php } ?>
  </div>
</div>
<script src="catalog/view/javascript/wk_common.js"></script>
<script src="//cdn.ckeditor.com/4.5.5/standard/ckeditor.js"></script>

<script type="text/javascript"><!--

$('button[name="edit_img"]').on('click',function(){
  $(this).parent().prevAll('input[type="file"]').trigger('click');
});

$('button[name="delete_img"]').on('click',function(){
  $(this).parent().prevAll('div').children('img').hide();
  $(this).parent().prevAll('input[type="hidden"]').val(1);
});

CKEDITOR.replace('input-shortprofile', {
    filebrowserBrowseUrl: 'index.php?route=common/filemanager&wk_ckeditor',
    filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&wk_ckeditor',
    filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&wk_ckeditor',
    filebrowserUploadUrl: 'index.php?route=common/filemanager&wk_ckeditor',
    filebrowserImageUploadUrl: 'index.php?route=common/filemanager&wk_ckeditor',
    filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&wk_ckeditor'
  });

  CKEDITOR.replace('input-companydescription', {
    filebrowserBrowseUrl: 'index.php?route=common/filemanager&wk_ckeditor',
    filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&wk_ckeditor',
    filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&wk_ckeditor',
    filebrowserUploadUrl: 'index.php?route=common/filemanager&wk_ckeditor',
    filebrowserImageUploadUrl: 'index.php?route=common/filemanager&wk_ckeditor',
    filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&wk_ckeditor'
  });

$("#country").change(function() {
  var scr='image/flags/'+$(this).val().toLowerCase()+'.png';
  $('.wk_countrylogo').attr('src',scr)
  $('#countryLogo').val(scr);
});

$('.click-file').on('click',function(){
  $(this).prev().trigger('click');
})

$wk_jq = $;
$wk_jq('#submit').click(function(){
  var count=0;
  $wk_jq('.is-not-empty').each(function(){
    if($wk_jq(this).val()==''){
      count++;
      $wk_jq(this).addClass('errorinput');
    }
  });
  if(count==0){
    return true;
  }else{
    $wk_jq('#content .warning').remove();
    $wk_jq('#content').prepend($wk_jq('<div/>').addClass('warning').text('Warning: Please check the form carefully for errors!'));
    return false;
  }
});

$wk_jq('.is-not-empty').focus(function(){
  $wk_jq(this).removeClass('errorinput');
});

$(function() {
   $("body").on("change","input[type='file']", function()
   {
    $.this = this;
       var files = !!this.files ? this.files : [];
       if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support

       if (/^image/.test( files[0].type)){ // only image file
           var reader = new FileReader(); // instance of the FileReader
           reader.readAsDataURL(files[0]); // read the local file

           reader.onloadend = function(){ // set image to display only
               src = this.result;
               $($.this).nextAll('input[type="hidden"]').val(0);
               $($.this).nextAll('.img-thumbnail').children('img').show('fast').attr('src',src);
           }
       }
   });
});

</script>
<link href="admin/view/javascript/color-picker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
<script src="admin/view/javascript/color-picker/js/bootstrap-colorpicker.min.js"></script>
<script type="text/javascript">
$(function(){
  $('.bgcolorpicker').colorpicker({'format':'hex'});
});
$(".note-toolbar").children().css({"display":"inline-block"});
$(".note-toolbar").find(".fa").css({"color":"#000"});
</script>
<?php echo $footer; ?>
