<?php echo $header; ?>
<style>
  .companybanner {
   <?php if($partner['companybanner']) { ?>
      background:url("<?php echo $partner['companybanner']; ?>") no-repeat scroll center center / 100% 325px rgba(0, 0, 0, 0);
    <?php } else if($partner["backgroundcolor"]) { ?>
      background-color:<?php echo $partner["backgroundcolor"]; ?>;
    <?php } else { ?>
      background-color: #2BA9EF;
    <?php } ?>
  }
</style>
<div class="container">
  <div>
    <div id="content" class="col-sm-12">

      <div class="row companybanner" style="min-height:200px;">
        <div class="company-logo pull-right">
          <?php if(isset($partner['companylogo']) && $partner['companylogo']) { ?>
            <img src="<?php echo $partner['companylogo']; ?>" alt="<?php echo $partner['companyname']; ?>" class="">
          <?php } ?>
        </div>
      </div>

      <div class="row" style="min-height:200px;margin:10px -30px;">
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
          <div class="row">
            <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
              <?php if(isset($partner['avatar']) && $partner['avatar']) { ?>
                <img src="<?php echo $partner['avatar']; ?>" alt="<?php echo $partner['firstname']; ?>" style="border-radius:60px;margin-left: 25px;margin-top: -70px;">
              <?php } ?>
            </div>
            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
              <div class="upper-detail">
                <?php echo $partner['firstname']." ".$partner['lastname']; ?>
              </div>

              <div class="lower-detail">
                <?php for ($i = 1; $i <= round($feedback_total); $i++) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-5x"></i></span>
                <?php } ?>
                <?php for ($j = 1; $j <= 5 - round($feedback_total); $j++) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-5x"></i></span>
                <?php } ?>
              </div>

              <?php if ($telephone || $customer_id == $seller_id) { ?>
                <div class="seller-mobile">
                  <i class="fa fa-phone"></i>&nbsp&nbsp&nbsp
                  <?php echo $partner['telephone']; ?>
                </div>
              <?php } ?>

              <?php if ($email || $customer_id == $seller_id) { ?>
                <div class="seller-email">
                  <i class="fa fa-envelope-o"></i>&nbsp&nbsp&nbsp
                  <?php echo $partner['email']; ?>
                </div>
              <?php } ?>

            </div>
          </div>
          <div class="row">
            <?php if ($marketplace_customercontactseller) {?>
                <div class="cennect-text">
                  <?php echo $text_connect; ?>
                  <div class="connect-icons">
                  <span>
                    <?php if(isset($partner['facebookid']) && $partner['facebookid']) { ?>
                      <a href="http://facebook.com/<?php echo $partner['facebookid'] ?>">
                        <i class="fa fa-facebook-square"></i>
                      </a>
                    <?php } ?>
                  </span>
                  <span>
                    <?php if(isset($partner['twitterid']) && $partner['twitterid']) { ?>
                      <a href="http://twitter.com/<?php echo $partner['twitterid'] ?>">
                        <i class="fa fa-twitter"></i>
                      </a>
                    <?php } ?>
                  </span>
                  <span>
                    <?php if($logged) { ?>
                      <a data-target="#myModal-seller-mail" data-toggle="modal">
                        <i class="fa fa-envelope-o"></i>
                      </a>
                    <?php } else { ?>
                      <a href="<?php echo $login; ?>" data-toggle="tooltip" data-original-title="<?php echo $text_login_contact; ?>">
                        <i class="fa fa-envelope"></i>
                      </a>
                    <?php } ?>
                  </span>
                </div><!-- connect-icons -->
              </div>
            <?php } ?>
          </div>
        </div>

        <div id="tab-location" class="col-xs-12 col-sm-6 col-md-8 col-lg-8">

        </div>
      </div>

      <div class="row">
        <ul class="nav nav-tabs" style="display:flex;">
          <li class="active mp-list-group-item" style="border-top: solid 5px #2BA9EF !important;">
            <a href="#tab-profile" data-toggle="tab"><center><img src="image/MP/profile.png" /></center><?php echo $text_profile; ?></a>
          </li>
          <?php if(isset($public_seller_profile) && in_array('store',$public_seller_profile)) { ?>
          <li class="mp-list-group-item" style="border-top: solid 5px #2BA9EF !important;">
            <a href="#tab-store" data-toggle="tab"><center><img src="image/MP/about.png" /></center><?php echo $text_store; ?></a>
          </li>
          <?php } ?>

          <?php if(isset($public_seller_profile) && in_array('collection',$public_seller_profile)) { ?>
          <li class="mp-list-group-item" style="border-top: solid 5px #2BA9EF !important;">
            <a href="#tab-collection" data-toggle="tab"><center><img src="image/MP/collection.png" /></center><?php echo $text_collection.' ('.($collection_total ? $collection_total : '0').')'; ?></a>
          </li>
          <?php } ?>
          <?php if(isset($public_seller_profile) && in_array('review',$public_seller_profile)) { ?>
          <li class="mp-list-group-item" style="border-top: solid 5px #2BA9EF !important;">
            <a href="#tab-reviews" data-toggle="tab"><center><img src="image/MP/review.png" /></center><?php echo $text_reviews.' ('.($feedback_total ? round($feedback_total,1) : '0').')'; ?></a>
          </li>
          <?php } ?>
          <?php if(isset($public_seller_profile) && in_array('productReview',$public_seller_profile)) { ?>
          <li class="mp-list-group-item" style="border-top: solid 5px #2BA9EF !important;">
            <a href="#tab-product-reviews" data-toggle="tab"><center><img src="image/MP/product.png" /></center><?php echo $text_product_reviews.' ('.($product_feedback_total ? $product_feedback_total : '0').')'; ?></a>
          </li>
          <?php } ?>
        </ul>
        <div class="tab-content">

          <div class="tab-pane active tab_style" style="text-align: justify;" id="tab-profile">
            <?php echo html_entity_decode($partner['shortprofile']); ?>

