<?php echo $header; ?><?php echo $separate_column_left; ?>
<style type="text/css">
  header, .breadcrumb{
    z-index: 12 !important;
  }

  .imgoption{
    display: block;
    margin-top: 5px;
    width: 14%;
  }

  .imgoption button {
    width: 100%;
  }
  @media only screen and (max-width: 767px) {
    .imgoption{
      width: 95px;
    }
  }
  .img-thumbnail {
    border: 1px solid grey;
  }
</style>

<?php if(isset($separate_view) && $separate_view){ ?>
  <div class="container-fluid" id="content">
<?php } else { ?>
  <div class="container">
<?php } ?>
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php if($chkIsPartner){ ?>
      <h1><?php echo $heading_title; ?>
        <div class="pull-right">
          <a href="<?php echo $view_profile; ?>" data-toggle="tooltip" title="<?php echo $text_view_profile; ?>" class="btn btn-success" target="_blank"><i class="fa fa-user"></i></a>
          <button type="submit" form="form-profile" data-toggle="tooltip" title="<?php echo $button_continue; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
          <a href="<?php echo $back; ?>" data-toggle="tooltip" title="<?php echo $button_back; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
        </div>
      </h1>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-profile" class="form-horizontal">
          <legend><i class="fa fa-list"></i> <?php echo $text_account_information; ?></legend>
          <?php if($isMember) { ?>
          <?php if(isset($allowed) && $allowed) { ?>
            <div class="alert alert-info"><i class="fa fa-exclamation-circle"></i> <?php echo $text_profile_info; ?>  <button type="button" class="close" data-dismiss="alert">×</button>
            </div>
          <?php } ?>
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-profile_details" data-toggle="tab"><?php echo $tab_profile_details; ?></a></li>
            <?php if(isset($allowed['paypalid']) || isset($allowed['otherpayment']) || isset($allowed['taxinfo'])) { ?>
              <li><a href="#tab-paymentmode" data-toggle="tab"><?php echo $tab_paymentmode; ?></a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-profile_details">
              <div class="alert alert-info"><i class="fa fa-exclamation-circle"></i> <?php echo $text_general; ?>
                <button type="button" class="close" data-dismiss="alert">×</button>
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
              <div class="form-group required">
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
                  <div style="width:110px;height:110px;overflow:hidden" class="img-thumbnail wk_upload_img">
                    <img id="avatar-thumb-image" src="<?php echo $partner['avatar']?>" alt="" title=""/>
                  </div>
                  <input type="hidden" name="avatar" value="<?php echo $partner['avatar_img']; ?>" id="avatar-target-image"/>
                  <div class="btn-group imgoption">
                    <button class="btn btn-danger btn-sm delete_img" type="button"><?php echo $text_remove;?></button>
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
              <div class="form-group required">
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
                  <div class="input-group"><span class="input-group-addon">
                    <img class="wk_countrylogo" src="<?php echo 'image/flags/'.strtolower($partner['country']).'.png'?>" /></span>
                    <input id="countryLogo" class="form-control" type="hidden" name="countryLogo" value="<?php echo $partner['countrylogo']; ?>"/>
                    <select id="country" class="form-control" name="country" >
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
                    <input type="text" name="backgroundcolor" value="<?php echo $partner['backgroundcolor']; ?>"  id="input-backgroundcolor" class="form-control" />
                  </div>
                </div>
              </div>
              <?php } ?>
              <?php if(isset($allowed['companybanner'])) { ?>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-companybanner"><span data-toggle="tooltip" title="<?php echo $hover_banner; ?>"><?php echo $text_company_banner; ?></span></label>
                <div class="col-sm-9">
                  <div style="width:110px;height:110px;overflow:hidden" class="img-thumbnail wk_upload_img">
                    <img id="companybanner-thumb-image" src="<?php echo $partner['companybanner']?>" alt="" title=""/>
                  </div>
                  <input type="hidden" name="companybanner" value="<?php echo $partner['companybanner_img']; ?>" id="companybanner-target-image"/>
                  <div class="btn-group imgoption">
                    <button class="btn btn-danger btn-sm delete_img" type="button" ><?php echo $text_remove;?></button>
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
                  <div style="width:110px;height:110px;overflow:hidden" class="img-thumbnail wk_upload_img">
                    <img id="companylogo-thumb-image" src="<?php echo $partner['companylogo']?>" alt="" title=""/>
                  </div>
                  <input type="hidden" name="companylogo" value="<?php echo $partner['companylogo_img']; ?>" id="companylogo-target-image"/>
                  <div class="btn-group imgoption">
                    <button class="btn btn-danger btn-sm delete_img" type="button"><?php echo $text_remove;?></button>
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
            <div class="tab-pane" id="tab-paymentmode">
              <div class="alert alert-info"><i class="fa fa-exclamation-circle"></i><?php echo $text_paymentmode; ?>
                <button type="button" class="close" data-dismiss="alert">×</button>
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
                    <div class="text-danger">
                        <?php echo $paypal_error; ?>
                    </div>
                  <?php } ?>
                </div>
              </div>
              <?php } ?>
              <?php if(isset($allowed['otherpayment'])) { ?>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-paypalid">
                  <span data-toggle="tooltip" title="<?php echo $text_otherpayment; ?>"><?php echo $text_otherpayment; ?></span>
                </label>
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
          <?php } else { ?>
            <div class="text-danger">
              <?php echo $error_warning_authenticate; ?>
            </div>
          <?php } ?>
      </form>
      <?php }else{ ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i><?php echo $warning_become_seller; ?><button type="button" class="close" data-dismiss="alert">×</button> </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script src="catalog/view/javascript/wk_common.js"></script>
<script src="admin/view/javascript/color-picker/js/bootstrap-colorpicker.min.js"></script>
<link href="admin/view/javascript/color-picker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
<script>
  $('#input-shortprofile, #input-companydescription').summernote({
    height: 300,
  });

  $("#country").change(function() {
    var scr='image/flags/'+$(this).val().toLowerCase()+'.png';
    $('.wk_countrylogo').attr('src',scr)
    $('#countryLogo').val(scr);
  });

  $(function(){
    $('.bgcolorpicker').colorpicker({'format':'hex'});
  });
</script>
<style type="text/css">
  .imgoption{
    display: block;
    margin-top: 5px;
    width: 18%;
  }

  .imgoption button {
    width: 100%;
  }
</style>
<?php echo $footer; ?>
