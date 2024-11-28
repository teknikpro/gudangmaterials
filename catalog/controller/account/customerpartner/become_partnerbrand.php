<?php
class ControllerAccountCustomerpartnerBecomePartnerbrand extends Controller {

	private $error = array();
	private $data = array();


	public function index() {

		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/customerpartner/become_partnerbrand', '', 'SSL');
			$this->response->redirect($this->url->link('account/register', '', 'SSL'));
		}

		$this->language->load('account/customerpartner/become_partnerbrand');

		$this->document->setTitle($this->language->get('heading_title'));
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['error_warning_authenticate'] = $this->language->get('error_warning_authenticate');

		$this->load->model('account/customerpartner');

		//if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			//$country_id = $this->model_account_customerpartner->CustomerCountry_Id($this->customer->getId());

			//if (empty($country_id)) {

				//$this->model_account_customerpartner->becomePartnerbrand($this->request->post['shoppartner'],$customer_country_id='',$this->customer->getId(),$this->request->post['description']);
			//}else{

				//$this->model_account_customerpartner->becomePartnerbrand($this->request->post['shoppartner'],$country_id['country_id'],$this->customer->getId(),$this->request->post['description']);

			//}
            //$this->session->data['success'] = $this->language->get('text_success');
			//$this->response->redirect($this->url->link('account/customerpartner/become_partnerbrand', '', 'SSL'));
		//}



		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm2()) {

				$tipe = '1';
				$mitraid = '0';
				
				$jenis_gdm = 'brand';
				$ceksecid =  $this->model_account_customerpartner->GetSec($jenis_gdm);			
				$secid_m = '0';
				if ($ceksecid) {		
						$secid_m = $ceksecid['secid'];
				}		
				
				$jenis_subgdm = '';
				$ceksubsecid =  $this->model_account_customerpartner->GetSubSec($jenis_subgdm);			
				$subsecid_m = '0';
				if ($ceksubsecid) {		
						$subsecid_m = $ceksubsecid['subid'];
												
				}		

			$check_from_userid_m = $this->model_account_customerpartner->GetFromUser_Id($this->customer->getId());
            $from_userid_m = '0';
			$from_userid_m = $check_from_userid_m['from_userid_m'];
			$brand_name = $check_from_userid_m['brand_name'];
	   		   
            $country_id = $this->model_account_customerpartner->CustomerCountry_Id($this->customer->getId());
			if ( !empty($this->request->post['manufacture']) AND !empty($this->request->post['userbrand'])) {
				   
				if (empty($country_id)) {
                  
					$this->model_account_customerpartner->becomePartnerbrand2($this->request->post, $this->request->post['manufacture'],$this->request->post['userbrand'],$from_userid_m, $brand_name, $customer_country_id='',$this->customer->getId(),$this->request->post['description'], $secid_m, $subsecid_m );
				}else{

					$this->model_account_customerpartner->becomePartnerbrand2($this->request->post, $this->request->post['manufacture'],$this->request->post['userbrand'],$from_userid_m, $brand_name, $country_id['country_id'],$this->customer->getId(),$this->request->post['description'], $secid_m, $subsecid_m );
				}
			}else{
				if (empty($country_id)) {

					$this->model_account_customerpartner->becomePartnerbrand($this->request->post, $from_userid_m, $brand_name, $customer_country_id='',$this->customer->getId(),$this->request->post['description'], $secid_m, $subsecid_m );
				}else{
					$this->model_account_customerpartner->becomePartnerbrand($this->request->post, $from_userid_m, $brand_name, $country_id['country_id'],$this->customer->getId(),$this->request->post['description'], $secid_m, $subsecid_m );

					//$this->model_account_customerpartner->becomePartnerbrand($this->request->post['shoppartner'],$country_id['country_id'],$this->customer->getId(),$this->request->post['description']);
				}	
	
			}
			//$this->model_account_customerpartner->becomePartnerbrandX($this->request->post,$from_userid_m);
			
            $this->session->data['success'] = $this->language->get('text_success');
		 	$this->response->redirect($this->url->link('account/customerpartner/become_partnerbrand', '', 'SSL'));
		
		}


      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home','','SSL'),
        	'separator' => false
      	);

		$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', 'SSL'),
        	'separator' => $this->language->get('text_separator')
      	);

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('account/customerpartner/become_partnerbrand', '', 'SSL'),
        	'separator' => $this->language->get('text_separator')
      	);

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$this->data['in_process'] = false;

		$hasApplied = $this->model_account_customerpartner->IsApplyForSellership();

		if($hasApplied){

			if($this->model_account_customerpartner->chkIsPartner())
				//$this->response->redirect($this->url->link('account/customerpartner/dashboard', '', 'SSL'));
			    $this->response->redirect($this->url->link('information/information','information_id=24', 'SSL'));
				
			else{
				$this->data['in_process'] = true;
				$this->data['text_delay'] = $this->language->get('text_delay');
			}

		}else{

			if(isset($this->error['error_shoppartner'])) {
		        $this->data['error_shoppartner'] = $this->error['error_shoppartner'];
		    }else{
				$this->data['error_shoppartner'] = '';
		    }

			if(isset($this->error['error_nama_brand'])) {
		        $this->data['error_nama_brand'] = $this->error['error_nama_brand'];
		    }else{
				$this->data['error_nama_brand'] = '';
		    }

			if (isset($this->error['category'])) {
				$this->data['error_category'] = $this->error['category'];
			} else {
				$this->data['error_category'] = '';
			}

		    if(isset($this->error['error_description'])) {
		        $this->data['error_description'] = $this->error['error_description'];
		    }else{
				$this->data['error_description'] = '';
		    }

		    if(isset($this->request->post['shoppartner'])) {
		        $this->data['shoppartner'] = $this->request->post['shoppartner'];
		    }else{
				$this->data['shoppartner'] = '';
		    }


	        if(isset($this->request->post['nama_brand'])) {
		        $this->data['nama_brand'] = $this->request->post['nama_brand'];
		    }else{
				$this->data['nama_brand'] = '';
		    }

			if(isset($this->request->post['description'])) {
		        $this->data['description'] = $this->request->post['description'];
		    }else{
				$this->data['description'] = '';
		    }
			if(isset($this->request->post['manufacture'])) {
		        $this->data['manufacture'] = $this->request->post['manufacture'];
		    }else{
				$this->data['manufacture'] = '';
		    }
			
			if(isset($this->request->post['userbrand'])) {
		        $this->data['userbrand'] = $this->request->post['userbrand'];
		    }else{
				$this->data['userbrand'] = '';
		    }			




			$this->data['text_say'] = $this->language->get('text_say');
			$this->data['text_shop_name_info'] = $this->language->get('text_shop_name_info');
			$this->data['text_say_info'] = $this->language->get('text_say_info');
			$this->data['error_text'] = $this->language->get('error_text');
			$this->data['text_shop_name'] = $this->language->get('text_shop_name');
			$this->data['text_avaiable'] = $this->language->get('text_avaiable');
			$this->data['text_no_avaiable'] = $this->language->get('text_no_avaiable');
			$this->data['help_nama_brand'] = $this->language->get('help_nama_brand');
			$this->data['help_category'] = $this->language->get('help_category');
			$this->data['entry_nama_brand'] = $this->language->get('entry_nama_brand');
			$this->data['entry_ahli_bidang'] = $this->language->get('entry_ahli_bidang');
			
			$this->data['entry_category'] = $this->language->get('entry_category');
			$this->data['text_addcategory'] = $this->language->get('text_addcategory');
			$this->data['heading_category'] = $this->language->get('heading_category');

			$this->data['entry_category'] = $this->language->get('entry_category');
			$this->data['text_addcategory'] = $this->language->get('text_addcategory');
			$this->data['heading_category'] = $this->language->get('heading_category');
			
			$this->data['entry_manufacture']  = $this->language->get('entry_manufacture');
			$this->data['entry_userbrand']  = $this->language->get('entry_userbrand');
			$this->data['manufacture']      = $this->language->get('manufacture');
			$this->data['userbrand']      = $this->language->get('userbrand');
						
		}



		$this->data['button_continue'] = $this->language->get('button_continue');
		$this->data['button_back'] = $this->language->get('button_back');

		$this->data['action'] = $this->url->link('account/customerpartner/become_partnerbrand', '', 'SSL');
		$this->data['back'] = $this->url->link('account/account', '', 'SSL');

		$this->data['isMember'] = true;

		$this->data['column_left'] = $this->load->controller('common/column_left');
		$this->data['column_right'] = $this->load->controller('common/column_right');
		$this->data['content_top'] = $this->load->controller('common/content_top');
		$this->data['content_bottom'] = $this->load->controller('common/content_bottom');
		$this->data['footer'] = $this->load->controller('common/footer');
		$this->data['header'] = $this->load->controller('common/header');
		
		
		$this->data['button_close'] = $this->language->get('button_close');

		// Categories
		
		$this->load->model('setting/store');
        $this->data['stores'] = $this->model_setting_store->getStores();

        $this->data['marketplace_seller_product_store'] = $this->config->get('marketplace_seller_product_store');

		if (isset($this->request->post['product_store'])) {
			$this->data['product_store'] = $this->request->post['product_store'];
		} elseif (isset($this->request->get['product_id'])) {
			$this->data['product_store'] = $this->model_account_customerpartner->getProductStores($this->request->get['product_id']);
		} else {
			$this->data['product_store'] = array(0);
		}


		if (isset($this->request->post['product_category'])) {
			$categories = $this->request->post['product_category'];
		} elseif (isset($this->request->get['product_id'])) {
			$categories = $this->model_account_customerpartner->getProductCategories($this->request->get['product_id']);
		} else {
			$categories = array();
		}

		$this->data['product_categories'] = array();

		//foreach ($categories as $category_id) {
			//$this->category_info = $this->model_account_customerpartner->getCategory($category_id);

			//if ($category_info) {
				//$this->data['product_categories'][] = array(
					//'category_id' => $category_info['category_id'],
					//'name'        => ($category_info['path'] ? $category_info['path'] . ' &gt; ' : '') . $category_info['name']
				//);
			//}
		//}

		$this->data['product_categories'] = array();

		foreach ($categories as $id_brand) {
			$category_info = $this->model_account_customerpartner->getCategory2($id_brand);

			if ($category_info) {
				$this->data['product_categories'][] = array(
					'id_brand'      => $category_info['id_brand'],
					'name'          => $category_info['name']
				);
			}
		}
		
		
		

      


        //$brand_info = $this->model_account_customerpartner->getBrand();
       // $this->data['nama_brand'] = '';




         //$this->load->model('catalog/product');
		//$product_info = $this->model_catalog_product->getProduct($this->request->get['product_id']);
        //$this->$data['token'] = $this->session->data['token'];


		//$this->load->model('catalog/manufacturer');

		//if (isset($this->request->post['manufacturer_id'])) {
			//$this->$data['manufacturer_id'] = $this->request->post['manufacturer_id'];
		//} elseif (!empty($product_info)) {
			//$this->$data['manufacturer_id'] = $product_info['manufacturer_id'];
		//} else {
			//$this->$data['manufacturer_id'] = 0;
		//}

		
			//$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($product_info['manufacturer_id']);

			//if ($manufacturer_info) {
				//$this->$data['manufacturer'] = $manufacturer_info['name'];
			//} else {
				//$this->$data['manufacturer'] = '';
			//}
		


		// Categories
		//$this->load->model('catalog/category');

		//if (isset($this->request->post['product_category'])) {
			//$categories = $this->request->post['product_category'];
		//} elseif (isset($this->request->get['product_id'])) {
			//$categories = $this->model_catalog_product->getProductCategories($this->request->get['product_id']);
		//} else {
			//$categories = array();
		//}

		//$this->$data['product_categories'] = array();

		//foreach ($categories as $category_id) {
			//$category_info = $this->model_catalog_category->getCategory($category_id);

			//if ($category_info) {
				//$data['product_categories'][] = array(
					//'category_id' => $category_info['category_id'],
					//'name' => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
				//);
			//}
		//}




