<?php echo $header; ?>

<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><span itemprop="title"><?php echo $breadcrumb['text']; ?></span></a></li>
    <?php } ?>
  </ul>
  <?php if ($attention) { ?>
    <div class="alert alert-info information">
      <i class="fa fa-info-circle"></i> <?php echo $attention; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
  <?php } ?>
  <?php if ($success) { ?>
    <div class="alert alert-success success">
      <i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
  <?php } ?>
  <?php if(isset($marketplace_status) && $marketplace_status) { ?>
      <?php if ($error_warning_seller_product) { ?>
        <div class="alert alert-danger">
          <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_seller_product; ?>
          <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
      <?php } ?>
  <?php } ?>
  <?php if ($error_warning) { ?>
    <div class="alert alert-danger warning">
      <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?><h1 class="heading-title"><?php echo $heading_title; ?>
        <?php if ($weight) { ?>
        &nbsp;(<?php echo $weight; ?>)
        <?php } ?>
      </h1>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> sc-page">
      <?php echo $content_top; ?>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="table-responsive cart-info">
          <table class="table table-bordered">
            <thead>
              <tr>
                <td class="text-center image"><?php echo $column_image; ?></td>
                <td class="text-left name"><?php echo $column_name; ?></td>
                <td class="text-left model"><?php echo $column_model; ?></td>
                <td class="text-left quantity"><?php echo $column_quantity; ?></td>
                <td class="text-right price"><?php echo $column_price; ?></td>
                <td class="text-right total"><?php echo $column_total; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
                <tr>
                  <td class="text-center image">
                    <?php if ($product['thumb']) { ?>
                      <a href="<?php echo $product['href']; ?>">
                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" />
                      </a>
                    <?php } ?>
                  </td>
                  <td class="text-left name">
                    <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                    <?php if (!$product['stock']) { ?>
                      <span class="text-danger">***</span>
                    <?php } ?>
                    <?php if ($product['option']) { ?>
                      <?php foreach ($product['option'] as $option) { ?>
                        <br />
                        <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                      <?php } ?>
                    <?php } ?>
                    <?php if ($product['reward']) { ?>
                      <br />
                      <small><?php echo $product['reward']; ?></small>
                    <?php } ?>
                    <?php if ($product['recurring']) { ?>
                        <br />
                        <span class="label label-info"><?php echo $text_recurring_item; ?></span> 
                        <small><?php echo $product['recurring']; ?></small>
                    <?php } ?>
                  </td>
                  <td class="text-left model"><?php echo $product['model']; ?></td>
                  <td class="text-left quantity"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="quantity[<?php echo $product[version_compare(VERSION, '2.1', '<') ? 'key' : 'cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                    <span class="input-group-btn">
                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-primary"><i class="fa fa-refresh"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="cart.remove('<?php echo $product[version_compare(VERSION, '2.1', '<') ? 'key' : 'cart_id']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                  <td class="text-right price"><?php echo $product['price']; ?></td>
                  <td class="text-right total"><?php echo $product['total']; ?></td>
                </tr>
              <?php } ?>
              <?php foreach ($vouchers as $vouchers) { ?>
                <tr>
                  <td></td>
                  <td class="text-left name"><?php echo $vouchers['description']; ?></td>
                  <td class="text-left"></td>
                  <td class="text-left quantity"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn">
                      <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $vouchers['key']; ?>');"><i class="fa fa-times-circle"></i></button>
                    </span></div></td>
                  <td class="text-right price"><?php echo $vouchers['amount']; ?></td>
                  <td class="text-right total"><?php echo $vouchers['amount']; ?></td>
                </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </form>
      <div class="action-area">
        <?php if (version_compare(VERSION, '2.2', '<')): ?>
          <?php if ($coupon || $voucher || $reward || $shipping) { ?>
            <h3><?php echo $text_next; ?></h3>
            <!--<p><?php echo $text_next_choice; ?></p>-->
            <div class="panel-group" id="accordion">
              <?php echo $coupon; ?><?php echo $voucher; ?>
              <?php echo $reward; ?>
              <?php if ( (int)str_replace(",",".",str_replace(".","",str_replace("g","", $weight))) <= 30000  && $statusproduk == 0 ) { ?> 
                <?php echo $shipping; ?>  
              <?php } ?>
            </div>
          <?php } ?>
        <?php else: ?>
          <?php if ($modules) { ?>
            <h3><?php echo $text_next; ?></h3>
            <p><?php echo $text_next_choice; ?></p>
            <div class="panel-group" id="accordion">
              <?php foreach ($modules as $module) { ?>
              <?php echo $module; ?>
              <?php } ?>
            </div>
          <?php } ?>
        <?php endif; ?>
        <div class="row">
          <div class="col-sm-4 col-sm-offset-8 cart-total">
            <table class="table table-bordered" id="total">
              <?php if ( (int)str_replace(",",".",str_replace(".","",str_replace("g","", $weight))) <= 30000 ) { ?> 
                  <?php foreach ($totals as $total) { ?>
                    <tr>
                      <td class="text-right right"><strong><?php echo $total['title']; ?>:</strong>		
                      <?php echo $total['text']; ?></td>
                    </tr>			  
                  <?php } ?>			   
              <?php } else { ?>		
                  <style>
                      .text-td-right {
                        text-align: right !important;
                      }
                  </style>
                  <div id="detail-harga" >
                  </div>
			        <?php } ?>
            </table>
          </div>
        </div>

        <?php if ( (int)str_replace(",",".",str_replace(".","",str_replace("g","", $weight))) >= 30000 ) { ?> 
            <form style="display:none;" id="myForm" action="<?= $batasklikcheckout ?>"  method="post" class="form-horizontal">
                <input type="hidden" name="customer_id" value="<?= $customer_id ?>" >
                <input type="hidden" name="seller_address" value="<?= $seller_addres_id ?>" >
                <input type="hidden" name="customer_address" value="<?= $customer_address_id ?>" >
                <button type="submit" id="buttonBatasCheckout" class="btn btn-primary">Ajukan Sekarang</button>
            </form>
            <div id="dynamic-content">
            </div>
            <script type="text/javascript">
                  function refreshContent() {
                      $.ajax({
                          url: "<?= $linkajax; ?>", 
                          success: function(response) {
                            let data = JSON.parse(response);
                              if (data.status == 1) {
                                  $("#dynamic-content").html('<div class="alert alert-warning warning"><strong>Ongkos Kirim Sedang dihitung...</strong></div>');
                                  $("#detail-harga").html(`
                                    <table class="table table-bordered">
                                      <tbody>
                                          <tr >
                                            <td class="text-right right" ><strong>Sub Total : </strong></td>
                                            <td class="text-right right" ><strong> ${data.subtotal} </strong></td>
                                          </tr>
                                      </tbody>
                                    </table>
                                  `);
                              } else if (data.status == 2) {
                                  $("#dynamic-content").html( '<div class="alert alert-warning warning">Note : Ongkos kirim yang tertera hanya berlaku selama &nbsp;&nbsp; <strong id="countdown"> </strong> </div>');
                                  $("#detail-harga").html(`
                                    <table class="table table-bordered">
                                      <tbody>
                                          <tr >
                                            <td class="text-right right" ><strong>Sub Total : </strong></td>
                                            <td class="text-right right" ><strong> ${data.subtotal} </strong></td>
                                          </tr>
                                          <tr >
                                            <td class="text-right right" ><strong>Ongkos Kirim (${data.kurir}) : </strong></td>
                                            <td class="text-right right" ><strong> ${data.hargaongkir} </strong></td>
                                          </tr>
                                          <tr >
                                            <td class="text-right right" ><strong>Ongkos Bongkar Muat : </strong></td>
                                            <td class="text-right right" ><strong> ${data.hargatukang == 0 ? 'Bongkar Muat Sendiri' : data.hargatukang } </strong></td>
                                          </tr>
                                          <tr >
                                            <td class="text-right right" ><strong>Jumlah : </strong></td>
                                            <td class="text-right right" ><strong> ${data.totalharga} </strong></td>
                                          </tr>
                                      </tbody>
                                    </table>
                                  `);
                                  $("#button-checkout-big").css('display', 'block');
                                  $("#button-lanjut-belanja").css('display', 'none');

                                        const batasCheckOut = data.batascheckout;
                                        const targetDate = new Date(batasCheckOut);
                                        const currentDate = new Date().getTime();
                                        const distance = targetDate - currentDate;

                                        const days = Math.floor(distance / (1000 * 60 * 60 * 24));
                                        const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                                        const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                                        const seconds = Math.floor((distance % (1000 * 60)) / 1000);

                                        if (days <= 0) {
                                                  if(hours <= 0){
                                                      if(minutes <= 0){
                                                        document.getElementById('countdown').innerHTML = `${seconds} detik`;
                                                      }else {
                                                    document.getElementById('countdown').innerHTML = `${minutes} menit ${seconds} detik`;
                                                      }
                                                  }else {
                                                  document.getElementById('countdown').innerHTML = `${hours} jam ${minutes} menit ${seconds} detik`;
                                                  }
                                          } else {
                                              if(hours == 0){
                                              document.getElementById('countdown').innerHTML = `${days} hari ${minutes} menit ${seconds} detik`;
                                              }else {
                                                document.getElementById('countdown').innerHTML = `${days} hari ${hours} jam ${minutes} menit ${seconds} detik`;
                                              }
                                          }
                                        if (distance < 0) {
                                            clearInterval(countdown);
                                            document.getElementById('countdown').innerHTML = 'Waktu sudah habis';
                                            document.getElementById('myForm').submit();
                                        }
                                    
                              } else {
                                $("#dynamic-content").html('');
                                $("#detail-harga").html(`
                                    <table class="table table-bordered">
                                      <tbody>
                                          <tr >
                                            <td class="text-right right" ><strong>Sub Total : </strong></td>
                                            <td class="text-right right" ><strong> ${data.subtotal} </strong></td>
                                          </tr>
                                      </tbody>
                                    </table>
                                  `);
                              }
                          }
                      });
                  }
                  setInterval(refreshContent, 1000); 
            </script>
            <?php if($approve == 2){ ?>
              <div class="action-area">
                <h3>Alamat Penerima</h3>
              </div>
              <div class="col-sm-4 col-sm-offset-8 cart-total"> 
                  <div>
                    <?= $address_name ?>
                    <br>
                    <?= $address_kota ?> <?= $address_prov ?>   <?= $address_postcode ?> 
                  </div>
              </div>
              <div class="action-area">
                <h3>Alamat Pengirim</h3>
              </div>
              <div class="col-sm-4 col-sm-offset-8 cart-total"> 
                <div>
                  <?= $address_sl_name ?>
                  <br>
                  <?= $address_sl_kota ?> <?= $address_sl_prov ?>   <?= $address_sl_postcode ?> 
              </div>
            <?php } else { ?>
              <div class="action-area">
                <h3>Alamat Pengirim</h3>
              </div>
              <div class="col-sm-4 col-sm-offset-8 cart-total"> 
                <div>
                  <?= $seller_address ?>
                  <br>
                  <?= $seller_kota ?> <?= $seller_prov ?>   <?= $seller_postcode ?> 
              </div>
              <div class="action-area">
                <h3>Alamat Penerima</h3>
              </div>
              <div class="col-sm-4 col-sm-offset-8 cart-total"> 
                <div>
                  <?= $customer_address ?>
                  <br>
                  <?= $customer_kota ?> <?= $customer_prov ?>   <?= $customer_postcode ?>
                  <br><br>
                  <em style="color:red; " >Note: Alamat yang digunakan adalah alamat default yang dipilih </em> 
              </div>
                <br>
                <?php if($approve == 0) { ?>
                  <a class="button btn-warning" href="<?= $ubah_alamat ?>" >Ganti Alamat</a>
                <?php } ?>
              </div>
            <?php } ?>
        <?php } ?>

        <?php if ( (int)str_replace(",",".",str_replace(".","",str_replace("g","", $weight))) <= 30000 && $statusproduk == 1  ) { ?> 
          <form style="display:none;" id="myForm" action="<?= $batasklikcheckout ?>"  method="post" class="form-horizontal">
                <input type="hidden" name="customer_id" value="<?= $customer_id ?>" >
                <input type="hidden" name="seller_address" value="<?= $seller_addres_id ?>" >
                <input type="hidden" name="customer_address" value="<?= $customer_address_id ?>" >
                <button type="submit" id="buttonBatasCheckout" class="btn btn-primary">Ajukan Sekarang</button>
          </form>
            <div id="dynamic-content">
            </div>
            <script type="text/javascript">
                  function refreshContent() {
                      $.ajax({
                          url: "<?= $linkajax; ?>", 
                          success: function(response) {
                            let data = JSON.parse(response);
                              if (data.status == 1) {
                                  $("#dynamic-content").html('<div class="alert alert-warning warning"><strong>Ongkos Kirim Sedang dihitung...</strong></div>');
                                  $("#detail-harga").html(`
                                    <table class="table table-bordered">
                                      <tbody>
                                          <tr >
                                            <td class="text-right right" ><strong>Sub Total : </strong></td>
                                            <td class="text-right right" ><strong> ${data.subtotal} </strong></td>
                                          </tr>
                                      </tbody>
                                    </table>
                                  `);
                              } else if (data.status == 2) {
                                  $("#dynamic-content").html( '<div class="alert alert-warning warning">Note : Ongkos kirim yang tertera hanya berlaku selama &nbsp;&nbsp; <strong id="countdown"> </strong> </div>');
                                  $("#detail-harga").html(`
                                    <table class="table table-bordered">
                                      <tbody>
                                          <tr >
                                            <td class="text-right right" ><strong>Sub Total : </strong></td>
                                            <td class="text-right right" ><strong> ${data.subtotal} </strong></td>
                                          </tr>
                                          <tr >
                                            <td class="text-right right" ><strong>Ongkos Kirim (${data.kurir}) : </strong></td>
                                            <td class="text-right right" ><strong> ${data.hargaongkir} </strong></td>
                                          </tr>
                                          <tr >
                                            <td class="text-right right" ><strong>Harga Tukang : </strong></td>
                                            <td class="text-right right" ><strong> ${data.hargatukang == 0 ? 'Tidak Menggunakan Tukang' : data.hargatukang } </strong></td>
                                          </tr>
                                          <tr >
                                            <td class="text-right right" ><strong>Jumlah : </strong></td>
                                            <td class="text-right right" ><strong> ${data.totalharga} </strong></td>
                                          </tr>
                                      </tbody>
                                    </table>
                                  `);
                                  $("#button-checkout-big").css('display', 'block');
                                  $("#button-lanjut-belanja").css('display', 'none');

                                        const batasCheckOut = data.batascheckout;
                                        const targetDate = new Date(batasCheckOut);
                                        const currentDate = new Date().getTime();
                                        const distance = targetDate - currentDate;

                                        const days = Math.floor(distance / (1000 * 60 * 60 * 24));
                                        const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                                        const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                                        const seconds = Math.floor((distance % (1000 * 60)) / 1000);

                                        if (days <= 0) {
                                                  if(hours <= 0){
                                                      if(minutes <= 0){
                                                        document.getElementById('countdown').innerHTML = `${seconds} detik`;
                                                      }else {
                                                    document.getElementById('countdown').innerHTML = `${minutes} menit ${seconds} detik`;
                                                      }
                                                  }else {
                                                  document.getElementById('countdown').innerHTML = `${hours} jam ${minutes} menit ${seconds} detik`;
                                                  }
                                          } else {
                                              if(hours == 0){
                                              document.getElementById('countdown').innerHTML = `${days} hari ${minutes} menit ${seconds} detik`;
                                              }else {
                                                document.getElementById('countdown').innerHTML = `${days} hari ${hours} jam ${minutes} menit ${seconds} detik`;
                                              }
                                          }
                                        if (distance < 0) {
                                            clearInterval(countdown);
                                            document.getElementById('countdown').innerHTML = 'Waktu sudah habis';
                                            document.getElementById('myForm').submit();
                                        }
                                    
                              } else {
                                $("#dynamic-content").html('');
                                $("#detail-harga").html(`
                                    <table class="table table-bordered">
                                      <tbody>
                                          <tr >
                                            <td class="text-right right" ><strong>Sub Total : </strong></td>
                                            <td class="text-right right" ><strong> ${data.subtotal} </strong></td>
                                          </tr>
                                      </tbody>
                                    </table>
                                  `);
                              }
                          }
                      });
                  }
                  setInterval(refreshContent, 1000); 
            </script>
            <?php if($approve == 2){ ?>
              <div class="action-area">
                <h3>Alamat Penerima</h3>
              </div>
              <div class="col-sm-4 col-sm-offset-8 cart-total"> 
                  <div>
                    <?= $address_name ?>
                    <br>
                    <?= $address_kota ?> <?= $address_prov ?>   <?= $address_postcode ?> 
                  </div>
              </div>
              <div class="action-area">
                <h3>Alamat Pengirim</h3>
              </div>
              <div class="col-sm-4 col-sm-offset-8 cart-total"> 
                <div>
                  <?= $address_sl_name ?>
                  <br>
                  <?= $address_sl_kota ?> <?= $address_sl_prov ?>   <?= $address_sl_postcode ?> 
              </div>
            <?php } else { ?>
              <div class="action-area">
                <h3>Alamat Pengirim</h3>
              </div>
              <div class="col-sm-4 col-sm-offset-8 cart-total"> 
                <div>
                  <?= $seller_address ?>
                  <br>
                  <?= $seller_kota ?> <?= $seller_prov ?>   <?= $seller_postcode ?> 
              </div>
              <div class="action-area">
                <h3>Alamat Penerima</h3>
              </div>
              <div class="col-sm-4 col-sm-offset-8 cart-total"> 
                <div>
                  <?= $customer_address ?>
                  <br>
                  <?= $customer_kota ?> <?= $customer_prov ?>   <?= $customer_postcode ?>
                  <br><br>
                  <em style="color:red; " >Note: Alamat yang digunakan adalah alamat default yang dipilih </em> 
              </div>
                <br>
                <?php if($approve == 0) { ?>
                  <a class="button btn-warning" href="<?= $ubah_alamat ?>" >Ganti Alamat</a>
                <?php } ?>
              </div>
            <?php } ?>
        <?php } ?>
        
        <div class="buttons">
          <div id="button-lanjut-belanja" style="margin-right: 9px;" class="pull-left">
            <a href="<?php echo $continue; ?>" class="btn-default button"><?php echo $button_shopping; ?></a>
          </div>
          <?php if ( (int)str_replace(",",".",str_replace(".","",str_replace("g","", $weight))) <= 30000 && $statusproduk == 0 ) { ?> 
            <div class="pull-right">
              <a href="<?php echo $checkout; ?>" class="btn-primary button"><?php echo $button_checkout; ?></a>
            </div> 
          <?php } else { ?>
            <?php if ($approve==0 and $klik==0) { ?>
                <button type="button" class="button" data-toggle="modal" data-target="#myModal" >Ajukan Ongkos Kirim</button>
              <div class="pull-right">
                <strong><font size="3"  color="red"><?php echo "Checkout terkunci, menunggu Konfirmasi dari admin, klik-> ajukan ongkir."; ?></font></strong>
              </div> 
            <?php } ?>
              <div id="button-checkout-big" style="display:none;" class="pull-right">
                <a href="<?php echo $checkout; ?>" class="btn-primary button"><?php echo $button_checkout; ?></a>
              </div> 
          <?php } ?>
        </div>
      </div>
      <?php echo $content_bottom; ?>
    </div>
  </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Apakah anda  membutuhkan jasa bongkar muat?</h4>
      </div>
      <div class="modal-body">
        <form action="<?= $pengajuanongkir ?>"  method="post" class="form-horizontal">
            <input type="hidden" name="customer_id" value="<?= $customer_id ?>" >
            <input type="hidden" name="seller_address" value="<?= $seller_addres_id ?>" >
            <input type="hidden" name="customer_address" value="<?= $customer_address_id ?>" >
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <label class="radio-inline">
                  <input type="radio" name="optiontukang" id="inlineRadio2" value="2" required> Ya Saya Perlu
                </label>
                <label class="radio-inline">
                  <input type="radio" name="optiontukang" id="inlineRadio1" value="1" required> Tidak Perlu
                </label>
              </div>
            </div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Ajukan Sekarang</button>
      </div>
      </form>
    </div>
  </div>
</div>


<?php if ($success) { ?>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script>
  Swal.fire({
    position: "top-end",
    icon: "success",
    title: "<?php echo $success; ?>",
    showConfirmButton: false,
    timer: 1500
  });
  </script>
<?php } ?>


<?php echo $footer; ?> 
