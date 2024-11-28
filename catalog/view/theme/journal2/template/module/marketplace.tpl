<link type="text/css" href="catalog/view/theme/journal2/stylesheet/MP/journal2.css" rel="stylesheet"  />
<style type="text/css">
	.button-group {
    border-top: none;
    background-color: white;
    overflow: auto;
    text-align: center;
    width: 100%;
}

</style>
<div class="box">
<?php if(isset($chkIsPartner)){ ?>
	<div class="box-content list-group">
	<ul>
		<?php if($chkIsPartner){ ?>
			<?php if(isset($marketplace_account_menu_sequence) && isset($marketplace_seller_mode) && $marketplace_seller_mode) { ?>
					<div class="box-heading"><?php echo $heading_title; ?></div>
					<?php foreach ($marketplace_account_menu_sequence as $key => $menu_option) {
						if(isset($marketplace_allowed_account_menu) && $marketplace_allowed_account_menu && in_array($key,$marketplace_allowed_account_menu)) {
							if($key == 'asktoadmin') { ?>
								<li><a id="ask-to-admin" class="list-group-item"  data-toggle="modal" data-target="#myModal-seller-mail">
									<?php echo $menu_option; ?>
								</a></li>
							<!-- <?php //} else if($key == 'notification') { ?>
			          <li><a id="notification" class="list-group-item"  data-toggle="modal" data-target="#myModal-notification">
			            <?php echo $menu_option.'('.$notification_total.')'; ?>
			          </a></li> -->
							<?php } else { ?>
								<?php if(isset($account_menu_href[$key]) && $account_menu_href[$key]) { ?>
									<li><a href="<?php echo $account_menu_href[$key]; ?>" class="list-group-item">
										<?php echo $menu_option; ?>
									</a></li>
								<?php } ?>
							<?php } ?>
						<?php } ?>
					<?php } ?>
			<?php } ?>
		<?php }else{ ?>
			<li><?php if(isset($hasApplied) && $hasApplied) { ?>
  <a class="list-group-item"><?php echo $text_alreadyPartner; ?></a>
<?php }else{ ?>
  <a href="<?php echo $want_partner; ?>" class="list-group-item"><?php echo $text_becomePartner; ?></a>
<?php } ?></li>
		<?php } ?>
	</ul>
	</div>
<?php } elseif (isset($partner)){ ?>
	<?php $addClass = 'col-lg-3 col-md-3 col-sm-6'; ?>
	<div class="row">
      <div class="product-layout product-grid col-xs-12">
        <div class="product-thumb product-wrapper">
          <br/>
          <div style="text-align: center;">            <br>
            <a href="<?php echo $partner['sellerHref']; ?>"><img src="<?php echo $partner['thumb']; ?>" alt="<?php echo $partner['name']; ?>" title="<?php echo $partner['name']; ?>" class="img-circle" style="box-shadow:0px 0px 5px 2px #f1f1f1;max-width:150px;"/></a>

            <h4 >
              <?php echo $text_seller; ?><span data-toggle="tooltip" title="<?php echo $text_seller; ?>"><i class="fa fa-user"></i></span>
              <a href="<?php echo $partner['sellerHref']; ?>"><?php echo $displayName; ?></a>
            </h4>
            <br>
            <p>
              <?php echo $text_from; ?><span data-toggle="tooltip" title="<?php echo $text_from; ?>"><i class="fa fa-home"></i></span>
              <b><?php echo $partner['country']; ?></b>
            </p>
            <br>
            <p>
              <?php echo $text_total_products; ?>
              <b><?php echo $partner['total_products']; ?></b>
            </p>
            <br>
            <?php if ($contact_mail) { ?>

            <?php if($contact_mail AND $logged){ ?>
            <p>
            	<button class="btn btn-primary button" data-toggle="modal" data-target="#myModal-seller-mail"><?php echo $text_ask_seller; ?></button>
        	</p>
        	<?php } else { ?>
            <p>
            	<button class="btn btn-primary button" onclick="window.location.href='<?php echo $redirect_user; ?>'"><?php echo $text_ask_seller; ?></button>
        	</p>
        	<?php } ?>
        	<?php } ?>
            <br>
            <p>
              <?php if(isset($show_seller_product) && !$show_seller_product) { ?>
              	<a href="<?php echo $collectionHref; ?>"><?php echo $text_latest_product; ?></a>
              <?php } else { ?>
              	<b><?php echo $text_latest_product; ?><i class="fa fa-arrow-down"></i> </b>
              <?php } ?>
            </p>            <br>
          </div>

        </div>
      </div>
      <?php if(isset($show_seller_product) && $show_seller_product) { ?>
	      <?php foreach ($latest as $product) { ?>
	      <div class="product-grid-item xs-100 sm-100 md-100 lg-100 xl-100 display-both block-button">
	        <div class="product-thumb product-wrapper" id="<?php echo $product['product_id']; ?>" style="margin-right:0px;">
	          <div class="image" style="margin-right: 0px;"><a href="<?php echo $product['href']; ?>"><center><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" style="max-width:150px;" /></center></a></div>
	          <div >
	            <div class="caption" style="text-align:center;">
	                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
	                <?php if ($product['rating']) { ?>
	                <div class="rating">
	                  <?php for ($i = 1; $i <= 5; $i++) { ?>
	                  <?php if ($product['rating'] < $i) { ?>
	                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
	                  <?php } else { ?>
	                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
	                  <?php } ?>
	                  <?php } ?>
	                </div>
	                <?php } ?>
	                <?php if ($product['price']) { ?>
	                <p class="price">
	                  <?php if (!$product['special']) { ?>
	                  <?php echo $product['price']; ?>
	                  <?php } else { ?>
	                  <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new" <?php echo isset($product['date_end']) && $product['date_end'] ? "data-end-date='{$product['date_end']}'" : ""; ?>><?php echo $product['special']; ?></span>
	                  <?php } ?>
	                  <?php if ($product['tax']) { ?>
	                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
	                  <?php } ?>
	                </p>
	                <?php } ?>
              </div>

	           <div class="button-group">
                <?php if (Journal2Utils::isEnquiryProduct($this, $product['product_id'])): ?>
                <div class="cart enquiry-button">
                  <a href="javascript:Journal.openPopup('<?php echo $this->journal2->settings->get('enquiry_popup_code'); ?>', '<?php echo $product['product_id']; ?>');" data-clk="addToCart('<?php echo $product['product_id']; ?>');" class="button hint--top" data-hint="<?php echo $this->journal2->settings->get('enquiry_button_text'); ?>"><?php echo $this->journal2->settings->get('enquiry_button_icon') . '<span class="button-cart-text">' . $this->journal2->settings->get('enquiry_button_text') . '</span>'; ?></a>
                </div>
                <?php else: ?>
                <div class="cart <?php echo isset($product['labels']) && is_array($product['labels']) && isset($product['labels']['outofstock']) ? 'outofstock' : ''; ?>">
                  <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button hint--top" data-hint="<?php echo $button_cart; ?>"><i class="button-left-icon"></i><span class="button-cart-text"><?php echo $button_cart; ?></span><i class="button-right-icon"></i></a>
                </div>
                <?php endif; ?>
                <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="hint--top" data-hint="<?php echo $button_wishlist; ?>"><i class="wishlist-icon"></i><span class="button-wishlist-text"><?php echo $button_wishlist;?></span></a></div>
                <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="hint--top" data-hint="<?php echo $button_compare; ?>"><i class="compare-icon"></i><span class="button-compare-text"><?php echo $button_compare;?></span></a></div>
              </div>
	          </div>
	        </div>
	      </div>
	      <?php } ?>
	    <?php } ?>
    </div>
<?php } ?>
</div>
<?php if($contact_mail AND $logged){ ?>
	<div class="modal fade" id="myModal-seller-mail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h2>
						<?php echo $text_ask_question; ?>
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"><?php echo $text_close; ?></span></button>
					</h2>
	      </div>
	      <form id="seller-mail-form">
		      <div class="modal-body">
		      	<div class="form-group required" style="width:97%;">
			        <label class="control-label" for="input-subject"><?php echo $text_subject; ?></label>
			        <input type="text" name="subject" id="input-subject" class="form-control" />
			        <?php if(isset($partner)){ ?>
			        	<input type="hidden" name="seller" value="<?php echo $seller_id;?>"/>
			        <?php } ?>
			    </div>
				<div class="form-group required" style="width:97%;">
			        <label class="control-label" for="input-message"><?php echo $text_ask; ?></label>
					<textarea class="form-control" name="message" rows="3" id="input-message"></textarea>
			    </div>
			    <div class="error"></div>
		      </div>
		  </form>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default button" data-dismiss="modal"><?php echo $text_close; ?></button>
	        <button type="button" class="btn btn-primary button" id="send-mail"><?php echo $text_send; ?></button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
<?php } ?>

