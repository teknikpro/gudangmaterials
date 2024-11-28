<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
  <div class="review-container">
    <div class="reviewer-name">
      <i class="fa fa-user"></i>&nbsp;&nbsp;&nbsp;<?php echo $review['author']; ?>
      &nbsp;&nbsp;&nbsp;
      <i class="fa fa-calendar"></i>&nbsp;&nbsp;&nbsp;<?php echo $review['date_added']; ?>
    </div>

    <div class="rating">
      <div class="review-rating">
        <div class="text-container">
          <?php echo $text_rating .' :  '; ?>
        </div>
        <div class="rating-container">
          <?php for ($i = 1; $i <= $review['rating']; $i++) { ?>
            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
          <?php } ?>
          <?php for ($j = 1; $j <= 5 - $review['rating']; $j++) { ?>
            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
        </div>
      </div>
    </div>

    <div class="review-content">
      <div class="text-container">
        <a href="<?php echo $review['href']; ?>" target="_blank"><?php echo $review['name']; ?></a>
      </div>
      <div>
        <?php echo $review['text']; ?>
      </div>
    </div>
  </div>
<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<div class="mp-no-location-found text-danger"><?php echo $text_no_reviews; ?></div>
<?php } ?>
