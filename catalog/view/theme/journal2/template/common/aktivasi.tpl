
<?php echo $header; ?>
<div id="container" class="container j-container success-page">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><span itemprop="title"><?php echo $breadcrumb['text']; ?></span></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><!--<?php echo $content_top; ?>
      <h1 class="heading-title"><?php echo $heading_title; ?></h1>-->
      <center><strong><?= $text_message; ?></strong></center>
      </div>
    </div>
</div> 

<!-- Modal -->
<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title">Info Aplikasi</h4>
      </div>
      <div class="modal-body">
        <p>Pindah ke aplikasi untuk menikmati semua fitur di Gudang Material</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="modalButton1">Buka Aplikasi</button>
      </div>
    </div>
  </div>
</div>


<?php echo $footer; ?>

<script>

$(document).ready(function() {
  setTimeout(function() {
    $('#myModal').modal('show');
  }, 2000);

  $('#modalButton1').click(function() {
    window.location.href = 'https://play.google.com/store/apps/details?id=com.gudang.materials.lite&pli=1';
  });

  
});


</script>




<!--<script src="catalog/view/theme/journal2/js/main.js"></script> -->