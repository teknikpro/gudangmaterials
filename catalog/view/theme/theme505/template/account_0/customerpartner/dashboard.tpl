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
    .tooltip-inner{
      background-color: #fff;
    }
    .tooltip-inner .table>tbody>tr>td{
      border-top: 1px solid #ddd;
    }
    .tooltip{
      border-radius: 5px;
      border: 1px solid grey;
    }
    @media only screen and (max-width: 767px) {
      .wk_lowstock_more {
        margin: 25px 0px 0px;
      }
      .dashboard-block-2 .col-sm-4, .dashboard-block-1 .col-lg-4.col-md-4.col-sm-4 {
        height: 255px;
      }
      .dashboard-block-2 .col-sm-8 {
        float: right;
      }
      .dashboard-block-2 .col-sm-8 {
        width: 65.67%;
      }
      .wk_order_status_box .row .col-sm-6:nth-child(1) {
        width: 75%
      }
      .wk_order_status_box .row .col-sm-6:nth-child(2) {
        width: 20%;
      }
    }
    @media only screen and (max-width: 480px) {
      .col-lg-4, .col-md-4, .col-sm-4, .dashboard-block-2 .col-sm-8 {
        width: 100%;
      }
      .wk_order_status_box .col-sm-6 a {
        font-size: 14px;
      }
    }
</style>
<?php echo $header; ?><?php echo $separate_column_left; ?>
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
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"> </i> <?php echo $success; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>" style="background-color: #eef4f7;"><?php echo $content_top; ?>
    	<h2><?php echo $heading_title; ?></h2>

        <?php if($isMember) { ?>
            <?php if($chkIsPartner){ ?>
              <div class="row">
	                <div class="col-lg-4 col-md-4 col-sm-6"><?php echo $order; ?></div>
	                <div class="col-lg-4 col-md-4 col-sm-6"><?php echo $sale; ?></div>
	                <div class="col-lg-4 col-md-4 col-sm-6"><?php echo $customer; ?></div>
	            </div>
	            <div class="row" style="margin-top: 10px;">
	                <div class="col-sm-4"><?php echo $low_stock; ?></div>
	                <div class="col-sm-8">
		                <?php echo $order_status; ?>
	                </div>
	            </div>
              <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-sx-12"><?php echo $chart; ?></div>
              </div>
              <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-sx-12"><?php echo $map; ?></div>
              </div>
              <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-sx-12"> <?php echo $recent; ?> </div>
              </div>
            <?php } ?>
        <?php } else { ?>
      <div class="text-danger">
        <?php echo $error_warning_authenticate; ?>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript">
  jQuery(document).ready(function(){
    $('.low_stock_row').on('mouseenter', function(){
      var src = $(this).find('img').attr('src');
      src = src.substr(0,14);
      src = src + '-active.png';
      $(this).find('img').attr('src',src);
    });

    $('.low_stock_row').on('mouseleave', function(){
      var src = $(this).find('img').attr('src');
      src = src.substr(0,14);
      src = src + '.png';
      $(this).find('img').attr('src',src);
    });
  })
</script>
<?php echo $footer; ?>