<?php if (isset($informations) && $informations) { ?>
  <h3 style="line-height: 24px;color: rgb(0, 0, 0);margin-top: 0px;"><?php echo $text_seller_information; ?></h3>
  <?php foreach ($informations as $information) { ?>
    <div>
      <a href="<?php echo $information['href']; ?>" target="_blank"><?php echo $information['title']; ?></a>
    </div>
  <?php } ?>
<?php } ?>
          </div> <!-- tab-profile -->

          <?php if(isset($public_seller_profile) && in_array('store',$public_seller_profile)) { ?>
            <div id="tab-store" style="text-align: justify;" class="tab-pane tab_style">
              <?php echo html_entity_decode($partner['companydescription']); ?>
            </div> <!-- tab-store -->
          <?php } ?>

          <?php if(isset($public_seller_profile) && in_array('review',$public_seller_profile)) { ?>
            <div id="tab-reviews" class="tab-pane tab_style">
              <?php if ($customer_id != $seller_id) {?>
                <div class="pull-right">
                  <?php if($logged) { ?>
                    <?php if ($give_review) {?>
                      <button type="button" data-toggle="modal" class="btn btn-block button" data-target="#myModal-seller-review">
                      <?php echo $text_write_review; ?>
                    <?php } ?>
                    </button>
                  <?php } else { ?>
                    <a href="<?php echo $login; ?>" class="btn btn-block button" data-toggle="tooltip" data-original-title="<?php echo $text_login_review; ?>">
                      <?php echo $text_write_review; ?>
                    </a>
                  <?php } ?>
                </div>
              <?php } ?>
              <div id="prev-reviews">
              </div>
            </div> <!-- tab-reviews -->
          <?php } ?>

          <?php if(isset($public_seller_profile) && in_array('productReview',$public_seller_profile)) { ?>
            <div id="tab-product-reviews" class="tab-pane tab_style"></div> <!-- tab-product-reviews -->
          <?php } ?>

          <?php if(isset($public_seller_profile) && in_array('collection',$public_seller_profile)) { ?>
            <div id="tab-collection" class="tab-pane tab_style"></div> <!-- tab-collection -->
          <?php } ?>
          <div id="dummy-collection"></div>
        </div>
      </div>
    </div>
  </div>