$this->data['separate_view'] = false;



$this->data['separate_column_left'] = '';

if ($this->config->get('marketplace_separate_view') && isset($this->session->data['marketplace_separate_view']) && $this->session->data['marketplace_separate_view'] == 'separate') {
  $this->data['separate_view'] = true;
  $this->data['column_left'] = '';
  $this->data['column_right'] = '';
  $this->data['content_top'] = '';
  $this->data['content_bottom'] = '';
  $this->data['separate_column_left'] = $this->load->controller('account/customerpartner/column_left');
  $this->data['footer'] = $this->load->controller('account/customerpartner/footer');
  $this->data['header'] = $this->load->controller('account/customerpartner/header');
}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/customerpartner/become_partnerbrand.tpl')) {
			$this->response->setOutput($this->load->view( $this->config->get('config_template') . '/template/account/customerpartner/become_partnerbrand.tpl' , $this->data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/customerpartner/become_partnerbrand.tpl' , $this->data));
		}

	}

	private function validateForm2() {
		
		
		
		//if(utf8_strlen($this->request->post['nama_brand'])<=3){
           // $this->error['error_nama_brand'] = $this->language->get('error_validshop');
        //}elseif(utf8_strlen($this->request->post['description'])<=3){
           // $this->error['error_description'] = $this->language->get('error_message');
        //}else{
            //$this->load->model('customerpartner/master');
            //if(!$this->model_customerpartner_master->getBrandData($this->request->post['nama_brand'])){
                //$this->error['error_nama_brand'] = $this->language->get('error_message');
            //}
        //}


		//if (!$this->error) {
	  		return true;
		//} else {
	  		//return false;
		//}
  	}


	//private function validateForm() {

		//if(utf8_strlen($this->request->post['shoppartner'])<=3){
            //$this->error['error_shoppartner'] = $this->language->get('error_validshop');
        //}elseif(utf8_strlen($this->request->post['description'])<=3){
            //$this->error['error_description'] = $this->language->get('error_message');
        //}else{
            //$this->load->model('customerpartner/master');
            //if($this->model_customerpartner_master->getShopData($this->request->post['shoppartner'])){
                //$this->error['error_shoppartner'] = $this->language->get('error_message');
            //}
        //}

		//if (!$this->error) {
	  		//return true;
		//} else {
	  		//return false;
		//}
  	//}

	public function getcategories(){
		$json = array();

		if (isset($this->request->get['category_id'])) {
			$this->load->model('account/customerpartner');
			
			$results = $this->model_account_customerpartner->getParentCatrgories();
			

			if ($results) {
				$json['categories'] = $results;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
?>
