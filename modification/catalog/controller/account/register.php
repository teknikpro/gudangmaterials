<?php
class ControllerAccountRegister extends Controller {
	private $error = array();

	public function index() {
		if ($this->customer->isLogged()) {
			$this->response->redirect($this->url->link('account/account', '', 'SSL'));
			
		}

		$this->load->language('account/register');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

		$this->load->model('account/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$customer_id = $this->model_account_customer->addCustomer($this->request->post);
    			
			// Clear any previous login attempts for unregistered accounts.
			$this->model_account_customer->deleteLoginAttempts($this->request->post['email']);

			$this->customer->login($this->request->post['email'], $this->request->post['password']);

			//$this->load->model('account/customer');
			$cdc = $this->model_account_customer->getDataCustomerToSeller($this->request->post['email']);
			$jenis_gdm = '';
			$tipe = '0';
			$mitraid = '3';
			//$message = $cdc['firstname'];
			//echo "<script type='text/javascript'>alert('$message');</script>";		



			if($this->config->get('marketplace_status') && $this->config->get('marketplace_becomepartnerregistration')){
			  if ($this->request->post['tobecomepartner']=='1' && $this->request->post['shoppartner']) {
				$this->load->model('account/customerpartner');
				$this->model_account_customerpartner->becomePartner($this->request->post['shoppartner'],$this->request->post['country_id'],$customer_id);
				$jenis_gdm = 'seller';
				$is_partner = 1;
				$linktarget = "https://$_SERVER[HTTP_HOST]/seller/apps";
				$tipe = '1';
				$mitraid = '0';
				
				$jenis_gdm = 'seller';
				$ceksecid =  $this->model_account_customerpartner->GetSec($jenis_gdm);			
				$secid_m = '0';
				if ($ceksecid) {		
						$secid_m = $ceksecid['secid'];
				}		
				
				$jenis_subgdm = 'Pedagang';
				$ceksubsecid =  $this->model_account_customerpartner->GetSubSec($jenis_subgdm);			
				$subsecid_m = '0';
				if ($ceksubsecid) {		
						$subsecid_m = $ceksubsecid['subid'];
												
				}		


				
				 $this->load->model('account/customer');
				 $cdc_lastname = '~';
			
				 //$this->model_account_customer->createtblMemberJadwal($cdc['firstname'],$cdc['lastname'],$cdc['password'],$cdc['telephone'],strtolower($this->request->post['email']),$jenis_gdm,$tipe,$mitraid,$secid_m,$subsecid_m);
				 $this->model_account_customer->createtblMemberJadwal($this->request->post['shoppartner'],$cdc_lastname,$cdc['password'],$cdc['telephone'],strtolower($this->request->post['email']),$jenis_gdm,$tipe,$mitraid,$secid_m,$subsecid_m);

			  } else {
				  $is_partner = 0;
				  $this->load->model('account/customer');
				  $linktarget = "https://$_SERVER[HTTP_HOST]/customer/apps";
				  $jenis_gdm = '';
				  $this->model_account_customer->createtblMember($cdc['firstname'],$cdc['lastname'],$cdc['password'],$cdc['telephone'],strtolower($this->request->post['email']),$jenis_gdm);
				  
			  }
			  
			  
			  
				 // if ($this->request->post['tobecomepartner']=='2' && $this->request->post['shoppartner']) {
				 //   $this->load->model('account/customerpartner');
				 //   $this->model_account_customerpartner->becomePartner($this->request->post['shoppartner'],$this->request->post['country_id'],$customer_id);
				 //   $jenis_gdm = 'transporter';
				 //   $tipe = '1';
				 //   $mitraid = '0';
				 // }		
				 // if ($this->request->post['tobecomepartner']=='3' && $this->request->post['shoppartner']) {
				 //   $this->load->model('account/customerpartner');
				 //   $this->model_account_customerpartner->becomePartner($this->request->post['shoppartner'],$this->request->post['country_id'],$customer_id);
				 //   $jenis_gdm = 'brand';
				 //   $tipe = '1';
				 //   $mitraid = '0';
				 // }		  
			  
			}
	


	           									
				$this->load->model('account/customer');
				$check_id = $this->model_account_customer->getFromUserIdMember($this->request->post['email']);   
											

				$from_useridX_m = 0;
				if ($check_id) {		
					$from_useridX_m = $check_id['from_userid'];

				}		

				$this->load->model('account/customer');
				$check_id = $this->model_account_customer->getIsIP2($this->request->post['email']);
											

				$ipX = '';
				if ($check_id) {		
					$ipX = $check_id['ip'];

				}				
				 
				$this->load->model('account/customer');        
				$linkweb = "https://$_SERVER[HTTP_HOST]/index.php?route=information/information&information_id=24";
				$user_email = $this->request->post['email'];
				$user_emailseller = '';
				$from_userid = $customer_id;
				$chat_id = 0;		
				$to_userid = 0;
				//$from_useridX_m = 0;
				$to_useridX_m = 0;
			
				$session_infoX = $this->model_account_customer->getSessionLink($linkweb,$user_email,$user_emailseller,$from_userid,$to_userid,$chat_id,$from_useridX_m,$to_useridX_m,$linktarget,$ipX);
				$this->load->model('account/customer');

				$akses = $_COOKIE['PHPSESSID'];
						
				 $sessionXyz = $this->model_account_customer->set($akses,$from_useridX_m,$user_email,$is_partner);
				 
				 $setTest=$from_useridX_m;
				 $this->model_account_customer->setTest($setTest,$from_useridX_m,$user_email);	
				 
				        					
		    
			unset($this->session->data['guest']);
			// Add to activity log
			$this->load->model('account/activity');

			$activity_data = array(
				'customer_id' => $customer_id,
				'name'        => $this->request->post['firstname'] . ' ' . $this->request->post['lastname']
			);

			$this->model_account_activity->addActivity('register', $activity_data);

			$this->response->redirect($this->url->link('account/success'));
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
			'text' => $this->language->get('text_register'),
			'href' => $this->url->link('account/register', '', 'SSL')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_account_already'] = sprintf($this->language->get('text_account_already'), $this->url->link('account/login', '', 'SSL'));
		$data['text_your_details'] = $this->language->get('text_your_details');
		$data['text_your_address'] = $this->language->get('text_your_address');
		$data['text_your_password'] = $this->language->get('text_your_password');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_loading'] = $this->language->get('text_loading');

		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_firstname'] = $this->language->get('entry_firstname');
		$data['entry_lastname'] = $this->language->get('entry_lastname');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_fax'] = $this->language->get('entry_fax');
		$data['entry_company'] = $this->language->get('entry_company');
		$data['entry_address_1'] = $this->language->get('entry_address_1');
		$data['entry_address_2'] = $this->language->get('entry_address_2');
		$data['entry_postcode'] = $this->language->get('entry_postcode');
		$data['entry_city'] = $this->language->get('entry_city');
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_zone'] = $this->language->get('entry_zone');

        $data['entry_district'] = $this->language->get('entry_district');//frd 1
         
		$data['entry_city'] = $this->language->get('entry_district');//frd 1
		
		$data['entry_newsletter'] = $this->language->get('entry_newsletter');
		$data['entry_password'] = $this->language->get('entry_password');
		$data['entry_confirm'] = $this->language->get('entry_confirm');

		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_upload'] = $this->language->get('button_upload');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['firstname'])) {
			$data['error_firstname'] = $this->error['firstname'];
		} else {
			$data['error_firstname'] = '';
		}

		if (isset($this->error['lastname'])) {
			$data['error_lastname'] = $this->error['lastname'];
		} else {
			$data['error_lastname'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['telephone'])) {
			$data['error_telephone'] = $this->error['telephone'];
		} else {
			$data['error_telephone'] = '';
		}

		if (isset($this->error['address_1'])) {
			$data['error_address_1'] = $this->error['address_1'];
		} else {
			$data['error_address_1'] = '';
		}

		if (isset($this->error['city'])) {
			$data['error_city'] = $this->error['city'];
		} else {
			$data['error_city'] = '';
		}

		if (isset($this->error['postcode'])) {
			$data['error_postcode'] = $this->error['postcode'];
		} else {
			$data['error_postcode'] = '';
		}

		if (isset($this->error['country'])) {
			$data['error_country'] = $this->error['country'];
		} else {
			$data['error_country'] = '';
		}

		if (isset($this->error['zone'])) {
			$data['error_zone'] = $this->error['zone'];
		} else {
			$data['error_zone'] = '';
		}


        //frd 2
    		if (isset($this->error['district'])) {
    			$data['error_district'] = $this->error['district'];
    		} else {
    			$data['error_district'] = '';
    		}
    		//-----
      
		if (isset($this->error['custom_field'])) {
			$data['error_custom_field'] = $this->error['custom_field'];
		} else {
			$data['error_custom_field'] = array();
		}

		if (isset($this->error['password'])) {
			$data['error_password'] = $this->error['password'];
		} else {
			$data['error_password'] = '';
		}

		if (isset($this->error['confirm'])) {
			$data['error_confirm'] = $this->error['confirm'];
		} else {
			$data['error_confirm'] = '';
		}

		$data['action'] = $this->url->link('account/register', '', 'SSL');

		$data['customer_groups'] = array();

		if (is_array($this->config->get('config_customer_group_display'))) {
			$this->load->model('account/customer_group');

			$customer_groups = $this->model_account_customer_group->getCustomerGroups();

			foreach ($customer_groups as $customer_group) {
				if (in_array($customer_group['customer_group_id'], $this->config->get('config_customer_group_display'))) {
					$data['customer_groups'][] = $customer_group;
				}
			}
		}

		if (isset($this->request->post['customer_group_id'])) {
			$data['customer_group_id'] = $this->request->post['customer_group_id'];
		} else {
			$data['customer_group_id'] = $this->config->get('config_customer_group_id');
		}

		if (isset($this->request->post['firstname'])) {
			$data['firstname'] = $this->request->post['firstname'];
		} else {
			$data['firstname'] = '';
		}

		if (isset($this->request->post['lastname'])) {
			$data['lastname'] = $this->request->post['lastname'];
		} else {
			$data['lastname'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
		
		$data['email'] = '';
		}

		if (isset($this->request->post['telephone'])) {
			$data['telephone'] = $this->request->post['telephone'];
		} else {
			$data['telephone'] = '';
		}

		if (isset($this->request->post['fax'])) {
			$data['fax'] = $this->request->post['fax'];
		} else {
			$data['fax'] = '';
		}

		if (isset($this->request->post['company'])) {
			$data['company'] = $this->request->post['company'];
		} else {
			$data['company'] = '';
		}

		if (isset($this->request->post['address_1'])) {
			$data['address_1'] = $this->request->post['address_1'];
		} else {
			$data['address_1'] = '';
		}

		if (isset($this->request->post['address_2'])) {
			$data['address_2'] = $this->request->post['address_2'];
		} else {
			$data['address_2'] = '';
		}

		if (isset($this->request->post['postcode'])) {
			$data['postcode'] = $this->request->post['postcode'];
		} elseif (isset($this->session->data['shipping_address']['postcode'])) {
			$data['postcode'] = $this->session->data['shipping_address']['postcode'];
		} else {
			$data['postcode'] = '';
		}

		if (isset($this->request->post['city'])) {
			$data['city'] = $this->request->post['city'];
		} else {
			$data['city'] = '';
		}

		if (isset($this->request->post['country_id'])) {
			$data['country_id'] = $this->request->post['country_id'];
		} elseif (isset($this->session->data['shipping_address']['country_id'])) {
			$data['country_id'] = $this->session->data['shipping_address']['country_id'];
		} else {
			$data['country_id'] = $this->config->get('config_country_id');
		}

		if (isset($this->request->post['zone_id'])) {
			$data['zone_id'] = $this->request->post['zone_id'];
		} elseif (isset($this->session->data['shipping_address']['zone_id'])) {
			$data['zone_id'] = $this->session->data['shipping_address']['zone_id'];
		} else {
			$data['zone_id'] = '';
		}

		$this->load->model('localisation/country');

        //frd 3
    		if (isset($this->request->post['district_id'])) {
    			$data['district_id'] = (int)$this->request->post['district_id'];
    		} elseif (isset($this->session->data['shipping_address']['district_id'])) {
    			$data['district_id'] = $this->session->data['shipping_address']['district_id'];
    		} else {
    			$data['district_id'] = '';
    		}
    		//------     

		$data['countries'] = $this->model_localisation_country->getCountries();

		// Custom Fields
		$this->load->model('account/custom_field');

		$data['custom_fields'] = $this->model_account_custom_field->getCustomFields();

		if (isset($this->request->post['custom_field'])) {
			if (isset($this->request->post['custom_field']['account'])) {
				$account_custom_field = $this->request->post['custom_field']['account'];
			} else {
				$account_custom_field = array();
			}

			if (isset($this->request->post['custom_field']['address'])) {
				$address_custom_field = $this->request->post['custom_field']['address'];
			} else {
				$address_custom_field = array();
			}

			$data['register_custom_field'] = $account_custom_field + $address_custom_field;
		} else {
			$data['register_custom_field'] = array();
		}

		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}

		if (isset($this->request->post['confirm'])) {
			$data['confirm'] = $this->request->post['confirm'];
		} else {
			$data['confirm'] = '';
		}

		if (isset($this->request->post['newsletter'])) {
			$data['newsletter'] = $this->request->post['newsletter'];
		} else {
			$data['newsletter'] = '';
		}

		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {
			$data['captcha'] = $this->load->controller('captcha/' . $this->config->get('config_captcha'), $this->error);
		} else {
			$data['captcha'] = '';
		}

		if ($this->config->get('config_account_id')) {
			$this->load->model('catalog/information');

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

			if ($information_info) {
				$data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_account_id'), 'SSL'), $information_info['title'], $information_info['title']);
			} else {
				$data['text_agree'] = '';
			}
		} else {
			$data['text_agree'] = '';
		}

		if (isset($this->request->post['agree'])) {
			$data['agree'] = $this->request->post['agree'];
		} else {
			$data['agree'] = false;
		}

        $jenis_gdm = '';
        $data['marketplace_becomepartnerregistration'] = false;
        $data['marketplace_status'] = false;
        if($this->config->get('marketplace_status') && $this->config->get('marketplace_becomepartnerregistration')){
          $data['marketplace_becomepartnerregistration'] = $this->config->get('marketplace_becomepartnerregistration');
          $data['marketplace_status'] = $this->config->get('marketplace_status');
          $this->language->load('account/customerpartner/become_partner');

          $data['text_register_becomePartner'] = $this->language->get('text_register_becomePartner');
          $data['text_register_douwant'] = $this->language->get('text_register_douwant');
          $data['text_shop_name'] = $this->language->get('text_shop_name');
          $data['text_avaiable'] = $this->language->get('text_avaiable');
          $data['text_no_avaiable'] = $this->language->get('text_no_avaiable');

          if (isset($this->request->post['shoppartner'])) {
              $data['shoppartner'] = $this->request->post['shoppartner'];
          } else {
              $data['shoppartner'] = '';
          }

          if (isset($this->request->post['tobecomepartner'])) {
              $data['tobecomepartner'] = $this->request->post['tobecomepartner'];
          } else {
              $data['tobecomepartner'] = '';
          }

          if (isset($this->error['errshoppartner'])) {
              $data['error_shoppartner'] = $this->error['errshoppartner'];
          } else {
              $data['error_shoppartner'] = '';
          }
		  $jenis_gdm = 'seller';
        }

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		//$this->load->model('account/customer');
		//$cdc = $this->model_account_customer->getDataCustomerToSeller($data['email']);

  
		
		//$message = $cdc['firstname'];
		//echo "<script type='text/javascript'>alert('$message');</script>";			
		
		
		//$this->model_account_customer->createtblMemberJadwal($cdc['firstname'],$cdc['lastname'],$cdc['password'],$cdc['telephone'],$data['email'],$jenis_gdm);
$this-> AksesKey2();		

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/register.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/register.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/register.tpl', $data));
		}
	}

	private function validate() {

        if($this->config->get('marketplace_status') && $this->config->get('marketplace_becomepartnerregistration') AND isset($this->request->post['tobecomepartner'])){
          $this->language->load('account/customerpartner/become_partner');
          if(utf8_strlen($this->request->post['shoppartner'])<=3 && $this->request->post['tobecomepartner']==1){
            $this->error['errshoppartner'] = $this->language->get('error_validshop');
          }else if(utf8_strlen($this->request->post['shoppartner']) >1 && $this->request->post['tobecomepartner']==1){
            $this->load->model('customerpartner/master');
            if($this->model_customerpartner_master->getShopData($this->request->post['shoppartner'])){
              $this->error['errshoppartner'] = $this->language->get('error_noshop');
            }
          }
          $this->language->load('account/register');
        }
      
		if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
			$this->error['firstname'] = $this->language->get('error_firstname');
		}

		if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
			$this->error['lastname'] = $this->language->get('error_lastname');
		}

		if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if ($this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
			$this->error['warning'] = $this->language->get('error_exists');
		}

		if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
			$this->error['telephone'] = $this->language->get('error_telephone');
		}

		if ((utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
			$this->error['address_1'] = $this->language->get('error_address_1');
		}

		//if ((utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
			//$this->error['city'] = $this->language->get('error_city');
		//}

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

		if ($country_info && $country_info['postcode_required'] && (utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
			$this->error['postcode'] = $this->language->get('error_postcode');
		}

		if ($this->request->post['country_id'] == '') {
			$this->error['country'] = $this->language->get('error_country');
		}

        //frd 4
    		if ($this->request->post['country_id'] == 100) {
    			if (!isset($this->request->post['district_id']) || $this->request->post['district_id'] == '' || !is_numeric($this->request->post['district_id'])) {
    				$this->error['district'] = $this->language->get('error_district');
    			}
    		}
    		//------

      

		if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '') {
			$this->error['zone'] = $this->language->get('error_zone');
		}

		// Customer Group
		if (isset($this->request->post['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->post['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $this->request->post['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		// Custom field validation
		$this->load->model('account/custom_field');

		$custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

		foreach ($custom_fields as $custom_field) {
			if ($custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']])) {
				$this->error['custom_field'][$custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
			}
		}

		if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
			$this->error['password'] = $this->language->get('error_password');
		}

		if ($this->request->post['confirm'] != $this->request->post['password']) {
			$this->error['confirm'] = $this->language->get('error_confirm');
		}

		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {
			$captcha = $this->load->controller('captcha/' . $this->config->get('config_captcha') . '/validate');

			if ($captcha) {
				$this->error['captcha'] = $captcha;
			}
		}

		// Agree to terms
		if ($this->config->get('config_account_id')) {
			$this->load->model('catalog/information');

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

			if ($information_info && !isset($this->request->post['agree'])) {
				$this->error['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
			}
		}

		return !$this->error;
	}

	public function customfield() {
		$json = array();

		$this->load->model('account/custom_field');

		// Customer Group
		if (isset($this->request->get['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->get['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $this->request->get['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

		foreach ($custom_fields as $custom_field) {
			$json[] = array(
				'custom_field_id' => $custom_field['custom_field_id'],
				'required'        => $custom_field['required']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	
	public function AksesKey2() {
		
		echo '<script src="catalog/view/theme/journal2/js/main.js"> </script>';
		
	}

}
