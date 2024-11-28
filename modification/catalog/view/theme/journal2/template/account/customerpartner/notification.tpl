<style>
@media screen and  (width: 768px) {
  .responsive{
    margin-top: 290%;
    margin-left: -29px;
  }
}
</style>
<?php echo $header; ?>
<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <h1 class="heading-title"><?php echo $heading_title; ?>
        <div class="buttons">
          <div class="pull-right">
            <a href="<?php echo $back; ?>" class="btn btn-default button"><?php echo $button_back; ?></a>
          </div>
        </div>
      </h1>
      <?php echo $content_top; ?>
      <div class="content">
      <form method="post" enctype="multipart/form-data" id="form-notification" class="form-horizontal">
        <fieldset>
          <h2 class="secondary-title"><?php echo $text_notification_information; ?></h2>
          <?php if($isMember) { ?>
            <ul id="tabs" class="nav nav-tabs htabs">
              <li class="active"><a href="#tab-order" id="tab_tab-order" data-toggle="tab"><?php echo $tab_order; ?></a></li>
              <li><a href="#tab-product" id="tab_tab-product" data-toggle="tab"><?php echo $tab_product; ?></a></li>
              <li><a href="#tab-seller" id="tab_tab-seller" data-toggle="tab"><?php echo $tab_seller; ?></a></li>
            </ul>
            <div class="tabs-content">
              <div class="tab-pane tab-content active" id="tab-order">
                <div class="all_notifications_div">
                  <div style="width:25%">
                    <table>
                      <tr>
                        <td>
                          <div class="checkbox input-group">
                            <input type="checkbox" value="all" name="selected[]" <?php if(isset($selected) && is_array($selected) && in_array('all',$selected)){ ?>checked="checked"<?php } ?> />
                            <span class="label label-info pull-right input-group-btn span_margin"><?php echo $all_notifications; ?></span>
                            <div style="padding: 5px;"><?php echo $text_all_notification; ?></div>
                          </div>
                        </td>
                      </tr>

                      <tr>
                        <td>
                          <div class="checkbox input-group">
                            <input type="checkbox" value="return" name="selected[]" <?php if(isset($selected) && is_array($selected) && in_array('return',$selected)){ ?>checked="checked"<?php } ?> />
                            <span class="label label-danger pull-right input-group-btn span_margin"><?php echo $return_total; ?></span>
                            <div style="padding: 5px;"><?php echo $text_return; ?></div>
                          </div>
                        </td>
                      </tr>

                      <?php if(isset($order_statuses) && $order_statuses && isset($notification_filter) && $notification_filter) { ?>
                        <?php foreach ($order_statuses as $key => $order_status) { ?>
                          <?php if(in_array($order_status['order_status_id'], $notification_filter)){  ?>
                          <tr>
                            <td>
                              <div class="checkbox input-group">

                                  <input type="checkbox" value="<?php echo $order_status['order_status_id']; ?>" name="selected[]" <?php if(isset($selected) && is_array($selected) && in_array($order_status['order_status_id'], $selected)){ ?>checked="checked"<?php } ?> />
                                  <span class="label label-success pull-right input-group-btn span_margin"><?php echo $order_status['total']; ?></span>
                                  <div style="padding: 5px;"><?php echo $order_status['name']; ?></div>

                              </div>
                              </td>
                            </tr>
                          <?php } ?>
                        <?php } ?>
                      <?php } ?>

                    </table>
                  </div>
                  <div class="notification_body">
                    <?php if(isset($seller_notifications) && $seller_notifications){ ?>
                      <div class="table-responsive">
                        <table class="responsive" style="border-left: 1px solid #eee;">
                          <tbody>
                            <?php foreach($seller_notifications AS $seller_notification){ ?>
                              <tr>
                                <td style="padding-left:20px;">
                                  <li style="margin-left:10px;"><?php echo $seller_notification; ?></li>
                                  <hr width="100%;">
                                </td>
                              </tr>
                            <?php } ?>
                          </tbody>
                        </table>
                      </div>
                      <div class="row pagination">
                        <div class="col-sm-6 text-left links"><?php echo $pagination; ?></div>
                        <div class="col-sm-6 text-right results"><?php echo $results; ?></div>
                      </div>
                    <?php } else { echo $text_no_notification; } ?>
                  </div>
                </div>

              </div>

              <div class="tab-pane tab-content" id="tab-product">
                <?php if(isset($seller_product_reviews) && $seller_product_reviews){ ?>
                  <div class="table-responsive">
                    <table>
                      <tbody>
                        <?php foreach($seller_product_reviews AS $seller_product_review){ ?>
                          <tr>
                            <td style="padding-left:20px;">
                              <li style="margin-left:10px;"><?php echo $seller_product_review; ?></li>
                              <hr width="100%;">
                            </td>
                          </tr>
                        <?php } ?>
                      </tbody>
                    </table>
                  </div>
                  <div class="row pagination">
                    <div class="col-sm-6 text-left links"><?php echo $pagination_product; ?></div>
                    <div class="col-sm-6 text-right results"><?php echo $results_product; ?></div>
                  </div>
                <?php } else { echo $text_no_notification; } ?>
              </div>

              <div class="tab-pane tab-content" id="tab-seller">
                <?php if(isset($seller_reviews) && $seller_reviews){ ?>
                  <div class="table-responsive">
                    <table>
                      <tbody>
                        <?php foreach($seller_reviews AS $seller_review){ ?>
                          <tr>
                            <td style="padding-left:20px;">
                              <li style="margin-left:10px;"><?php echo $seller_review; ?></li>
                              <hr width="100%;">
                            </td>
                          </tr>
                        <?php } ?>
                      </tbody>
                    </table>
                  </div>
                  <div class="row pagination">
                    <div class="col-sm-6 text-left links"><?php echo $pagination_seller; ?></div>
                    <div class="col-sm-6 text-right results"><?php echo $results_seller; ?></div>
                  </div>
                <?php } else { echo $text_no_notification; } ?>
              </div>

            </div>
          <?php } else { ?>
            <div class="text-danger">
              <?php echo $error_warning_authenticate; ?>
            </div>
          <?php } ?>
        </fieldset>
      </form>
      </div>
      </div>
    </div>
