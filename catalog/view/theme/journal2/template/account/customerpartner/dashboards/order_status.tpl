<style>
  .wk_order_status_box{
      font-size: 20px;
      padding: 5px;
      margin: 5px 0;
      box-shadow: 0px 0px 15px #b3b8ba;
      border-radius: 5px;
      min-height: 60px;
  }

  .color_complete{
    color: #0C5120;
    background-color: #69b572
  }

  .color_process{
    color: #004f78;
    background-color: #22ade2
  }

  .color_cancel{
    color: #b34356;
    background-color: #f37587
  }

  .margin_top{
    margin-top: 11%;
    position: relative;
    top: -20px;
  }
  @media only screen and (width: 768px) {
    center{
      font-size: 8px;
position: absolute;
margin-left: 75px;
margin-top: 37px;

    }
  }
</style>

<link rel="stylesheet" href="catalog/view/theme/journal2/stylesheet/MP/progress_bar.css">

<div class="tile" style="background-color: white;">
    <div class="tile-body" style="background-color: white;padding: 0;">
        <div id="wk_order_status_container" style="line-height: 5px;">

          <div class="wk_order_status_box color_complete">
            <div class="row">
              <div class="col-sm-6">
                <div class="margin_top">
                  <center><a href="<?php echo $complete_order_link; ?>" style="color: black;"><?php echo $text_order_complete; ?></a></center>
                </div>
              </div>

              <div class="col-sm-6">
                <div class="c100 p<?php echo $totalCompletePercent; ?> small green">
                    <span><?php echo $totalComplete; ?>/<?php echo $totalSellerOrder; ?></span>
                    <div class="slice">
                        <div class="bar"></div>
                        <div class="fill"></div>
                    </div>
                </div>
              </div>
            </div>
          </div>

          <div class="wk_order_status_box color_process">
            <div class="row">
              <div class="col-sm-6">
                <div class="margin_top">
                  <center><a href="<?php echo $processing_order_link; ?>" style="color: black;"><?php echo $text_order_processing; ?></a></center>
                </div>
              </div>

              <div class="col-sm-6">
                <div class="c100 p<?php echo $totalProcessingPercent; ?> small blue">
                    <span><?php echo $totalProcessing; ?>/<?php echo $totalSellerOrder; ?></span>
                    <div class="slice">
                        <div class="bar"></div>
                        <div class="fill"></div>
                    </div>
                </div>
              </div>
            </div>
          </div>

          <div class="wk_order_status_box color_cancel">
            <div class="row">
              <div class="col-sm-6">
                <div class="margin_top">
                  <center><a href="<?php echo $cancel_order_link; ?>" style="color: black;"><?php echo $text_order_cancel; ?></a></center>
                </div>
              </div>

              <div class="col-sm-6">
                <div class="c100 p<?php echo $totalCanceledPercent; ?> small pink">
                    <span><?php echo $totalCancel; ?>/<?php echo $totalSellerOrder; ?></span>
                    <div class="slice">
                        <div class="bar"></div>
                        <div class="fill"></div>
                    </div>
                </div>
              </div>
            </div>
          </div>
        </div>
    </div>
   <div class="tile-footer" style="background-color: #eef4f7"></div>
</div>
