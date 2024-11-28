<?php if ($feedbacks) { ?>
	<?php foreach ($feedbacks as $feedback) { ?>

	<div class="review-container">
    <div class="reviewer-name">
      <i class="fa fa-user"></i>&nbsp;&nbsp;&nbsp;<?php echo $feedback['nickname']; ?>
			&nbsp;&nbsp;&nbsp;
      <i class="fa fa-calendar"></i>&nbsp;&nbsp;&nbsp;<?php echo $feedback['createdate']; ?>
    </div>

		<div class="rating">
			<?php if(isset($review_fields) && $review_fields){
				foreach($review_fields AS $review_field){ ?>
					<?php if(isset($feedback['review_attributes'][$review_field['field_id']])){ ?>
					<div class="review-rating">
						<div class="text-container">
							<?php echo $review_field['field_name'] .' :  '; ?>
						</div>
						<div class="rating-container">
								<?php for ($i = 1; $i <= $feedback['review_attributes'][$review_field['field_id']]; $i++) { ?>
									<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
								<?php } ?>
								<?php for ($j = 1; $j <= 5 - $feedback['review_attributes'][$review_field['field_id']]; $j++) { ?>
									<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
								<?php } ?>
						</div>
					</div>
					<?php }
					}
				} ?>
		</div>

    <div class="review-content">
        <?php echo $feedback['review']; ?>
    </div>
	</div>
	<?php } ?>
	<!-- <div class="text-right"><?php echo $results; ?></div> -->

<?php } else { ?>
	<div class="mp-no-location-found text-danger"><?php echo $text_no_feedbacks; ?></div>
<?php } ?>
