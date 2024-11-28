<?php echo $header; ?>
    <?php echo $column_left; ?>
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
               <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
        </div>
        
        <div class="container-fluid">
            <?php if(!$curl_status) { ?>
            <fieldset>
                <legend> <?php echo $text_curl; ?> </legend>
                <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $text_disabled_curl; ?></div>
                </fieldset>
            <?php } ?>
        <fieldset>
                <legend> <?php echo $text_validation; ?> </legend>
                <div class="alert alert-info"><i class="fa fa-exclamation-circle"></i> <?php echo $text_validate_store; ?></div>
            </fieldset>
            <?php echo $text_information_provide; ?> 
            <ul>
                <li>✓ Order ID : {order ID from hpwebdesign.id / opencart.com}</li>
                <li>✓ Email Order : {email used to perform order} </li>
                <li>✓ Store Domain <span>where this extension installed </span>: {1 store domain where this extension will be installed} </li>
            </ul>
            <a href="mailto:support@hpwebdesign.id?subject=<?php echo $heading_title; ?> Store Validation for <?php echo $domain_name; ?>" class="btn btn-info">Contact Us</a>
        </div>
    </div>
    
<?php echo $footer; ?>