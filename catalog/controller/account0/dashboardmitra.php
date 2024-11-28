<?php
class ControllerAccountDashboardmitra extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/dashboardmitra', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->load->language('account/dashboardmitra');

		$this->document->setTitle($this->language->get('heading_title'));

              $this->load->model('account/customerpartner');
              $data['is_seller'] = 0;
              $data['marketplace_seller_mode'] = 0;

              if ($this->config->get('marketplace_status') && $this->model_account_customerpartner->chkIsPartner()) {

                  $data['is_seller'] = 1;

                  $data['action'] = $this->url->link('account/dashboardmitra', '', 'SSL');

                  if (($this->request->server['REQUEST_METHOD'] == 'POST')) {

                      if (isset($this->request->post['marketplace_seller_mode']) && $this->request->post['marketplace_seller_mode']) {
                          $this->session->data['marketplace_seller_mode'] = $this->request->post['marketplace_seller_mode'];
                      } else {
                          $this->session->data['marketplace_seller_mode'] = 0;
                      }
                  }

                  if(isset($this->session->data['marketplace_seller_mode'])){
                      $data['marketplace_seller_mode'] = $this->session->data['marketplace_seller_mode'];
                  } else {
                      $data['marketplace_seller_mode'] = 1;
                      $this->session->data['marketplace_seller_mode'] = 1;
                  }

                  $this->load->language('module/marketplace');

                  $data['text_mode_seller'] = $this->language->get('text_mode_seller');

                  $data['text_mode_customer'] = $this->language->get('text_mode_customer');

                  $this->document->addScript("https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js");

                  $this->document->addStyle("https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css");
              }

          

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', 'SSL')
		);

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_my_account'] = $this->language->get('text_my_account');
		$data['text_my_orders'] = $this->language->get('text_my_orders');
		$data['text_my_newsletter'] = $this->language->get('text_my_newsletter');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_reward'] = $this->language->get('text_reward');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_recurring'] = $this->language->get('text_recurring');

		$data['edit'] = $this->url->link('account/edit', '', 'SSL');
		$data['password'] = $this->url->link('account/password', '', 'SSL');
		$data['address'] = $this->url->link('account/address', '', 'SSL');
		$data['wishlist'] = $this->url->link('account/wishlist');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['return'] = $this->url->link('account/return', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');
		$data['recurring'] = $this->url->link('account/recurring', '', 'SSL');

		if ($this->config->get('reward_status')) {
			$data['reward'] = $this->url->link('account/reward', '', 'SSL');
		} else {
			$data['reward'] = '';
		}


              $data['marketplace_status'] = $this->config->get('marketplace_status');
              if($this->config->get('marketplace_status')) {
                  $this->load->model('account/customer');
                  $this->load->model('account/customerpartner');
                  $this->load->language('module/marketplace');
                  $data['chkIsPartner'] = $this->model_account_customerpartner->chkIsPartner();

                  $data['text_marketplace'] = $this->language->get('text_marketplace');
                  $data['text_becomePartner'] = $this->language->get('text_becomePartner');

                  if($this->config->get('marketplace_account_menu_sequence')) {
                      foreach ($this->config->get('marketplace_account_menu_sequence') as $key => $lang_value) {
                          $mp_language[$key] = $this->language->get('text_'.$key);
                      }
                      $data['marketplace_account_menu_sequence'] = $mp_language;
                  }

                  $data['isMember'] = false;
                  if($this->config->get('wk_seller_group_status')) {
                      $data['wk_seller_group_status'] = true;
                      $this->load->model('account/customer_group');
                      $isMember = $this->model_account_customer_group->getSellerMembershipGroup($this->customer->getId());
                      if($isMember) {
                          $allowedAccountMenu = $this->model_account_customer_group->getaccountMenu($isMember['gid']);
                          if($allowedAccountMenu['value']) {
                              $accountMenu = explode(',',$allowedAccountMenu['value']);
                              foreach ($accountMenu as $key => $menu) {
                                  $aMenu = explode(':', $menu);
                                  $data['marketplace_allowed_account_menu'][$aMenu[0]] = $aMenu[1];
                              }
                          }
                          $data['isMember'] = true;
                      } else {
                          $data['isMember'] = false;
                      }
                  }

                  if ($this->model_account_customerpartner->chkIsPartner() && !$data['isMember'] && $this->config->get('wk_seller_group_status')) {

                      $data['marketplace_allowed_account_menu']['membership'] = 'membership';
                  }

                  if($this->config->get('marketplace_allowed_account_menu') && !$this->config->get('wk_seller_group_status')) {
                      $data['marketplace_allowed_account_menu'] = $this->config->get('marketplace_allowed_account_menu');
                  }

                  $data['mail_for'] = '&contact_admin=true';
                  $data['want_partner'] = $this->url->link('account/customerpartner/become_partner','','SSL');

                  $data['account_menu_href'] = array(
                      'profile' => $this->url->link('account/customerpartner/profile', '', 'SSL'),
                      'dashboard' => $this->url->link('account/customerpartner/dashboard', '', 'SSL'),
                      'orderhistory' => $this->url->link('account/customerpartner/orderlist', '', 'SSL'),
                      'transaction' => $this->url->link('account/customerpartner/transaction', '', 'SSL'),
                      'category' => $this->url->link('account/customerpartner/category', '', 'SSL'),
                      'productlist' => $this->url->link('account/customerpartner/productlist', '', 'SSL'),
                      'addproduct' => $this->url->link('account/customerpartner/addproduct', '', 'SSL'),
                      'downloads' => $this->url->link('account/customerpartner/download', '', 'SSL'),
                      'manageshipping' => $this->url->link('account/customerpartner/add_shipping_mod', '', 'SSL'),
                      'asktoadmin' => $this->url->link('account/customerpartner/addproduct', '', 'SSL'),
                      'notification' => $this->url->link('account/customerpartner/notification', '', 'SSL'),
                      'information' => $this->url->link('account/customerpartner/information', '', 'SSL'),
                      'review' => $this->url->link('account/customerpartner/review', '', 'SSL'),
                  );

                  /*
                  Membership code
                  add link to existing account menu array
                   */
                  if($this->config->get('wk_seller_group_status')) {
                      $data['wk_seller_group_status'] = true;
                      $data['account_menu_href']['membership'] = $this->url->link('account/customerpartner/wk_membership_catalog','','SSL');
                  } else {
                      $data['wk_seller_group_status'] = false;
                      if(isset($data['account_menu_href']['membership'])) {
                          unset($data['account_menu_href']['membership']);
                      }
                      if(isset($data['marketplace_account_menu_sequence']['membership'])) {
                          unset($data['marketplace_account_menu_sequence']['membership']);
                      }
                  }
              }

          
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
                    $this->load->model('catalog/product');
           	          $seller_id = 0;
				      $chatting_id = 0;
                    $product_info_ = $this->model_catalog_product->getCekChattingSellerID($this->customer->getId());

		            if ($product_info_) {		
             	      $seller_id = $product_info_['seller_id'];
				      $chatting_id = $product_info_['chatting_id'];
		              }   

				
				if ( $seller_id  > 0) {
					
				  
				   //$this->response->redirect($this->url->link('customerpartner/profile', '' , 'SSL'));
				   //$this->response->redirect($this->url->link('account/customerpartner/productlist', '' , 'SSL'));

			             //$this->response->redirect($this->url->link('information/information','information_id=24', 'SSL'));
						// $this->response->redirect($this->url->link('account/dashboardmitra','', 'SSL'));
						  
					$data['refchatiing'] = "../seller/index.php?route=module/chatting/getchatting&chatting_id=" .  $chatting_id;
				} else {
					$data['refchatiing'] = "https://gudangmaterials.id/seller/index.php?route=account/dashboardmitra" ;
			 
			   }    

               
		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/dashboardmitra.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/dashboardmitra.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/dashboardmitra.tpl', $data));
		}
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

        //frd 1
        public function zone() {
          $json = array();

          $this->load->model('localisation/zone');
          $zone_info = $this->model_localisation_zone->getZone($this->request->get['zone_id']);
          $json = array();
          if ($zone_info) {
            $this->load->model('localisation/district');
            if (!empty($zone_info['raoprop_id'])) {
              $json = array(
                'zone_id'        => $zone_info['country_id'],
                'name'              => $zone_info['name'],
                'code'        => $zone_info['code'],
                'raoprop_id'        => $zone_info['raoprop_id'],
                'raoprop'              => $this->model_localisation_district->getDistricts($zone_info['raoprop_id']),
              );

            }
          }

          $this->response->addHeader('Content-Type: application/json');
          $this->response->setOutput(json_encode($json));
        }
        //
      
}
