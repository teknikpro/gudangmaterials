<?php echo $header; ?>

              <style type="text/css">
                .btn-success{
                  background-image: linear-gradient(to bottom, #62c462, #51a351);
                }
              </style>
          
<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><span itemprop="title"><?php echo $breadcrumb['text']; ?></span></a></li>
    <?php } ?>
  </ul>
  

  
  <center><p>
  <!--<a href="http://servertest2020.my.id/index.php?route=information/information&amp;information_id=11">-->
  
  <a href="<?php echo $data['refchatiing']; ?>">  
  <img src="https://servertest2020.my.id/seller/image/wkseller/imageseller/1-chatting.png" style="width: 68px; height: 68px;"></a>&nbsp; &nbsp; &nbsp;
  <img src="https://servertest2020.my.id/seller/image/wkseller/imageseller/6-historiorder.png" style="width: 68px; height: 68px;">&nbsp; &nbsp; &nbsp;
  <a href="https://servertest2020.my.id/index.php?route=journal2/blog"><img src="https://servertest2020.my.id/seller/image/wkseller/imageseller/9-notifikasi.png" style="width: 68px; height: 68px;">&nbsp; &nbsp; &nbsp;
  </a><img src="https://servertest2020.my.id/seller/image/wkseller/imageseller/13-transaksi.png" style="width: 68px; height: 68px;">&nbsp;&nbsp; &nbsp;
  <img src="https://servertest2020.my.id/seller/image/wkseller/imageseller/7-informasi.png" style="width: 68px; height: 68px;">&nbsp;&nbsp; &nbsp;
  <a href="http://servertest2020.my.id/index.php?route=information/information&amp;information_id=11"><img src="https://servertest2020.my.id/seller/image/wkseller/imageseller/3-produk.png" style="width: 68px; height: 68px;">
  </a>&nbsp; &nbsp; &nbsp;<img src="https://servertest2020.my.id/seller/image/wkseller/imageseller/10-profil.png" style="width: 68px; height: 68px;">&nbsp; &nbsp; &nbsp;
  <a href="https://servertest2020.my.id/index.php?route=journal2/blog"><img src="https://servertest2020.my.id/seller/image/wkseller/imageseller/8-konfirmasibayar.png" style="width: 68px; height: 68px;">&nbsp; &nbsp; &nbsp;
  </a><img src="https://servertest2020.my.id/seller/image/wkseller/imageseller/11-promo.png" style="width: 68px; height: 68px;">&nbsp;&nbsp; &nbsp;
  <img src="https://servertest2020.my.id/seller/image/wkseller/imageseller/4-alamat.png" style="width: 68px; height: 68px;">&nbsp;&nbsp; &nbsp;<a href="https://servertest2020.my.id/index.php?route=journal2/blog">
  <img src="https://servertest2020.my.id/seller/image/wkseller/imageseller/5-password.png" style="width: 68px; height: 68px;">&nbsp; &nbsp; &nbsp;</a>
  <a href="https://servertest2020.my.id/index.php?route=journal2/blog"><img src="https://servertest2020.my.id/seller/image/wkseller/imageseller/14-ulasanproduk.png" style="width: 68px; height: 68px;">&nbsp; &nbsp; &nbsp;</a> </p>
</center>
     <div>
      <?php echo $content_bottom; ?></div>
    </div>
</div>

              <script type="text/javascript">
                $('input[name=\'marketplace_seller_mode\']').on('change',function() {
                  $("#form-mode").submit();
                });
              </script>
          
<?php echo $footer; ?>
