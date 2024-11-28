<?php echo $header; ?>
<style>
  table{
    color: black;
  }
</style>
<link type="text/css" href="catalog/view/theme/journal2/stylesheet/MP/journal2.css" rel="stylesheet"  />

<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>

  <?php echo $column_right; ?>
    <?php if ($error_warning) { ?>
      <div class="alert alert-danger warning"><i class="fa fa-exclamation-circle"></i><?php echo $error_warning; ?></div>
    <?php } ?>
    <?php if($chkIsPartner){ ?>

  <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
    <h1 class="heading-title">
      <?php echo $heading_title; ?></h1>

<h2 class="secondary-title"><?php echo $heading_title; ?></h2>
  <?php if($isMember) { ?>

        <fieldset>
            <div class="form-horizontal row">
			
              <div class="pull-left" style="display:inline-block;margin-right:1%;">
                <div class="form-group">
                  <label class="control-label" for="input-order"><?php echo $text_orderid; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="filter_order" value="<?php echo $filter_order; ?>" placeholder="<?php echo $text_orderid; ?>" id="input-order" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                    <label class="control-label" for="input-name"><?php echo $text_customer; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $text_customer; ?>" id="input-name" class="form-control" />
                    </div>
                </div>
              </div>

               <div class="pull-left" style="display:inline-block;margin-right:1%;">
			   
                <div class="form-group">
                  <label class="control-label" for="input-date"><?php echo $text_added_date; ?></label>
                  <div class="col-sm-10">
                    <div style="display:inline-flex;" class="date">
					  <input type="text"  name="filter_date" value="<?php echo $filter_date; ?>" data-date-format="YYYY-MM-DD" placeholder="<?php echo $text_added_date; ?>" id="input-date" class="form-control date" />
					  <span>
					   <button type="button" class="button" style="height: 34px;"><i class="fa fa-calendar" style="margin-top: -10px;"></i></button>
					  </span>
					</div>
                   </div>
                </div>
				
              				
				
                <div class="form-group">
                    <label class="control-label" for="input-status"><?php echo $text_status; ?></label>
                    <div class="col-sm-10">
                        <div style="display:inline-flex;" class="date">
                          <div>
                            <select name="filter_status" class="form-control" id="input-status">
                              <option value="*"></option>
							  <?php foreach ($status as $key => $value) { ?>
								<option value="<?php echo $value['name']; ?>" <?php echo ($filter_status == $value['name'] || $filter_status == $value['order_status_id']) ? 'selected' : ''; ?> ><?php echo $value['name']; ?></option>
							  <?php } ?>
                            </select>
                          </div>
                        </div>
				
                    </div>
					
                    <div class="pull-right" style="display:inline-block;">
						<a onclick="filter();" class="btn btn-primary button"><?php echo $button_filter; ?></a>
						<a onclick="refilter();" class="btn btn-default button"> <i class="fa fa-refresh"></i> </a>
                    </div>
					
                </div>
               </div>
            </div>
			 
        </fieldset>

      <div class="table-responsive">
        <table class="table table-bordered table-hover list">
          <thead>
            <tr>
              <td class="text-left">
                <?php if ($sort == 'o.order_id') { ?>
                <a href="<?php echo $sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_orderid; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_order; ?>"><?php echo $text_orderid; ?></a>
                <?php } ?>
              </td>
              <td class="text-left">
                <?php if ($sort == 'o.firstname') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_customer; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $text_customer; ?></a>
                <?php } ?>
              </td>
              <td class="text-left"><?php echo ($text_products); ?></td>
              <td class="text-left"><?php echo $text_total; ?></td>
              <td class="text-left"><?php if($sort == 'os.name') { ?>
                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>" ><?php echo $text_status; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_status; ?>"><?php echo $text_status; ?></a>
                <?php } ?>
              </td>
              <td class="text-left"><?php if($sort == 'o.date_added') { ?>
                <a href="<?php echo $sort_date; ?>" class="<?php echo strtolower($order); ?>" ><?php echo $text_added_date; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_date; ?>"><?php echo $text_added_date; ?></a>
                <?php } ?>
              </td>
			  <td class="text-left"><?php echo $text_kurir; ?></td>
			  <td class="text-left"><?php echo $text_ongkir; ?></td>
			  <td class="text-center"><?php echo $text_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if($orders){ ?>
              <?php foreach($orders as $item) {?>
                <tr>
                  <td><?php echo $item['order_id']; ?></td>
                  <td><?php echo $item['name'];?></td>
                  <td><?php echo $item['productname']; ?></td>
                  <td><?php echo $item['total']; ?></td>
                  <td><?php echo $item['orderstatus']; ?></td>
                  <td><?php echo $item['date_added']; ?></td>
				  <td><?php echo $item['kurir']; ?></td>
				  <!--<td><?php echo number_format($item['ongkir'],0); ?></td>-->
				  <td><?php echo "Rp " . str_replace(",",".", number_format($item['ongkir'],0)); ?></td>
				 				  
                  <td class="text-center">
                  <a class="btn btn-primary button btn-xs" href="<?php echo $item['orderidlink']; ?>"><i class="fa fa-eye"></i></a></td>
                </tr>
              <?php } ?>
            <?php } else{ ?>
            <tr>
              <td class="text-center" colspan="10" style="test-align:center;"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
<div class="row pagination">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right results"><?php echo $results; ?></div>
  </div>
      <?php } else { ?>
        <div class="text-danger">
          <?php echo $error_warning_authenticate; ?>
        </div>
      <?php } ?>

   
   
    </div>
    <?php }else{
          echo "<h2 class='text-danger'> For Become Seller inform Admin </h2>";
    } ?>

  </div>
</div>

<script type="text/javascript">
$('.date').datetimepicker({
  pickTime: false
});

function refilter(){
  location = '<?php echo $current; ?>';
}

function filter() {
  url = '<?php echo $current; ?>';

  var filter_order = $('input[name=\'filter_order\']').val();

  if (filter_order) {
    url += '&filter_order=' + encodeURIComponent(filter_order);
  }

  var filter_name = $('input[name=\'filter_name\']').val();

  if (filter_name) {
    url += '&filter_name=' + encodeURIComponent(filter_name);
  }

  var filter_status = $('select[name=\'filter_status\']').val();

  if (filter_status != '*') {
    url += '&filter_status=' + encodeURIComponent(filter_status);
  }

  var filter_date = $('input[name=\'filter_date\']').val();

  if (filter_date) {
    url += '&filter_date=' + encodeURIComponent(filter_date);
  }

  location = url;
}
//--></script>
<script type="text/javascript"><!--
$('fieldset input').keydown(function(e) {
  if (e.keyCode == 13) {
    filter();
  }
});

//--></script>
<?php echo $footer; ?>
