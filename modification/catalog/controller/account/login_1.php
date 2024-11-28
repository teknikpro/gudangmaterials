<?php
class ControllerAccountLogin extends Controller {
	private $error = array();

	public function index() {
		$this->load->model('account/customer');

		// Login override for admin users
		if (!empty($this->request->get['token'])) {
			$this->customer->logout();
			$this->cart->clear();

			unset($this->session->data['order_id']);
			unset($this->session->data['payment_address']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['shipping_address']);
			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['comment']);
			unset($this->session->data['coupon']);
			unset($this->session->data['reward']);
			unset($this->session->data['voucher']);
			unset($this->session->data['vouchers']);

			$customer_info = $this->model_account_customer->getCustomerByToken($this->request->get['token']);

			if ($customer_info && $this->customer->login($customer_info['email'], '', true)) {
				// Default Addresses
				$this->load->model('account/address');

				if ($this->config->get('config_tax_customer') == 'payment') {
					$this->session->data['payment_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());

        //frd 1
        $this->load->model('localisation/district');
        $district = $this->model_localisation_district->getDistrict($this->session->data['payment_address']['district_id']);
        if (isset($district['rajaongkir']['results']['city_name'])){
          $this->session->data['payment_address']['district'] = $district['rajaongkir']['results']['city_name'] . ' - ' . $district['rajaongkir']['results']['type'];
        } else {
          $this->session->data['payment_address']['district'] = '';
        }
        //---

      
				}

				if ($this->config->get('config_tax_customer') == 'shipping') {
					$this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());

        //frd 2
        $this->load->model('localisation/district');
        $district = $this->model_localisation_district->getDistrict($this->session->data['shipping_address']['district_id']);
        if (isset($district['rajaongkir']['results']['city_name'])){
          $this->session->data['shipping_address']['district'] = $district['rajaongkir']['results']['city_name'] . ' - ' . $district['rajaongkir']['results']['type'];
        } else {
          $this->session->data['shipping_address']['district'] = '';
        }
        //---
      
				}


				$this->response->redirect($this->url->link('account/account', '', 'SSL'));
			}
		}

		if ($this->customer->isLogged()) {
			
                $this->load->model('catalog/product');
                $seller_id  = 0;
                $product_info_ = $this->model_catalog_product->getCekChattingSellerID($this->customer->getId());

		        if ($product_info_) {		
             	    $seller_id = $product_info_['seller_id'];
				
		        }   	  
               				
				//$this->response->redirect($this->url->link('information/information','information_id=24', 'SSL'));
				 $this->response->redirect($this->url->link('account/account', '', 'SSL'));
				//$this-> AksesKey();
				
			
		}

		$this->load->language('account/login');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			// Trigger customer pre login event
			$this->event->trigger('pre.customer.login');

			// Unset guest
			unset($this->session->data['guest']);

			// Default Shipping Address
			$this->load->model('account/address');

			if ($this->config->get('config_tax_customer') == 'payment') {
				$this->session->data['payment_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());

        //frd 1
        $this->load->model('localisation/district');
        $district = $this->model_localisation_district->getDistrict($this->session->data['payment_address']['district_id']);
        if (isset($district['rajaongkir']['results']['city_name'])){
          $this->session->data['payment_address']['district'] = $district['rajaongkir']['results']['city_name'] . ' - ' . $district['rajaongkir']['results']['type'];
        } else {
          $this->session->data['payment_address']['district'] = '';
        }
        //---

      
			}

			if ($this->config->get('config_tax_customer') == 'shipping') {
				$this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());

        //frd 2
        $this->load->model('localisation/district');
        $district = $this->model_localisation_district->getDistrict($this->session->data['shipping_address']['district_id']);
        if (isset($district['rajaongkir']['results']['city_name'])){
          $this->session->data['shipping_address']['district'] = $district['rajaongkir']['results']['city_name'] . ' - ' . $district['rajaongkir']['results']['type'];
        } else {
          $this->session->data['shipping_address']['district'] = '';
        }
        //---
      
			}

			// Wishlist
			if (isset($this->session->data['wishlist']) && is_array($this->session->data['wishlist'])) {
				$this->load->model('account/wishlist');

				foreach ($this->session->data['wishlist'] as $key => $product_id) {
					$this->model_account_wishlist->addWishlist($product_id);

					unset($this->session->data['wishlist'][$key]);
				}
			}

			// Add to activity log
			$this->load->model('account/activity');

			$activity_data = array(
				'customer_id' => $this->customer->getId(),
				'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
			);

			$this->model_account_activity->addActivity('login', $activity_data);

			// Trigger customer post login event
			$this->event->trigger('post.customer.login');

			// Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
			if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['redirect'], $this->config->get('config_ssl')) !== false)) {
				//$this->response->redirect(str_replace('&amp;', '&', $this->request->post['redirect']));
			} else {
				//$this->response->redirect($this->url->link('account/account', '', 'SSL'));
                $this->load->model('catalog/product');
                $seller_id  = 0;
                $product_info_ = $this->model_catalog_product->getCekChattingSellerID($this->customer->getId());

		        if ($product_info_) {		
             	    $seller_id = $product_info_['seller_id'];
				
		        }   

				
				
	              //$this->response->redirect($this->url->link('information/information','information_id=24', 'SSL'));
				
					
			   
			      $this->response->redirect($this->url->link('account/account', '', 'SSL'));
			   			
								
			}
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

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_login'),
			'href' => $this->url->link('account/login', '', 'SSL')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_new_customer'] = $this->language->get('text_new_customer');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_register_account'] = $this->language->get('text_register_account');
		$data['text_returning_customer'] = $this->language->get('text_returning_customer');
		$data['text_i_am_returning_customer'] = $this->language->get('text_i_am_returning_customer');
		$data['text_forgotten'] = $this->language->get('text_forgotten');

		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_password'] = $this->language->get('entry_password');

		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_login'] = $this->language->get('button_login');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['action'] = $this->url->link('account/login', '', 'SSL');
		$data['register'] = $this->url->link('account/register', '', 'SSL');
		$data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');

		// Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
		if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['redirect'], $this->config->get('config_ssl')) !== false)) {
			$data['redirect'] = $this->request->post['redirect'];
		} elseif (isset($this->session->data['redirect'])) {
			$data['redirect'] = $this->session->data['redirect'];

			unset($this->session->data['redirect']);
		} else {
			$data['redirect'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/login.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/login.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/login.tpl', $data));
		}
	}
	
	protected function validate() {
		
		//$this-> AksesKey();
		$this->event->trigger('pre.customer.login');

		// Check how many login attempts have been made.
		$login_info = $this->model_account_customer->getLoginAttempts($this->request->post['email']);

		//if ($login_info && ($login_info['total'] >= $this->config->get('config_login_attempts')) && strtotime('-1 hour') < strtotime($login_info['date_modified'])) {
		//	$this->error['warning'] = $this->language->get('error_attempts');
		//}


		// Check if customer has been approved.
		$customer_info = $this->model_account_customer->getCustomerByEmail($this->request->post['email']);

		if ($customer_info && !$customer_info['approved']) {
			$this->error['warning'] = $this->language->get('error_approved');
		}

		if (!$this->error) {
			if (!$this->customer->login($this->request->post['email'], $this->request->post['password'])) {
				$this->error['warning'] = $this->language->get('error_login');

				$this->model_account_customer->deleteLoginAttempts($this->request->post['email']);
			} else {
				$this->customer->login($this->request->post['email'], $this->request->post['password']);
				$this->model_account_customer->addLoginAttempt($this->request->post['email']);
	            $is_partner = 0;
				
                $this->load->model('account/customer');         
		        $customer_ispartner = $this->model_account_customer->getIsPartner($this->customer->getId());	
					$linktarget = '';				
					if ( $customer_ispartner['is_partner'] == 0 ) {	
					  $is_partner = 0;
					  $linktarget = "https://$_SERVER[HTTP_HOST]/customer/apps";
					} elseif ( $customer_ispartner['is_partner'] == 1 ) {	
					   $is_partner = 1;
						$linktarget = "https://$_SERVER[HTTP_HOST]/seller/apps";
					} elseif ( $customer_ispartner['is_partner'] == 2 ) {	
					   $is_partner = 2;
						$linktarget = "https://$_SERVER[HTTP_HOST]/transporter/apps";
				    } elseif ( $customer_ispartner['is_partner'] == 3 ) {	
					   $is_partner = 3;
						$linktarget = "https://$_SERVER[HTTP_HOST]/brand/apps";
					}
					
									
				$this->load->model('account/customer');
				$check_id = $this->model_account_customer->getFromUserIdMember($this->request->post['email']);
											

				$from_useridX_m = 0;
				if ($check_id) {		
					$from_useridX_m = $check_id['from_userid'];

				}		

				$this->load->model('account/customer');
				$check_id = $this->model_account_customer->getIsIP($this->request->post['email']);
											

				$ipX = '';
				if ($check_id) {		
					$ipX = $check_id['ip'];

				}				
			
	
	
				$this->load->model('account/customer');        
				$linkweb = "https://$_SERVER[HTTP_HOST]/index.php?route=information/information&information_id=24";
				$user_email = $this->request->post['email'];
				$user_emailseller = '';
				$from_userid = $this->customer->getId();
				$chat_id = 0;		
				$to_userid = 0;
				//$from_useridX_m = 0;
				$to_useridX_m = 0;
			
				$session_infoX = $this->model_account_customer->getSessionLink($linkweb,$user_email,$user_emailseller,$from_userid,$to_userid,$chat_id,$from_useridX_m,$to_useridX_m,$linktarget,$ipX);
                if (!$session_infoX) {
					$this->error['warning'] = 'User ini sudah aktif diperangkat lain, sebaiknya lakukan logout terlebih dahulu diperangkat tesebut..!';
				} else {
					
					$this->load->model('account/customer');

					$akses = $_COOKIE['PHPSESSID'];
					$sessionXyz = $this->model_account_customer->set($akses,$from_useridX_m,$user_email,$is_partner);		
					
					$setTest=$from_useridX_m;
					$this->model_account_customer->setTest($setTest,$from_useridX_m,$user_email);	
					 
					 
					//$this-> AksesKeyClear(); 
				} 
				
		    
			}
		}
		
		
        
		return !$this->error;
	}

	

	//public function AksesKeyClear() {
		
		//echo '<script> localStorage.clear() </script>';
		
		
	//}


}
