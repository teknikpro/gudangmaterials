<?php //echo $header; ?><?php //echo $column_left; ?><?php //echo $column_right; ?>
<!-- <div id="content">
    <?php //echo $content_top; ?>
 	<h1>Warning</h1>
 	<div class="content">
 		<?php //echo $breadcrumb['message']; ?>
 	</div>
 	<div class="buttons">
    	<div class="right"><a href="<?php //echo $breadcrumb['href']; ?>" class="button">Continue with full payment</a></div>
  	</div>    
</div> -->
<?php //echo $footer; ?>

<?php echo $header; ?>
<div class="container" align="center">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>


    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      
      <?php
      switch ($data["payment_type"]) {
        case "bank_transfer":
          ?>
            <h1>Pembayaran belum selesai!</h1>
            pesanan Anda telah diterima tetapi belum dibayar</br>
            Anda memesan dengan <b><?=$data['payment_method']?></b></br>
            nomor va Anda : <b><?=$data['payment_code']?></b></br>
            untuk instruksi pembayaran klik disini <a href="https://docs.google.com/viewer?url=<?=$data['instruction']?>&embedded=true">here<a></br></br>
          <?php
          break;
        case "echannel"
          ?>
            <h1>Pembayaran belum selesai!</h1>
            pesanan Anda telah diterima tetapi belum dibayar</br>
            Anda memesan dengan <b><?=$data['payment_method']?></b></br>
            kode pembayaran dan kode perusahaan Anda : <b><?=$data['payment_code']?></b> and <b><?=$data['company_code']?></b></br>
            untuk instruksi pembayaran klik  <a href="<?=$data['instruction']?>" target="blank">disini<a></br></br>

          <?php
          break;
        case "cstore"
          ?>
            <h1>Pembayaran belum selesai!</h1>
            pesanan Anda telah diterima tetapi belum dibayar</br>
            Anda melakukan <b><?=$data['payment_method']?></b></br>
            kode pembayaran Anda : <b><?=$data['payment_code']?></b></br>
           
            <!-- untuk instruksi pembayatan klik  <a href="<?=$data['instruction']?>" target="blank">disini.!<a></br></br> -->
			<!--untuk instruksi pembayatan klik <a href="#" onClick="window.open(<?=$data['instruction']?>, '_blank')">disini...!</a>
			

			 untuk instruksi pembayaran klik  
			<button onclick="bukaweb()">disini...!</button>

			
				 <script type="text/javascript">
				   function bukaweb(){
					 window.open(<?=$data['instruction']?>,"_self","location=yes","clearcache=yes","hardwareback=yes","zoom=yes");
				   }
				 </script>-->
			
            untuk instruksi pembayatan klik <a href="#" onclick="window.open(<?=$data['instruction']?>);">disini...!</a>  
			
			</br></br>
			
          <?php
          break;
        case "bca_klikbca"
          ?>
            <h1>Pembayaran belum selesai!</h1>
            pesanan Anda telah diterima tetapi belum dibayar</br>
            Anda memesan dengan <b><?=$data['payment_method']?></b></br>
            Silakan lengkapi pembayaran Anda di <a href="http://www.klikbca.com">Klik Bca</a>
          <?php
          break;
        case "bca_klikpay"
          ?>
            <div class="container"><?php echo $content_top; ?>
              <h2 class="text-center">Pembayaran berhasil!</h2>
              <p class="text-center">Kami telah menerima pembayaran Anda. Pesanan Anda akan segera diproses</p>
              <?php echo $content_bottom; ?>
            </div>
          <?php echo $footer; ?>
          <?php
          break;
        default
          ?>
            <h2>Terima kasih. Pembayaran Pesanan Anda telah diterima oleh <b><?=$data['payment_method']?></b></h2></br></br>
			
            
          <?php
          break;
      }
      ?>
      
		      
	  </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>


		