<div class="modal fade" id="myModal-notification" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"><?php echo $text_close; ?></span></button>
				<h3 class="modal-title"><?php echo 'Hi ';if(isset($sellerProfile['firstname'])){echo $sellerProfile['firstname'];}if(isset($sellerProfile['lastname'])){echo ' '.$sellerProfile['lastname'];} ?></h3>
			</div>

			<div class="modal-body">
			  <?php if(isset($seller_notifications) && $seller_notifications){ ?>
			    <div class="form-group">
			      <ul style="display:inline-flex;margin-left:-8%;">
			        <li class="dropdown-header" style="font-size:15px;"><b><?php echo $text_order; ?></b></li>
			        <li style="display: block; overflow: auto;margin-top:5px;"><a href="<?php echo $view_all; ?>"><span class="label label-warning" style="margin-right: 5px;"><?php echo $processing_status_total; ?></span><?php echo $text_processing_status; ?></a></li>
			        <li style="display: block; overflow: auto;margin-left:40px;margin-right:40px;margin-top:5px;"><a href="<?php echo $view_all; ?>"><span class="label label-success" style="margin-right: 5px;"><?php echo $complete_status_total; ?></span><?php echo $text_complete_status; ?></a></li>
			        <li style="display: block; overflow: auto;margin-top:5px;"><a href="<?php echo $view_all; ?>"><span class="label label-danger" style="margin-right: 5px;"><?php echo $return_total; ?></span><?php echo $text_return; ?></a></li>
			      </ul>
			      <?php if(isset($seller_notifications) && $seller_notifications){ ?>
			        <ul>
			          <?php foreach($seller_notifications AS $seller_notification){ ?>
			            <li><?php echo $seller_notification; ?></li>
			          <?php } ?>
			          <li style="display: block; overflow: auto;"><a href="<?php echo $view_all; ?>"><?php echo $text_view_all; ?></a></li>
			        </ul>
			      <?php } ?>
			    </div>
			    <hr/>
			  <?php } ?>
			  <?php if(isset($seller_product_reviews) && $seller_product_reviews){ ?>
			    <div class="form-group">
			      <ul style="display:inline-flex;margin-left:-8%;">
			        <li class="dropdown-header" style="font-size:15px;"><b><?php echo $text_product; ?></b></li>
			        <li style="display: block; overflow: auto;margin-top:5px;"><a href="<?php echo $view_all; ?>"><span class="label label-warning" style="margin-right: 5px;"><?php echo $product_stock_total; ?></span><?php echo $text_stock; ?></a></li>
			        <li style="display: block; overflow: auto;margin-left:40px;margin-right:40px;margin-top:5px;"><a href="<?php echo $view_all; ?>"><span class="label label-success" style="margin-right: 5px;"><?php echo $review_total; ?></span><?php echo $text_entry_review; ?></a></li>
			        <li style="display: block; overflow: auto;margin-top:5px;"><a href="<?php echo $view_all; ?>"><span class="label label-danger" style="margin-right: 5px;"><?php echo $approval_total; ?></span><?php echo $text_approval; ?></a></li>
			      </ul>
			      <?php if(isset($seller_product_reviews) && $seller_product_reviews){ ?>
			        <ul>
			          <?php foreach($seller_product_reviews AS $seller_product_review){ ?>
			            <li><?php echo $seller_product_review; ?></li>
			          <?php } ?>
			          <li style="display: block; overflow: auto;"><a href="<?php echo $view_all.'&tab=product'; ?>"><?php echo $text_view_all; ?></a></li>
			        </ul>
			      <?php } ?>
			    </div>
			    <hr/>
			  <?php } ?>
			  <?php if(isset($seller_reviews) && $seller_reviews){ ?>
			    <div class="form-group">
			      <ul style="display:inline-flex;margin-left:-8%;">
			        <li class="dropdown-header" style="font-size:15px;"><b><?php echo $text_entry_seller; ?></b></li>
			        <li style="display: block; overflow: auto;margin-right:40px;margin-top:5px;"><a href="<?php echo $view_all; ?>"><span class="label label-success" style="margin-right: 5px;"><?php echo $seller_review_total; ?></span><?php echo $text_entry_review; ?></a></li>
			      </ul>
			      <?php if(isset($seller_reviews) && $seller_reviews){ ?>
			        <ul>
			          <?php foreach($seller_reviews AS $seller_review){ ?>
			            <li><?php echo $seller_review; ?></li>
			          <?php } ?>
			          <li style="display: block; overflow: auto;"><a href="<?php echo $view_all.'&tab=seller'; ?>"><?php echo $text_view_all; ?></a></li>
			        </ul>
			      <?php } ?>
			    </div>
			  <?php } ?>
			  <?php if((!isset($seller_notifications) && !isset($seller_product_reviews) && !isset($seller_reviews)) || (!$seller_notifications && !$seller_product_reviews && !$seller_reviews)){ ?>
			    <center><h4><?php echo $text_no_notification; ?></h4></center>
			  <?php } ?>
			</div>

			<div class="modal-footer">
				<a href="<?php echo $view_all; ?>" class="btn btn-primary button" style="color:white;"><?php echo $text_view_all_notificatins; ?></a>
				<button type="button" class="btn btn-default button" data-dismiss="modal"><?php echo $text_close; ?></button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<style type="text/css">
	.sellerBackground {
		<?php if(isset($sellerProfile['backgroundcolor']) && $sellerProfile['backgroundcolor']) { ?>
			background-color: <?php echo $sellerProfile['backgroundcolor']; ?>;
		<?php } else { ?>
			background-color: #FF4D45;
		<?php } ?>
		height: 200px;
		text-align: center;
	}
	.seller_detail_stripe {
		background-color: rgba(255, 255, 255, 0.1);
		box-shadow: 0 0 1px 1px rgba(255, 255, 255, 0.2);
		height: 30px;
		margin-top: 5px;
		width: 100%;
	}
	.seller_detail_stripe p {
		color: #fff;
	    font-size: 18px;
	    line-height: 30px;
	}
	.seller-dp {
		height: 100px;
		margin-top: 35px;
	}