</div>

<?php if($logged){ ?>
<div class="modal fade" id="myModal-seller-mail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"><?php echo $text_close; ?></span></button>
        <h3 class="modal-title"><?php echo $text_ask_seller; ?></h3>
      </div>
      <form id="seller-mail-form">
        <div class="modal-body">
          <div class="form-group required">
            <label class="control-label" for="input-subject"><?php echo $text_subject; ?></label>
            <input type="text" name="subject" id="input-subject" class="form-control" />
            <?php if(isset($partner)){ ?>
            <input type="hidden" name="seller" value="<?php echo $seller_id;?>"/>
            <?php } ?>
          </div>
          <div class="form-group required">
            <label class="control-label" for="input-message"><?php echo $text_ask; ?></label>
            <textarea class="form-control" name="message" rows="3" id="input-message"></textarea>
          </div>
          <div class="error text-center text-danger"></div>
        </div>
      </form>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $text_close; ?></button>
        <button type="button" class="btn btn-primary" id="send-mail"><?php echo $text_send; ?></button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<?php } ?>

  <div class="modal fade" id="myModal-seller-review" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"><?php echo $text_close; ?></span></button>
        <h3 class="modal-title"><?php echo $text_write_review; ?></h3>
      </div>
      <div class="modal-body" id="review-modal">
        <form class="form-horizontal" id="seller_review_form">
          <div class="form-group required">
            <div class="col-sm-12">
              <label class="control-label" for="input-name"><?php echo $text_nickname; ?></label>
              <input type="text" name="name" value="" id="input-name" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <div class="col-sm-12">
              <label class="control-label" for="input-review"><?php echo $text_review; ?></label>
              <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
              <div class="help-block"><?php echo $text_note; ?></div>
            </div>
          </div>
          <?php if(isset($review_fields) && $review_fields){
            foreach($review_fields AS $review_field){ ?>
              <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label"><?php echo $review_field['field_name']; ?></label>
                  &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                  <?php for ($i=1; $i <=5 ; $i++) { ?>
                    <input type="radio" id="review_attributes[<?php echo $review_field['field_id']; ?>]" name="review_attributes[<?php echo $review_field['field_id']; ?>]" value="<?php echo $i; ?>" />
              		<?php } ?>
                  &nbsp;<?php echo $entry_good; ?>
                </div>
              </div>
            <?php }
          } ?>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $text_close; ?></button>
        <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $text_send; ?></button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
  $('.nav-tabs li a').on('click',function(){
    if ($(this).attr('href')) {
      localStorage.setItem("tab-active",$(this).attr('href'))
    }
  });

  $(document).ready(function(){

    localStorage.setItem('hide-child', 0);

    var tab_active = '#tab-profile';

    if (localStorage.getItem("tab-active")) {
      tab_active = localStorage.getItem("tab-active");
    }

    if (tab_active) {
      $('[href*='+tab_active+']').parent().addClass('active');
      $('[href*='+tab_active+']').parent().siblings().removeClass('active');
      $(tab_active).addClass('active');
      $(tab_active).siblings().removeClass('active');

      var src = $('[href*='+tab_active+']').find('img').attr('src');

      src = src.substring(0, src.indexOf('.'));

      src = src + '-active.png';

      $('[href*='+tab_active+']').find('img').attr('src',src);
    }
  });
</script>

<script type="text/javascript">

