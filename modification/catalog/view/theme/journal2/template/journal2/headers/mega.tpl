<header class="journal-header-center journal-header-mega">
    <div class="header">
    <div class="journal-top-header j-min z-1"></div>
    <div class="journal-menu-bg z-0"> </div>
    <div class="journal-center-bg j-100 z-0"> </div>

    <div id="header" class="journal-header z-2">

        <div class="header-assets top-bar">
            <div class="journal-links j-min xs-100 sm-100 md-50 lg-50 xl-50">
                <div class="links j-min">
                    <ul class="top-menu">
                    <?php echo $this->journal2->settings->get('config_primary_menu'); ?>
                    </ul>
                </div>
            </div>

            <?php if ($language): ?>
            <div class="journal-language j-min">
                <?php echo $language; ?>
            </div>
            <?php endif; ?>

            <?php if ($currency): ?>
            <div class="journal-currency j-min">
                <?php echo $currency; ?>
            </div>
            <?php endif; ?>

            <div class="journal-secondary j-min xs-100 sm-100 md-50 lg-50 xl-50">
                <div class="links j-min">
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
              <li style="padding: 7px 0px 24px 11px;" class="top-menu-mp" id="wk-notify"><a id="notification" data-toggle="modal" data-target="#myModal-notification"></a></li>

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
        </div>

        <div class="header-assets">
            <div class="journal-logo j-100 xs-100 sm-100 md-30 lg-30 xl-30">
                <?php if ($logo) { ?>
                    <div id="logo">
                        <a href="<?php echo str_replace('index.php?route=common/home', '', $home); ?>">
                            <?php echo Journal2Utils::getLogo($this->config); ?>
                        </a>
                    </div>
                <?php } ?>
            </div>
            <div class="journal-search j-min xs-100 sm-50 md-45 lg-45 xl-45">
                <?php if (version_compare(VERSION, '2', '>=')): ?>
                    <?php echo $search; ?>
                <?php else: ?>
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
                <?php endif; ?>
            </div>

            <div class="journal-cart j-min xs-100 sm-50 md-25 lg-25 xl-25">
                <?php echo $cart; ?>
            </div>
        </div>

        <div class="journal-menu j-min xs-100 sm-100 md-100 lg-100 xl-100">
            <?php echo $this->journal2->settings->get('config_mega_menu'); ?>
        </div>
    </div>
    </div>
</header>