<?php echo $header; ?>
<link type="text/css" href="catalog/view/theme/journal2/stylesheet/MP/journal2.css" rel="stylesheet"  />

<div id="container" class="container j-container" =>

<style type="text/css">
  header, .breadcrumb{
    z-index: 0 !important;
  }

  .cke_combopanel {
    z-index: 10 !important;
  }

  .well{
    color: black;
  }

  .col-sm-4{
    width: 32%;
    display: inline-block;
  }
  li {
    list-style: none;
    color: black;
  }
  .wk_sm_20 {
    float: left;
    width: 100%;
    position: relative;
  }

  .wk_sm_80 {
    float: left;
    width: 100%;
    position: relative;
  }

  #option {
    padding: 0;
    margin:0;
  }

  .tab-content ul li {
    margin: 10px 0;
  }

  #option li {
    position: relative;
  }

  #option ul.dropdown-menu {
    position: absolute;
  }
  @media screen and (width: 768px) {
  label{
    margin-right: 1px;
   }
  }

  @media screen and (min-width: 768px){
    .wk_sm_20 {
      float: left;
      width: 20%;
      position: relative;
      margin-right: 10px;
    }

    .wk_sm_80 {
      float: left;
      width: 78%;
      position: relative;
    }
  }
  input[type="text"], input[type="email"], input[type="password"], input[type="tel"], textarea {
    background: #FFF none repeat scroll 0% 0%;
    border-radius: 0px;
    border: 1px solid #E4E4E4;
    padding: 8px;
    //width: 75%;
    transition: all 0.2s ease 0s;
    font-size: 13px;
    box-shadow: 0px 0px 3px rgba(0, 0, 0, 0.08) inset;
  }
 .button{

    height:34px;
  }
  .fa-calendar{
    margin-top:-10px;
  }

  .img-thumbnail {
    border: 1px solid grey;
  }

  .imgoption{
    display: block;
    margin-top: 5px;
    width: 14%;
  }

  .imgoption button {
    width: 100%;
  }

  .category-box{
    min-width: 20%;
    padding: 20px;
    height: 200px;
    background-color: #f3f3f3;
    margin-right: 3px;
    border: 2px solid #ede9e4;
    border-radius: 7px;
    float: left;
    position: relative;
    overflow-y: auto;
    margin-top: 0;
    box-sizing: border-box;
  }

  .wk_pd_category{
    margin: 15px 0px;
  }

  .wk_category_select{
    color: blue;
  }
