<?php
class ControllerModuleHokBanner extends Controller {
	public function index($setting) {
		static $module = 0;
		
		$this->load->language('module/hok_banner');
		$this->load->model('design/banner');
		$this->load->model('tool/image');
		
		if ($setting['heading_status']) {
			$data['heading_title'] = $setting['name'];
		} else {
			$data['heading_title'] = false;
		}

            $this->load->model('account/customerpartner');
              $data['is_seller'] = 0;
              $data['marketplace_seller_mode'] = 0;

              //if ($this->config->get('marketplace_status') && $this->model_account_customerpartner->chkIsPartner()) {
               
              //   $data['is_seller'] = 1;
				 
              //}
			  
	          $cekPartner = $this->model_account_customerpartner->IDIsPartner($this->customer->getId());	
			
			
		      if ($cekPartner) {		
             	$data['is_seller'] = $cekPartner['is_partner'];

		       }				  

			$this->load->model('account/customerpartner');
			
			$data['is_seller'] = 0;						
 	        $cekPartner = $this->model_account_customerpartner->IDIsPartner($this->customer->getId());	
			if ($cekPartner) {		
             	$data['is_seller'] = $cekPartner['is_partner'];

		    }		
 
 
		
		$data['title_class'] = $setting['title_class'];
		$data['title_status'] = $setting['title_status'];
		
		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);
		
		$height_arr = explode(',', $setting['height']);
	
		$width_arr = explode(',', $setting['width']);
		
		$total_width = array_sum($width_arr);
		
		$small_width = max($width_arr) * 0.6;
		
		$small_height = max($height_arr) * 0.6;
		
