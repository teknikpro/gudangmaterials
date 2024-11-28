<div id="cart" class="btn-group btn-block">
  <button type="button" data-toggle="dropdown" class="btn btn-inverse btn-block btn-lg dropdown-toggle heading"><a><span id="cart-total" data-loading-text="<?php echo $text_loading; ?>&nbsp;&nbsp;"><?php echo $text_items; ?></span> <i></i></a></button>
  <div class="content" >
    <ul class="cart-wrapper" id="isi-content">
    <?php if ($products || $vouchers) { ?>
    <li class="mini-cart-info">
      <table class="table table-striped">
        <?php foreach ($products as $product) { ?>
        <tr style="color:#fff; background-color:#000;">
          <td class="text-center image" style="color:#fff; background-color:#333745;"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></td>
              <?php if (isset($marketplace_status) && $marketplace_status && $marketplace_seller_name_cart_status && isset($product['seller_name']) && $product['seller_name'] && !$marketplace_seller_info_hide) {?>
                <td class="text-left name" style="color:#fff; background-color:#333745;"><a href="<?php echo $product['href']; ?>"><?php echo $product['name'];?></a> <?php echo $text_bySeller;?> <a href="<?php echo $product['seller_href']; ?>" target="_blank"><?php echo $product['seller_name'];?></a>
              <?php }else{?>
                <td class="text-left name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <?php } ?>
          <div>
              <?php if ($product['option']) { ?>
              <?php foreach ($product['option'] as $option) { ?>
              <br />
              - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
              <?php } ?>
              <?php } ?>
              <?php if ($product['recurring']) { ?>
              <br />
              - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
              <?php } ?></div>
          </td>
          <td class="text-right quantity" style="color:#fff; background-color:#333745;">x <?php echo $product['quantity']; ?></td>
          <td class="text-right total" style="color:#fff; background-color:#333745;"><?php echo $product['total']; ?></td>
          <td class="text-center remove" style="color:#fff; background-color:#333745;"><button type="button" onclick="cart.remove('<?php echo $product[version_compare(VERSION, '2.1', '<') ? 'key' : 'cart_id']; ?>');" title="<?php echo $button_remove; ?>" class=""><i class=""></i></button></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr style="color:#fff; background-color:#888;">
          <td class="text-center" style="color:#fff; background-color:#5F6874;"></td>
          <td class="text-left name" style="color:#fff; background-color:#888;"><?php echo $voucher['description']; ?></td>
          <td class="text-right quantity" style="color:#fff; background-color:#888;">x&nbsp;1</td>
          <td class="text-right total" style="color:#fff; background-color:#888;"><?php echo $voucher['amount']; ?></td>
          <td class="text-center remove" style="color:#fff; background-color:#888;"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class=""><i class=""></i></button></td>
        </tr>
        <?php } ?>
      </table>
    </li>
    <li>
      <div class="mini-cart-total">
        <table class="table table-bordered" style="color:#fff; background-color:#5F6874;">
              <?php if ( (int)str_replace(",",".",str_replace(".","",str_replace("g","", $weight))) <= 30000 ) { ?> 
                <?php foreach ($totals as $total) { ?>
                  <tr style="color:#fff; background-color:#5F6874;">
                  <td class="text-right right" style="color:#fff; background-color:#5F6874;"><strong><?php echo $total['title']; ?></strong></td>
                  <td class="text-right right" style="color:#fff; background-color:#5F6874;"><?php echo $total['text']; ?></td>
                  </tr>
                <?php } ?>	   
              <?php } else { ?>
                  <span id="detail-cart"></span>		
			        <?php } ?>		  
        </table>
        <?php if ( (int)str_replace(",",".",str_replace(".","",str_replace("g","", $weight))) <= 30000 && $statusproduk == 0 ) { ?> 
          <p class="text-right checkout"><a class="button" href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a>&nbsp;<a class="button" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></p>
        <?php } else { ?>
          <span id="content-cart"></span>
                <script type="text/javascript">
                      function refreshCart() {
                          $.ajax({
                              url: "<?= $linkajax; ?>", 
                              success: function(response) {
                                let data = JSON.parse(response);
                                  if (data.status == 1) {
                                      $("#content-cart").html(`<span class="text-right checkout"><a class="button" href="${data.cart}">Lihat Keranjang</a>&nbsp;&nbsp; <- Ongkos Kirim Sedang Dihitung</span>`);
                                      $("#detail-cart").html(`
                                        <table>
                                          <tr>
                                            <td class="text-right right" style="color:#fff; background-color:#5F6874;"><strong>Sub Total</strong></td>
                                            <td class="text-right right" style="color:#fff; background-color:#5F6874;">${data.subtotal}</td>					
                                          </tr>
                                          <tr>
                                            <td class="text-right right" style="color:#fff; background-color:#5F6874;"><strong>Total</strong></td>
                                            <td class="text-right right" style="color:#fff; background-color:#5F6874;">${data.totalharga}</td>					
                                          </tr>
                                        </table>	
                                    `);
                                  } else if (data.status == 2) {
                                      $("#content-cart").html(`<p class="text-right checkout"><a class="button" href="${data.cart}">Lihat Keranjang</a>&nbsp;<a class="button" href="${data.checkout}">Checkout</a></p>`);
                                      $("#detail-cart").html(`
                                        <table>
                                          <tr>
                                            <td class="text-right right" style="color:#fff; background-color:#5F6874;"><strong>Sub Total</strong></td>
                                            <td class="text-right right" style="color:#fff; background-color:#5F6874;">${data.subtotal}</td>					
                                          </tr>
                                          <tr>
                                            <td class="text-right right" style="color:#fff; background-color:#5F6874;"><strong>Ongkos Kirim</strong></td>
                                            <td class="text-right right" style="color:#fff; background-color:#5F6874;">${data.ongkir}</td>					
                                          </tr>
                                          <tr>
                                            <td class="text-right right" style="color:#fff; background-color:#5F6874;"><strong>Total</strong></td>
                                            <td class="text-right right" style="color:#fff; background-color:#5F6874;">${data.totalharga}</td>					
                                          </tr>
                                        </table>	
                                    `);
                                  } else {
                                    $("#content-cart").html(`<p class="text-right checkout"><a class="button" href="${data.cart}">Lihat Kerangjang</a>&nbsp;&nbsp; <-Klik tombol ini,ajukan ongkir</p>`);
                                    $("#detail-cart").html(`
                                        <table>
                                          <tr>
                                            <td class="text-right right" style="color:#fff; background-color:#5F6874;"><strong>Sub Total</strong></td>
                                            <td class="text-right right" style="color:#fff; background-color:#5F6874;">${data.subtotal}</td>					
                                          </tr>
                                          <tr>
                                            <td class="text-right right" style="color:#fff; background-color:#5F6874;"><strong>Total</strong></td>
                                            <td class="text-right right" style="color:#fff; background-color:#5F6874;">${data.totalharga}</td>					
                                          </tr>
                                        </table>	
                                    `);
                                  }
                              }
                          });
                      }
                      setInterval(refreshCart, 1000); 
                </script>      
        <?php } ?>		
      </div>
    </li>
    <?php } else { ?>
    <li>
      <p class="text-center empty"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
    </ul>
  </div>
</div>