</style>

  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

  <?php if ($success) { ?>
    <div class="alert alert-success success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
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
    <h1 class="secondary-title"><?php echo $heading_title; ?></h1>
      <?php echo $content_top; ?>
            
      <div class="content">
      <?php if($isMember) { ?>
        <?php if(!$in_process){  ?>          
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"  class="form-horizontal">
          <div class="buttons">
            <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default button"><?php echo $button_back; ?></a></div>
            <div class="pull-right">
              <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary button" />
            </div>
          </div>
          <!--<div class="form-group required">
            <label class="col-sm-2 control-label" for="input-shoppartner"><span data-toggle="tooltip" title="<?php echo $text_shop_name_info; ?>"><?php echo $text_shop_name; ?></span></label>
            <div class="col-sm-10">
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-search button"></i></span>
                <input name="shoppartner" value="<?php echo $shoppartner; ?>" placeholder="Shop name" id="input-shoppartner" class="form-control" style="width:auto;" type="text">
              </div>           

              <?php if ($error_shoppartner) { ?>
              <div class="text-danger"><?php echo $error_shoppartner; ?></div>
              <?php } ?>
            </div>
          </div>-->
		 
         <!--<div class="form-group required">
            <label class="col-sm-2 control-label" for="input-nama_brand"><span data-toggle="tooltip" title="<?php echo $help_nama_brand; ?>"><?php echo $entry_nama_brand; ?></span></label>
            <div class="col-sm-10">
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-search button"></i></span>
                <input name="nama_brand" value="<?php echo $nama_brand; ?>" placeholder="Nama Brand" id="input-nama_brand" class="form-control" style="width:auto;" type="text">
              </div>           

              <?php if ($error_nama_brand) { ?>
              <div class="text-danger"><?php echo $error_nama_brand; ?></div>
              <?php } ?>
            </div>
          </div>-->		  
		  
  
          <!--<div class="form-group <?php if($category_required){ ?>required<?php } ?>"> -->
		  <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_category; ?></span></label>
            <div class="col-sm-9">
              <a id="input-category" class="btn btn-primary button" data-toggle="modal" data-target="#category-modal" style="margin-bottom: 10px;"><?php echo $text_addcategory; ?> </a>
              <div id="product-category" class="well well-sm addproduct_well">
                <?php foreach ($product_categories as $product_category) { ?>
                <div id="product-category<?php echo $product_category['category_id']; ?>" ><i class="fa fa-minus-circle "></i><?php echo $product_category['name']; ?>
                  <input type="hidden" name="product_category[]" value="<?php echo $product_category['category_id']; ?>" />
                </div>
                <?php } ?>
              </div>
              <?php if ($error_category) { ?>
              <div class="text-danger"><?php echo $error_category; ?></div>
              <?php } ?>
            </div>
          </div>

        <!--<div class="form-group required">
            <label class="col-sm-2 control-label" for="input-nama_brand"><span data-toggle="tooltip" title="<?php echo $help_nama_brand; ?>"><?php echo $entry_nama_brand; ?></span></label>
            <div class="col-sm-10">
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-search button"></i></span>
                <input name="nama_brand" value="<?php echo $nama_brand; ?>" placeholder="Nama Brand" id="input-nama_brand" class="form-control" style="width:auto;" type="text">
              </div>           

              <?php if ($error_nama_brand) { ?>
              <div class="text-danger"><?php echo $error_nama_brand; ?></div>
              <?php } ?>
            </div>
          </div>-->
          <p>Entry No.1 dan 2 di bawah ini, bila belum tersedia pilihan Brandnya:</p>
		  <div class="form-group">
		  
            <label class="col-sm-2 control-label" for="input-manufacture">1.<?php echo $entry_manufacture; ?></label>
            <div class="col-sm-10">
              <input type="text" name="manufacture"  id="input-manufacture" class="form-control" />
 
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-userbrand">2.<?php echo $entry_userbrand; ?></label>
            <div class="col-sm-10">
              <input type="text" name="userbrand"  id="input-userbrand" class="form-control" />
 
            </div>
          </div>


          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-entry"><span data-toggle="tooltip" title="<?php echo $text_say_info; ?>">Isi Propil Anda disini</span></label>
            <div class="col-sm-10">
              <textarea id="input-entry" name="description" class="form-control" rows="3"><?php echo $description; ?></textarea>
              <!--<?php if ($error_description) { ?>
              <div class="text-danger"><?php echo $error_description; ?></div>
              <?php } ?>-->
            </div>
          </div>
        </form>


        <?php }else {?>             
          <div class="alert alert-info information"><i class="fa fa-exclamation-circle"></i> <?php echo $text_delay; ?></div>
        <?php } ?>
      <?php } else { ?>
        <div class="text-danger">
          <?php echo $error_warning_authenticate; ?>
        </div>
      <?php } ?>
    </div>
	
  

	
  </div>
</div>
</div>

<div id="category-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><?php echo $heading_category; ?></h4>
      </div>
      <div class="modal-body" style="overflow:auto;">
       <div id="category-modal-body" style="height: 100%;display: inline-flex;width: 100%;"></div>
      </div>
      <div class="modal-footer">
        <!-- <div class="pull-left">
          <button type="button" class="btn btn-warning" id="category-modal-back"><?php echo $button_back; ?></button>
        </div> -->
        <div class="pull-right">
          <button type="button" class="btn btn-default button" data-dismiss="modal"><?php echo $button_close; ?></button>
        </div>
      </div>
    </div>
  </div>
</div>



<?php if(!$in_process){  ?>  
<!--<script>
$( "#input-shoppartner" ).change(function() {
  thisshop = this;
  shop = $(thisshop).val();
  
  if(shop){

    jQuery(thisshop).prev().html('<i class="fa fa-spinner fa-spin"></i>');

    $.ajax({
           type: 'POST',
           data: ({shop: shop}),
           dataType: 'json',
           url: 'index.php?route=customerpartner/sell/wkmpregistation',
           success: function(data){     

              if(data['success']){
                jQuery(thisshop).prev().html('<span data-toggle="tooltip" class="text-success" title="<?php echo $text_avaiable; ?>"><i class="fa fa-thumbs-o-up"></i></span>');
              }else if(data['error']){
                jQuery(thisshop).prev().html('<span data-toggle="tooltip" class="text-danger" title="<?php echo $text_no_avaiable; ?>"><i class="fa fa-thumbs-o-down"></i></span>');
              }       
            
            }
        });
  }
});
</script>-->


<!--<script>
$( "#input-nama_brand" ).change(function() {
  thisnama_brand = this;
  nama_brand = $(thisnama_brand).val();
  
  if(nama_brand){

    jQuery(thisbrand).prev().html('<i class="fa fa-spinner fa-spin"></i>');

    $.ajax({
           type: 'POST',
           data: ({nama_brand: nama_brand}),
           dataType: 'json',
           url: 'index.php?route=customerpartner/sell/wkmpregistation2',
           success: function(data){     

              if(data['success']){
                jQuery(thisshop).prev().html('<span data-toggle="tooltip" class="text-success" title="<?php echo $text_avaiable; ?>"><i class="fa fa-thumbs-o-up"></i></span>');
              }else if(data['error']){
                jQuery(thisshop).prev().html('<span data-toggle="tooltip" class="text-danger" title="<?php echo $text_no_avaiable; ?>"><i class="fa fa-thumbs-o-down"></i></span>');
              }       
            
            }
        });
  }
});

</script>-->

<script>


</script>

  <script>
     var wk_addproduct = {
      'choose_categories':[],
      'getcategories2':function(id_brand){
        $.ajax({
          url: 'index.php?route=account/customerpartner/addproduct/getcategories2&id_brand=' + id_brand,
          type: 'get',
          dataType: 'json',
          success: function(json) {
            if (json['categories']) {
               var idbrand = 0;
               var html = '';
               html += '<div class="category-box">';
              $(json['categories']).each(function(index, value){
				 // window.alert(html);
				  localStorage.idbrand = value.parent_id; 
				  localStorage.parent_name = value.parent_name; 
				  if (value.id_brand > 1000) {
					  html += '<p class="wk_pd_category" data-categoty-id = "' + value.id_brand + '">' + 'Nama Brand :' +  '(' + value.id_brand + ') ' +value.name + '</p>';
                     
                   }else{
					  html += '<p class="wk_pd_category" data-categoty-id = "' + value.id_brand + '">' + 'Brand :' + localStorage.parent_name + ' ~ Skil :' +  value.name + ' ~ ' + localStorage.idbrand + value.id_brand  +'</p>';
		    	  }

				  		  
               // html += '<p class="wk_pd_category" data-categoty-id = "' + value.id_brand + '">' + value.name + '</p>';
              });
              html += '</div>';
			 
			 $(document).find("#category-modal-body").append(html);
	        
			  
            }else{
              if (wk_addproduct.choose_categories) {
                $(wk_addproduct.choose_categories).each(function(index, item){

                  <?php if(isset($mp_allowproducttabs['attribute']) && $mp_allowproducttabs['attribute']) { ?>
                    addCategoryAttribute(item);
                  <?php } ?>
                  $(document).find('#product-category' + item['value']).remove();
				    
				    if (item['value'] < 100) {
			
					  $(document).find('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');
												     
                      $(document).find('#product-category div:odd').attr('class', 'odd');
                      $(document).find('#product-category div:even').attr('class', 'even');
					
				    }	
				  //$(this).item['value'].remove();				  
				  
				  //$(document).find('#product-category div:odd').attr('class', 'odd');
				  //$(document).find('#product-category div:even').attr('class', 'even');				  
				  
                });

                $(document).find("#category-modal").modal("hide");
              }
            }
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });
      },
    };

    $(document).delegate('#input-category', 'click', function(){
      wk_addproduct.choose_categories = [];
      $(document).find("#category-modal-body").empty();
      wk_addproduct.getcategories2(0);
    });

    $(document).delegate('.wk_pd_category', 'click', function(){
      wk_addproduct.choose_categories = [];
      $(this).parent(".category-box").nextAll().remove();
      $(this).parent(".category-box").find(".wk_pd_category").removeClass('wk_category_select');
      $(this).addClass('wk_category_select');

      $($(document).find(".category-box > .wk_category_select")).each(function(index, value){
         var wk_category = {label: $(value).text(),value: $(value).data("categoty-id")};
         wk_addproduct.choose_categories.push(wk_category);
      });

      wk_addproduct.getcategories2($(this).data("categoty-id"));
	
	  
    });

    $(document).delegate('.fa-minus-circle', 'click', function() {
      $(this).parent().remove();
      $(document).find('#product-category div:odd').attr('class', 'odd');
      $(document).find('#product-category div:even').attr('class', 'even');
    });
  </script>
   



<?php } ?>
<?php echo $footer; ?>