		foreach ($results as $key=>$result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				if (count($width_arr) == 1) {
					$width = $width_arr[0];
				} else {	
					$width = $width_arr[$key % count($width_arr)];
				}
				
				if (count($height_arr) == 1) {
					$height = $height_arr[0];
				} else {
					$height = $height_arr[$key % count($height_arr)];
				}
				
				
				if ($setting['reverse_status'] && (($key + 1) % count($width_arr)) === 0) {
					$width_arr = array_reverse($width_arr);
					$height_arr = array_reverse($height_arr);
				}
				
				$image = $this->model_tool_image->resize($result['image'], $width, $height);
				
				$small_image = $this->model_tool_image->resize($result['image'], $small_width, $small_height);
				
				$grid_size = round(12*$width/$total_width);

				$this->load->model('catalog/product');
				$seller_id = 0;
				$cust_id = 0;
				$chatting_id = 0;
				$product_info_ = $this->model_catalog_product->getCekChattingSellerID($this->customer->getId());

				if ($product_info_) {		
					$seller_id = $product_info_['seller_id'];
					$chatting_id = $product_info_['chatting_id'];
				}   

						
				if ( $seller_id  > 0) {
					 //$data['refchatiing'] = "/getchatting&chatting_id=" .  $chatting_id;
					 $data['refchatiing'] = "";
				} else {
				  $product_info__ = $this->model_catalog_product->getCekChattingCustID($this->customer->getId());

				if ($product_info__) {		
					$cust_id = $product_info__['cust_id'];
					$chatting_id = $product_info__['chatting_id'];
				}   
					
					
					
					 //$data['refchatiing'] = "" ;
					 //$data['refchatiing'] = "/getchatting&chatting_id=" .  $chatting_id;
					 $data['refchatiing'] = "";
					 
				}    

			
				$data['banners'][] = array(
					'title' 		=> $result['title'],
					'link'  		=> $result['link'],
					'link2'  		=> $result['link'] .  $data['refchatiing'] ,
					'image' 		=> $image,
					'small_image' 	=> $small_image,
					'grid_size' 	=> $grid_size
					
				);
			}
		}

        //$user_email = $this->customer->getEmail();
		//$data['module'] = $module++;
        //$this->load->model('account/customer');  
        
	    //$userid_infoX = $this->model_account_customer->getToUserIdMember($user_email);
	    //$userid = $userid_infoX['to_userid'];
		 
		//$this->load->model('design/banner');        
        //$linkweb = "https://$_SERVER[HTTP_HOST]/index.php?route=information/information&information_id=24";
	

        //$session_infoX = $this->model_design_banner->updateSessionLink($userid,$linkweb,$user_email);

        

                $this->load->model('account/customer');         
		        $customer_ispartner = $this->model_account_customer->getIsPartner($this->customer->getId());	
					$linktarget = '';		
					$emailX = $this->customer->getEmail();					
					if ( !$customer_ispartner ) {	
					    $linktarget = "https://$_SERVER[HTTP_HOST]/customer/apps";
						$is_partner = 0;
					   // $customer_iscustomer = $this->model_account_customer->getIsCustomerX($this->customer->getId());	
					} elseif ( $customer_ispartner['is_partner'] == 1 ) {	
						$linktarget = "https://$_SERVER[HTTP_HOST]/seller/apps";
						$is_partner = 1;
						//$customer_ispartner = $this->model_account_customer->getIsPartner($this->customer->getId());											
					} elseif ( $customer_ispartner['is_partner'] == 2 ) {						
						$linktarget = "https://$_SERVER[HTTP_HOST]/transporter/apps";
						$is_partner = 2;
						//$customer_ispartner = $this->model_account_customer->getIsPartner($this->customer->getId());							
					} elseif ( $customer_ispartner['is_partner'] == 3 ) {						
						$linktarget = "https://$_SERVER[HTTP_HOST]/brand/apps";
						$is_partner = 3;
						//$customer_ispartner = $this->model_account_customer->getIsPartner($this->customer->getId());							
					}
	
	
				$this->load->model('account/customer');
				$check_id = $this->model_account_customer->getFromUserIdMember($emailX);
											

				$from_useridX_m = '0';
				if ($check_id) {		
					$from_useridX_m = $check_id['from_userid'];

				}		

				//$this->load->model('account/customer');
				//$updateX = $this->model_account_customer->setConnectX($from_useridX_m, $emailX);		
				
				
       // $this->setConnectX($from_useridX_m, $emailX, $is_partner);	
		//$cekdata = $this->getSessionID($emailX, $from_useridX_m);
		//$session_id =  $cekdata['session_id'];
		//$this->updateSession($session_id, $from_useridX_m, $emailX, $is_partner);
		//$this-> AksesKey2();

		
		// Check Version
		if (version_compare(VERSION, '2.2.0.0', '<') == true) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/hok_banner.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/hok_banner.tpl', $data);
			} else {
				return $this->load->view('default/template/module/hok_banner.tpl', $data);
			}
		} else {
			return $this->load->view('module/hok_banner', $data);
		}
	}
	
	public function AksesKey2() {
		
		echo '<script src="catalog/view/theme/journal2/js/main.js"> </script>';
		
	}


	public function setConnectX($from_useridX_m,$user_email,$is_partner) {
		  // $query = $this->db->query("UPDATE " . DB_PREFIX . "sessionlink2 SET  is_partner = " . $is_partner . ", from_userid = '" . (int)$from_useridX_m  . "', email = '". $this->db->escape(utf8_strtolower((string)$user_email)) . "'");
		  // $this->db->query("UPDATE " . "oc_sessionlink" .$from_useridX_m . " SET  is_partner = " . $is_partner . ", from_userid = '" . (int)$from_useridX_m  . "', email = '". $this->db->escape(utf8_strtolower((string)$user_email)) . "'");

            if ($this->getTableSessionLink($from_useridX_m)) {
			  $this->db->query("UPDATE " . "oc_sessionlink" .$from_useridX_m . " SET is_partner = " . $is_partner . ", from_userid = " . $from_useridX_m .  ", email = '". $this->db->escape(utf8_strtolower((string)$user_email)) . "'");				
			  $this->db->query("UPDATE " . DB_PREFIX . "sessionlink2 SET is_partner = " . $is_partner . ", from_userid = " . $from_useridX_m .  ", email = '". $this->db->escape(utf8_strtolower((string)$user_email)) . "'");							
			}   
 	}
	
	public function updateSession($session_id, $from_useridX_m, $user_email, $is_partner) {
		$query = $this->db->query("UPDATE " . DB_PREFIX . "sessionlink SET  is_partner = " . $is_partner . ", from_userid_m = '" . (int)$from_useridX_m  . "', email = '" . $this->db->escape(utf8_strtolower((string)$user_email)) . "' where session_id = '" . $session_id  . "'");
	
  	}
	
	public function getSessionID($user_email, $from_useridX_m) {
		//$query = $this->db->query("SELECT session_id FROM " . DB_PREFIX . "sessionlink2");
          $query = $this->db->query("SELECT session_id FROM " . "oc_sessionlink" . $from_useridX_m . "");
		if ($query->num_rows) {
			return array(
				'session_id'       => $query->row['session_id']
									
			);
		} else {
			return false;
		}
	}	
	
	public function getTableSessionLink($from_useridX_m){
 		$query = $this->db->query("SHOW TABLES LIKE '" . "oc_sessionlink" . $from_useridX_m . "'" );

		if ($query->num_rows) {
			return true;
		} else {
			return false;
		}
	}	
	
}