$('.mp-list-group-item a').on('click',function(){
  var src = $(this).find('img').attr('src');
  if (src.substring(0, src.indexOf('-'))) {
    src = src.substring(0, src.indexOf('-'));
  } else {
    src = src.substring(0, src.indexOf('.'));
  }

  src = src + '-active.png';

  $(this).find('img').attr('src',src)

  $($(this).parent().siblings().find('img')).each(function(index,value) {
    var sibling_src = $(this).attr('src');

    if (sibling_src.substring(0, sibling_src.indexOf('-'))) {
      sibling_src = sibling_src.substring(0, sibling_src.indexOf('-'));
    } else {
      sibling_src = sibling_src.substring(0, sibling_src.indexOf('.'));
    }
    sibling_src = sibling_src + '.png';

    $(this).attr('src',sibling_src)
  });
});

collectionUrl = '<?php echo $collection; ?>';

function loadCollection(showMenu){
  $.ajax({
    url : collectionUrl,
    dataType: 'html',
    success: function(response) {
      categoryMenu = $(response).find('#column-left').html();
      $('#category-menu').remove();
      $('.left-panel').append(categoryMenu);
      $('#tab-collection').html(response);
      if(showMenu) {
        $('#category-menu').show();
      }
      if (localStorage.getItem('display') == 'list') {
        $('#list-view').trigger('click');
      } else {
        $('#grid-view').trigger('click');
      }

      if ($('#category-menu li').hasClass('hide-child')) {
        if (localStorage.getItem("hide-child") == 1) {
          $('.hide-child').addClass('hide');
          localStorage.setItem('hide-child', 0);
        } else{
          localStorage.setItem('hide-child', 1);
        }
      }
    }
  })
}

(function($) {
  $('#main-tab li').on('click', function() {
    tab = $(this).children('a').data('tab');
    $('.mp-list-group li').removeClass('mp-active');
    $(this).addClass('mp-active');
    $('.mp-tab-content').removeClass('mp-tab-active');
    $(tab).addClass('mp-tab-active');
    if(tab == '#tab-collection') {
      $('#category-menu').show();
    } else {
      $('#category-menu').hide();
    }
  });

  $.ajax({
      url : '<?php echo $feedback; ?>',
      dataType: 'html',
      success: function(response) {
        $('#prev-reviews').html(response);
      }
    });

  $.ajax({
    url : '<?php echo $product_feedback; ?>',
    dataType: 'html',
    success: function(response) {
      $('#tab-product-reviews').html(response);
    }
  });

  loadCollection(false);

})(jQuery)

$('body').on('click', '#category-menu li', function() {
  collectionUrl = $(this).children('a').data('collection-url');
  $('#category-menu li').removeClass('mp-active');
  $(this).addClass('mp-active');
  loadCollection(true);
})

<?php if($showCollection) { ?>
  $('a[href="#tab-collection"]').trigger('click');
<?php } ?>

<?php if($logged){ ?>
$('#send-mail').on('click',function(){
  f = 0;
  $('#myModal-seller-mail input[type=\'text\'],#myModal-seller-mail textarea').each(function () {
    if ($(this).val() == '') {
      $(this).parent().addClass('has-error');
      f++;
    }else{
      $(this).parent().removeClass('has-error');
    }
  });

  if (f > 0) {
    $('#myModal-seller-mail .error').text('<?php echo $text_error_mail; ?>').slideDown('slow').delay(2000).slideUp('slow');
  } else {
    $('#send-mail').addClass('disabled');
    $('#myModal-seller-mail').addClass('mail-procss');
    $('.alert-success').remove();
    $('#myModal-seller-mail .modal-body').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $text_success_mail; ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>');
    $.ajax({
      url: '<?php echo $send_mail; ?>',
      data: $('#seller-mail-form').serialize()+'<?php echo $mail_for; ?>',
      type: 'post',
      dataType: 'json',
      complete: function () {
        $('#send-mail').removeClass('disabled');
        $('#myModal-seller-mail input,#myModal-seller-mail textarea').each(function () {
          if(this.type != 'hidden'){
            $(this).val('');
            $(this).text('');
          }
        });
      }
    });
  }
});
<?php } ?>
</script>