</style>

	<div class="modal fade" id="myModal-seller-info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  	<div class="modal-dialog">
	    	<div class="modal-content" style="border-radius:0px">
	      		<div class="modal-body" style="padding-top:0px">
				<?php if(isset($launchModal) && $launchModal && isset($sellerProfile) && $sellerProfile) { ?>
			   		<div class="row">
			    		<div class="col-sm-12 sellerBackground">
			    			<div class="seller-dp">
			    				<img src="<?php echo $sellerProfile['avatar']; ?>"/>
			    			</div>
			    			<div class="seller_detail_stripe">
			    				<p>
			    					<?php echo $text_welcome.$sellerProfile['firstname'].' '.$sellerProfile['lastname']; ?>
			    				</p>
			    			</div>
			    		</div>
			    	</div>
				<?php } ?>
		    		<div class="row">
		      			<div class="col-sm-12">
		      				<?php if(isset($lowStockProducts['products']) && $lowStockProducts['products']) { ?>
		      				<h1 class="heading-title"><?php echo $text_low_stock; ?></h1>
			      			<div class="table-responsive">
			      				<table class="table table-bordered table-hover list">
				      				<thead>
										<tr>
											<td class="text-left"><?php echo $text_productname; ?></td>
											<td class="text-left"><?php echo $text_model; ?></td>
											<td class="text-right"><?php echo $text_quantity; ?></td>
				      					</tr>
				      				</thead>
				      				<tbody>
			      					<?php foreach ($lowStockProducts['products'] as $key => $lowStockProduct) { ?>
			      						<tr>
			      							<td>
			      								<?php echo $lowStockProduct['name']; ?>
			      							</td>
			      							<td>
			      								<?php echo $lowStockProduct['model']; ?>
			      							</td>
			      							<td class="text-right">
			      								<?php echo $lowStockProduct['quantity']; ?>
			      							</td>
			      						</tr>
			      					<?php } ?>
			      					<?php if(isset($totalProductsLowStock) && $totalProductsLowStock > 5) { ?>
				      					<tr>
				      						<td colspan="3">
				      							<a href="<?php echo $moreProductUrl; ?>" class="button">
				      								more
				      							</a>
				      						</td>
				      					</tr>
				      				<?php } ?>
			      					</tbody>
			      				</table>
			      			</div> <!-- table responsive -->
				    		<?php } ?>
	      				    <h1 class="heading-title"><?php echo $text_most_viewed; ?></h1>
		      				<div class="table-responsive">
		      					<table class="table table-bordered table-hover list">
			      					<thead>
				      					<tr>
											<td class="text-left"><?php echo $text_productname; ?></td>
											<td class="text-left"><?php echo $text_model; ?></td>
											<td class="text-right"><?php echo $text_views; ?></td>
				      					</tr>
			      					</thead>
			      					<tbody>
		      						<?php if(isset($mostViewedProducts) && $mostViewedProducts) { ?>
		      							<?php foreach ($mostViewedProducts as $key => $mostViewedProduct) { ?>
		      							<tr>
			      							<td>
			      								<?php echo $mostViewedProduct['name']; ?>
			      							</td>
			      							<td>
			      								<?php echo $mostViewedProduct['model']; ?>
			      							</td>
			      							<td class="text-right">
			      								<?php echo $mostViewedProduct['viewed']; ?>
			      							</td>
			      						</tr>
		      							<?php } ?>
		      						<?php } else { ?>
					      				<tr>
					      					<td class="text-center" colspan="3">
					      						<?php echo $text_more_work; ?>
					      					</td>
					      				</tr>
		      						<?php } ?>
		      						</tbody>
		      					</table>
		      				</div>
		      			</div> <!-- col-sm-12 -->
		    		</div> <!-- row -->
					<div class="row">
						<div class="col-sm-12">
						    <div class="pull-right">
						      	<button type="button" class="button" data-dismiss="modal">
						      		<?php echo $text_close; ?>
						      	</button>
						    </div>
						</div>
					</div> <!-- row -->
	      		</div> <!-- modal-body -->
	    	</div> <!-- modal-content -->
		</div> <!-- modal-dialog -->
	</div> <!-- modal -->

<script>

var launchModal = <?php if($launchModal) echo $launchModal; else echo 0; ?>;


$(document).ready(function() {
	if(launchModal && window.innerWidth > 767) {
		$('#myModal-seller-info').modal();
	}
});


<?php if(isset($partner)){ ?>
$(document).ready(function(){
	if($('#content').hasClass('col-sm-12')){
		$('.marketplace .row .product-seller').addClass('<?php echo $addClass; ?>');
	}
});
<?php } ?>

<?php if($contact_mail AND $logged){ ?>
$('#send-mail').on('click',function(){
	f = 0;
	$('.alert').remove();
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
		$('#myModal-seller-mail .modal-body').prepend('<div class="alert alert-success success" style="width:95%;"><i class="fa fa-check-circle"></i> <?php echo $text_success_mail; ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>');

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