</div>
<link type="text/css" href="catalog/view/theme/journal2/stylesheet/MP/journal2.css" rel="stylesheet"  />
<script type="text/javascript">

  $('.nav-tabs li a').on('click',function(){
    if ($(this).attr('id')) {
      localStorage.setItem("tab-active",$(this).attr('id'))
      localStorage.setItem("tab-pane-active",$(this).attr('id').substring(4))
    }
  });

  $(document).ready(function(){
    var tab_active = localStorage.getItem("tab-active");
    var tab_pane_active = localStorage.getItem("tab-pane-active");

<?php if(isset($tab) && $tab){ ?>
  tab_active = 'tab_tab-<?php echo $tab; ?>';
  tab_pane_active = 'tab-<?php echo $tab; ?>';
<?php } ?>

    if (tab_active && tab_pane_active) {
      $("#"+tab_active).parent().addClass('active');
      $("#"+tab_active).parent().siblings().removeClass('active');
      $("#"+tab_pane_active).addClass('active');
      $("#"+tab_pane_active).siblings().removeClass('active');
    }

  });

</script>
<script type="text/javascript">
  $('input[name*=\'selected\']').on('click',function(){
    var options = '';
    $('input[name*=\'selected\']:checked').each(function(index,item){
        options += ','+$(item).val();
    });

    var url = 'index.php?route=account/customerpartner/notification&page=<?php echo $page; ?>';

    if (options) {
      url += '&options='+options.substr(1);
    }

    location = url;
  });
</script>
<style>
  hr{
    margin-top: 10px;
    margin-bottom: 10px;
  }

  .label-info{
    background-color: #5bc0de;
    padding: 0px 7px;
  }

  .label-warning{
    background-color: #f0ad4e;
    padding: 0px 7px;
  }

  .label-success{
    background-color: #5cb85c;
    padding: 0px 7px;
  }

  .label-danger{
    background-color: #d9534f;
    padding: 0px 7px;
  }

  li{
    //font-family: monospace;
  }
  .span_margin{
    margin-top:6px;
    margin-left:3px;
  }

  .all_notifications_div{
    display:inline-flex;
    width: 100%;
  }
  .notification_filter{
    width:20%;
    font-size:15px;
  }

  .notification_body{
    width:80%;
  }
  @media screen and (max-width: 700px) {
    .all_notifications_div{
      display: inline;
    }

    .notification_filter{
      width:100%;
    }

    .notification_body{
      width:100%;
    }
  }
</style>
<?php echo $footer; ?>
