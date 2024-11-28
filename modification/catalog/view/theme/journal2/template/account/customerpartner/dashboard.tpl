<?php echo $header; ?>
<link type="text/css" href="catalog/view/theme/journal2/stylesheet/MP/journal2.css" rel="stylesheet" />
<style>
  .col-lg-4,
  .col-md-4,
  .col-sm-4 {
    display: inline-block;
    width: 32.79%;
  }

  .col-lg-6,
  .col-md-6,
  .col-sm-6 {
    display: inline-block;
    width: 48.79%;
  }

  .col-sm-8{
    display: inline-block;
    width: 66.67%;
  }

  h2{
      font-size: 27px;
      font-weight: normal;
      padding: 10px;
      color: black;
    }
    .open>.dropdown-menu{
      display: block;
      right: 0;
      left: auto;
    }
</style>
<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li>
      <a href="<?php echo $breadcrumb['href']; ?>">
        <?php echo $breadcrumb['text']; ?>
      </a>
    </li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger warning"><i class="fa fa-exclamation-circle"></i>
    <?php echo $error_warning; ?>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success success"><i class="fa fa-check-circle"> </i>
    <?php echo $success; ?>
  </div>
  <?php } ?>

  <div class="row">
    <?php echo $column_left; ?>
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
      <div style="background-color: #eef4f7;padding: 5px;">
      <h2><?php echo $heading_title; ?></h2>

      <?php if($isMember) { ?>
      <?php if($chkIsPartner){ ?>
      <fieldset>
        <div class="row">
          <div class="col-lg-4 col-md-4 col-sm-4">
            <?php echo $order; ?>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-4">
            <?php echo $sale; ?>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-4">
            <?php echo $customer; ?>
          </div>
        </div>
      </fieldset>
      <fieldset>
        <div class="row" style="margin-top: 10px;">
          <div class="col-sm-4">
            <?php echo $low_stock; ?>
          </div>
          <div class="col-sm-8">
            <?php echo $order_status; ?>
          </div>
        </div>
      </fieldset>
      <fieldset>
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12 col-sx-12">
            <?php echo $chart; ?>
          </div>
        </div>
      </fieldset>

      <fieldset>
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12 col-sx-12">
            <?php echo $map; ?>
          </div>
        </div>
      </fieldset>

      <fieldset>
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12 col-sx-12">
            <?php echo $recent; ?> </div>
        </div>
      </fieldset>

      <?php } ?>
      <?php } else { ?>
      <div class="text-danger">
        <?php echo $error_warning_authenticate; ?>
      </div>
      <?php } ?>
    </div>
    </div>
    <!--content-->
  </div>
  <!--row-->
</div>
<!--container-->
<script type="text/javascript">
  jQuery(document).ready(function() {
    $('.low_stock_row').on('mouseenter', function() {
      var src = $(this).find('img').attr('src');
      src = src.substr(0, 14);
      src = src + '-active.png';
      $(this).find('img').attr('src', src);
    });

    $('.low_stock_row').on('mouseleave', function() {
      var src = $(this).find('img').attr('src');
      src = src.substr(0, 14);
      src = src + '.png';
      $(this).find('img').attr('src', src);
    });
  })
</script>
<?php echo $footer; ?>