<script type="text/javascript">

$.ajax({
  url: '<?php echo $loadLocation; ?>',
  dataType: 'html',
  success: function(response) {
    $('#tab-location').html(response);
  }
});

localocation = false;
$('#main-tab li').on('click',function(){
  if(!localocation){
    $.ajax({
      url: '<?php echo $loadLocation; ?>',
      dataType: 'html',
      success: function(response) {
        $('#tab-location').html(response);
      }
    });
    localocation = true;
  }
})

/**
 * [To store feedback]
 * @return {none} [It will not return anything just reflect the form if unsuccessful and empty the form if successful]
 */
$('#button-review').on('click', function() {
  $.ajax({
    url: '<?php echo $writeFeedback; ?>',
    type: 'post',
    dataType: 'json',
    data: $('#seller_review_form input[type=\'text\'],input[type=\'radio\']:checked,textarea'),

    beforeSend: function() {
      $('#button-feedback').button('loading');
    },
    complete: function() {
      $('#button-feedback').button('reset');
    },
    success: function(json) {
      $('.alert-success, .alert-danger').remove();

      if (json['error']) {
        $('#review-modal').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button class="close" type="button" data-dismiss="alert" >&times;</button></div>');
      }
      if (json['success']) {
        $('.alert-success').remove();
        $('#review-modal').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
        $('input[name=\'name\']').val('');
        $('textarea[name=\'text\']').val('');
        $('input[name=\'price_rating\']:checked').prop('checked', false);
        $('input[name=\'quality_rating\']:checked').prop('checked', false);
        $('input[name=\'value_rating\']:checked').prop('checked', false);
      }
    }
  });
});

</script>

<script>
// Product List
$('body').on('click', '#list-view', function() {
  $('#content .product-layout > .clearfix').remove();

  $('#content .product-layout').attr('class', 'product-layout product-list col-xs-12');

  localStorage.setItem('display', 'list');
});

// Product Grid
$('body').on('click', '#grid-view', function() {
  $('#content .product-layout > .clearfix').remove();

  // What a shame bootstrap does not take into account dynamically loaded columns
  cols = $('#column-right, #column-left').length;

  if (cols == 2) {
    $('#content .product-layout').attr('class', 'product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');

    // $('#content .product-layout:nth-child(2)').after('<div class="clearfix visible-md visible-sm"></div>');
  } else if (cols == 1) {
    $('#content .product-layout').attr('class', 'product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12');

    // $('#content .product-layout:nth-child(3)').after('<div class="clearfix visible-lg"></div>');
  } else {
    $('#content .product-layout').attr('class', 'product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12');

    // $('#content .product-layout:nth-child(3)').after('<div class="clearfix"></div>');
  }

   localStorage.setItem('display', 'grid');
});

if (localStorage.getItem('display') == 'list') {
  $('#list-view').trigger('click');
} else {
  $('#grid-view').trigger('click');
}

$('body').on('change', '#seller-collection select',function() {
  collectionUrl = this.value;
  loadCollection(true);
  // $('a[href=\'#tab-collection\']').append(' <i class="fa fa-spinner fa-spin remove-me"></i>');
  // $('#tab-collection').load(thisvalue,function(){
  //     $('.remove-me').remove();
  //   });
});

$('body').on('click','#seller-collection a',function(e){
  if(!$(this).hasClass('default-work'))
    e.preventDefault();
  else
    return;

  thisvalue = this.href;
  $('a[href=\'#tab-collection\']').append(' <i class="fa fa-spinner fa-spin remove-me"></i>');
  $('#tab-collection').load(thisvalue,function(){
      $('.remove-me').remove();
      if (localStorage.getItem('display') == 'list') {
        $('#list-view').trigger('click');
      } else {
        $('#grid-view').trigger('click');
      }
    });
});
</script>
<?php echo $footer; ?>
