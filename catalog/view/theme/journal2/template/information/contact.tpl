<?php if (!isset($is_j2_popup)): ?>
<?php echo $header; ?>
<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> contact-page">
      <!--<h1 class="heading-title"><?php echo $heading_title; ?></h1>
    
      <h2 class="secondary-title"><?php echo $text_location; ?></h2>
      <div class="panel panel-default">
        <div class="panel-body">
          <div class="row">
            <?php if ($image) { ?>
            <div class="col-sm-3 col"><img src="<?php echo $image; ?>" alt="<?php echo $store; ?>" title="<?php echo $store; ?>" class="img-thumbnail" /></div>
            <?php } ?>
            <div class="col-sm-3 col"><strong><?php echo $store; ?></strong><br />
              <address>
              <?php echo $address; ?>
              </address>
              <?php if ($geocode) { ?>
              <a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=<?php echo isset($geocode_hl) ? $geocode_hl : 'en'; ?>&t=m&z=15" target="_blank" class="btn btn-info button"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
              <?php } ?>
            </div>
            <div class="col-sm-3 col"><strong><?php echo $text_telephone; ?></strong><br>
              <?php echo $telephone; ?><br />
              <br />
              <?php if ($fax) { ?>
              <strong><?php echo $text_fax; ?></strong><br>
              <?php echo $fax; ?>
              <?php } ?>
            </div>
            <div class="col-sm-3 col">
              <?php if ($open) { ?>
              <strong><?php echo $text_open; ?></strong><br />
              <?php echo $open; ?><br />
              <br />
              <?php } ?>
              <?php if ($comment) { ?>
              <strong><?php echo $text_comment; ?></strong><br />
              <?php echo $comment; ?>
              <?php } ?>
            </div>
          </div>
        </div>
      </div> -->
      <?php if ($locations) { ?>
      <h2 class="secondary-title"><?php echo $text_store; ?></h2>
      <div class="panel-group" id="accordion">
        <?php foreach ($locations as $location) { ?>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
            <div class="panel-body">
              <div class="row">
                <?php if ($location['image']) { ?>
                <div class="col-sm-3"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" class="img-thumbnail" /></div>
                <?php } ?>
                <div class="col-sm-3"><strong><?php echo $location['name']; ?></strong><br />
                  <address>
                  <?php echo $location['address']; ?>
                  </address>
                  <?php if ($location['geocode']) { ?>
                  <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=<?php echo isset($geocode_hl) ? $geocode : 'en'; ?>&t=m&z=15" target="_blank" class="btn btn-info button"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                  <?php } ?>
                </div>
                <div class="col-sm-3"> <strong><?php echo $text_telephone; ?></strong><br>
                  <?php echo $location['telephone']; ?><br />
                  <br />
                  <?php if ($location['fax']) { ?>
                  <strong><?php echo $text_fax; ?></strong><br>
                  <?php echo $location['fax']; ?>
                  <?php } ?>
                </div>
                <div class="col-sm-3">
                  <?php if ($location['open']) { ?>
                  <strong><?php echo $text_open; ?></strong><br />
                  <?php echo $location['open']; ?><br />
                  <br />
                  <?php } ?>
                  <?php if ($location['comment']) { ?>
                  <strong><?php echo $text_comment; ?></strong><br />
                  <?php echo $location['comment']; ?>
                  <?php } ?>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
<?php else: ?>
<?php if (version_compare(VERSION, '2.0.2', '>=') && version_compare(VERSION, '2.1', '<')): ?>
<?php endif; ?>
<?php endif; ?>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <?php if (isset($product_id) && $product_id): ?>
          <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
          <?php endif; ?>
          <?php if (!isset($is_j2_popup)): ?>
          <h2 class="secondary-title"><?php echo $text_contact; ?></h2>
          <?php endif; ?>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-10">
              <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
            <div class="col-sm-10">
              <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
              <?php if ($error_enquiry) { ?>
              <div class="text-danger"><?php echo $error_enquiry; ?></div>
              <?php } ?>
            </div>
          </div>

          <div class="form-group required">
          <script src='https://www.google.com/recaptcha/api.js'></script>
            <label class="col-sm-2 control-label" >Anti Spam</label>
            <div class="col-sm-10">
              <div class="g-recaptcha" data-sitekey="6LcEJV8qAAAAABHDAmjMjXeiFDBBFnhZcUFPD-DM"></div>
              <?php if ($anti_spam) { ?>
              <div class="text-danger"><?php echo $anti_spam; ?></div>
              <?php } ?>
            </div>
          </div>


          <!--<?php if (version_compare(VERSION, '2.0.2', '<')): ?>-->
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
            <div class="col-sm-10">
              <input type="text" name="captcha" id="input-captcha" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-10 pull-right">
              <img src="index.php?route=tool/captcha" alt="" />
              <?php if ($error_captcha) { ?>
              <div class="text-danger"><?php echo $error_captcha; ?></div>
              <?php } ?>
            </div>
          </div>
         <!--<?php elseif (version_compare(VERSION, '2.1', '<')): ?>
          <?php if ($site_key) { ?>
            <div class="form-group g-capthca">
              <div class="col-sm-offset-2 col-sm-10">
                <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                <?php if ($error_captcha) { ?>
                  <div class="text-danger"><?php echo $error_captcha; ?></div>
                <?php } ?>
              </div>
            </div>
          <?php } ?>
          <?php else: ?>
          <?php echo $captcha; ?>
          <?php endif; ?>-->
          <?php if (isset($is_j2_popup) && $this->journal2->settings->get('popup_privacy_information')): ?>
            <div class="form-group required">
              <?php if ($this->journal2->settings->get('popup_privacy_information')): ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="agree" value="1"/>
                    <?php echo $this->journal2->settings->get('popup_privacy_information.information_text'); ?>
                  </label>
                </div>
              <?php endif; ?>
            </div>
          <?php endif; ?>
        </fieldset>
        <?php if (!isset($is_j2_popup)): ?>
          <?php if ($this->journal2->settings->get('popup_privacy_information')) { ?>
            <div class="buttons">
              <div class="pull-right">
                <?php echo $this->journal2->settings->get('popup_privacy_information.information_text'); ?>
                <input type="checkbox" name="agree" value="1" />
                <input type="submit" value="<?php echo $button_submit; ?>" class="btn btn-primary button" />
              </div>
            </div>
          <?php } else { ?>
            <div class="buttons">
              <div class="pull-right">
                <input type="submit" value="<?php echo $button_submit; ?>" class="btn btn-primary button" />
              </div>
            </div>
          <?php } ?>
        <?php endif; ?>
      </form>
      <?php if (!isset($is_j2_popup)): ?>
      <?php echo $content_bottom; ?></div>
    </div>
</div>
<?php echo $footer; ?>
<?php endif; ?>
