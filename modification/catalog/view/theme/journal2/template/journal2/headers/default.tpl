<header class="journal-header-default">
    <div class="header">
    <div class="journal-top-header j-min"></div>

    <div id="header" class="journal-header">
        <div class="journal-logo xs-100 sm-100 md-33 lg-25 xl-25">
            <?php if ($logo) { ?>
                <div id="logo">
                    <a href="<?php echo str_replace('index.php?route=common/home', '', $home); ?>">
                        <?php echo Journal2Utils::getLogo($this->config); ?>
                    </a>
                </div>
            <?php } ?>
        </div>
        <div class="header-assets xs-100 sm-100 md-66 lg-75 xl-75">

            <div class="journal-links j-min xs-100 sm-100 md-100 lg-66 xl-66">
                <div class="links j-min">
                    <ul class="top-menu">
                    <?php echo $this->journal2->settings->get('config_primary_menu'); ?>
                    </ul>
                </div>
            </div>
            <div class="journal-cart j-min xs-100 sm-50 md-50 lg-33 xl-33">
                <?php echo $cart; ?>
            </div>
            <div class="journal-login j-min xs-100 sm-100 md-100 lg-66 xl-66">
                <?php if ($language): ?>
                <div class="journal-language">
                    <?php echo $language; ?>
                </div>
                <?php endif; ?>
                <?php if ($currency): ?>
                <div class="journal-currency">
                    <?php echo $currency; ?>
                </div>
                <?php endif; ?>
                <div class="journal-secondary">
                    <ul class="top-menu">

  <?php if(isset($notification) && $notification) { echo $notification; } ?>
  <style>
    .top-menu-mp {
      border-bottom: 1px solid gray;
      padding: 5px 12px;
    }
  </style>
  <?php if(isset($marketplace_status) && $marketplace_status){ ?>
      <li class="dropdown"><a href="<?php echo $menusell; ?>" title="<?php echo $menusell; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-users"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_sell_header; ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <?php if ($logged AND $chkIsPartner && isset($marketplace_seller_mode) && $marketplace_seller_mode) { ?>
              <?php if(isset($marketplace_allowed_account_menu) && $marketplace_allowed_account_menu && in_array('profile',$marketplace_allowed_account_menu)) { ?>
                  <li class="top-menu-mp"><a href="<?php echo $mp_profile; ?>"><?php echo $text_my_profile; ?></a></li>
              <?php } ?>
              <?php if(isset($marketplace_allowed_account_menu) && $marketplace_allowed_account_menu && in_array('dashboard',$marketplace_allowed_account_menu)) { ?>
                  <li class="top-menu-mp"><a href="<?php echo $mp_dashboard; ?>"><?php echo $text_dashboard; ?></a></li>
              <?php } ?>
              <?php if(isset($marketplace_allowed_account_menu) && $marketplace_allowed_account_menu && in_array('orderhistory',$marketplace_allowed_account_menu)) { ?>
                  <li class="top-menu-mp"><a href="<?php echo $mp_orderhistory; ?>"><?php echo $text_orderhistory; ?></a></li>
              <?php } ?>
              <?php if(isset($marketplace_allowed_account_menu) && $marketplace_allowed_account_menu && in_array('transaction',$marketplace_allowed_account_menu)) { ?>
                  <li class="top-menu-mp"><a href="<?php echo $mp_transaction; ?>"><?php echo $text_transaction; ?></a></li>
              <?php } ?>
              <?php if(isset($marketplace_allowed_account_menu) && $marketplace_allowed_account_menu && in_array('productlist',$marketplace_allowed_account_menu)) { ?>
                  <li class="top-menu-mp"><a href="<?php echo $mp_productlist; ?>"><?php echo $text_productlist; ?></a></li>
              <?php } ?>
              <?php if(isset($marketplace_allowed_account_menu) && $marketplace_allowed_account_menu && in_array('download',$marketplace_allowed_account_menu)) { ?>
                  <li class="top-menu-mp"><a href="<?php echo $mp_download; ?>"><?php echo $text_download; ?></a></li>
              <?php } ?>

              <?php if(isset($marketplace_allowed_account_menu) && $marketplace_allowed_account_menu && in_array('addproduct',$marketplace_allowed_account_menu)) { ?>
                  <li class="top-menu-mp"><a href="<?php echo $mp_addproduct; ?>"><?php echo $text_addproduct; ?></a></li>
              <?php } ?>

              <?php if(isset($marketplace_allowed_account_menu) && $marketplace_allowed_account_menu && in_array('downloads',$marketplace_allowed_account_menu)) { ?>
                  <li class="top-menu-mp"><a href="<?php echo $mp_download; ?>"><?php echo $text_download; ?></a></li>
              <?php } ?>
              <?php if(isset($marketplace_allowed_account_menu) && $marketplace_allowed_account_menu && in_array('asktoadmin',$marketplace_allowed_account_menu)) { ?>
                  <li><a id="ask-to-admin" data-toggle="modal" data-target="#myModal-seller-mail"><?php echo $text_ask_admin; ?></a></li>
              <?php } ?>
              <?php if(isset($marketplace_allowed_account_menu) && $marketplace_allowed_account_menu && in_array('manageshipping',$marketplace_allowed_account_menu)) { ?>
                  <li class="top-menu-mp"><a href="<?php echo $mp_add_shipping_mod; ?>"><?php echo $text_wkshipping; ?></a></li>
              <?php } ?>
              <li class="top-menu-mp" id="wk-notify"><a id="notification" data-toggle="modal" data-target="#myModal-notification"></a></li>

              <?php if(isset($separate_view) && $separate_view) { ?>
                <li class="top-menu-mp"><a href="<?php echo $separate_view; ?>"><?php echo $text_separate_view; ?></a></li>
              <?php } ?>
            <?php } ?>
              <li class="top-menu-mp"><a href="<?php echo $menusell; ?>"><?php echo $text_sell_header; ?></a></li>
          </ul>
      </li>
  <?php } ?>
                       
                    <?php echo $this->journal2->settings->get('config_secondary_menu'); ?>
                    </ul>
                </div>
            </div>

            <div class="journal-search j-min xs-100 sm-50 md-50 lg-33 xl-33">
                <?php if (version_compare(VERSION, '2', '>=')): ?>
                    <?php echo $search; ?>
                <?php else: ?>
                <div>
                    <div id="search" class="j-min">
                        <div class="button-search j-min"><i></i></div>
                        <?php if (isset($filter_name)): /* v1541 compatibility */ ?>
                            <?php if ($filter_name) { ?>
                                <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" autocomplete="off" />
                            <?php } else { ?>
                                <input type="text" name="filter_name" value="<?php echo $text_search; ?>" autocomplete="off" onclick="this.value = '';" onkeydown="this.style.color = '#000000';" />
                            <?php } ?>
                        <?php else: ?>
                            <input type="text" name="search" placeholder="<?php echo $this->journal2->settings->get('search_placeholder_text'); ?>" value="<?php echo $search; ?>" autocomplete="off" />
                        <?php endif; /* end v1541 compatibility */ ?>
                    </div>
                </div>
                <?php endif; ?>
            </div>
        </div>
        <div class="journal-menu j-min xs-100 sm-100 md-100 lg-75 xl-75">
            <?php echo $this->journal2->settings->get('config_mega_menu'); ?>
        </div>
    </div>
    </div>
</header>