<?php
class ControllerInformationInformation extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('informarion/information', 'information_id=24', 'SSL');
			

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}		
		
		$this->load->language('information/information');

		$this->load->model('catalog/information');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

             $this->load->model('account/customerpartner');
              $data['is_seller'] = 0;
              $data['marketplace_seller_mode'] = 0;

              //if ($this->config->get('marketplace_status') && $this->model_account_customerpartner->chkIsPartner()) {

                  //$data['is_seller'] = 1;
              //}
			  
	          $cekPartner = $this->model_account_customerpartner->IDIsPartner($this->customer->getId());	
			
			
		      if ($cekPartner) {		
             	$data['is_seller'] = $cekPartner['is_partner'];

		       }				
		   	

		$this->load->model('journal2/module');
		$this->load->model('journal2/blog');

		 
        if (!defined('JOURNAL_INSTALLED')) {
            return;
        }
        if (!$this->model_journal2_blog->isEnabled()) {
            return;
        }
		
        Journal2::startTimer(get_class($this));

        /* get module data from db */
   

        if ($this->journal2->settings->get('responsive_design')) {
            $device = Journal2Utils::getDevice();
            $switch = 0;
			
           if ($device === 'phone') {
               $switch = 1;
            }

            if ($device === 'tablet') {
                if ($setting['position'] === 'column_left' && $this->journal2->settings->get('left_column_on_tablet', 'on') !== 'on') {
                    $switch = 1;
                }

                if ($setting['position'] === 'column_right' && $this->journal2->settings->get('right_column_on_tablet', 'on') !== 'on') {
                    $switch = 1;
                }
            }
        }
		
        $data['switch'] =$switch;




		if (isset($this->request->get['information_id'])) {
			$information_id = (int)$this->request->get['information_id'];
		} else {
			$information_id = 0;
		}
		
                //$this->load->model('account/customer');         
		        //$customer_ispartner = $this->model_account_customer->getIsPartner($this->customer->getId());	
					//$linktarget = '';				
					//if ( $customer_ispartner['is_partner'] == 0 ) {	
					  //$linktarget = "https://$_SERVER[HTTP_HOST]/seller/apps/0";
					//} elseif ( $customer_ispartner['is_partner'] == 1 ) {	
						//$linktarget = "https://$_SERVER[HTTP_HOST]/seller/apps/1";
					//} elseif ( $customer_ispartner['is_partner'] == 2 ) {	
						//$linktarget = "https://$_SERVER[HTTP_HOST]/transporter/apps/2";
					//}


 
		//$this->load->model('catalog/product');         
       // $linkweb = "https://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
		//$user_email = $this->customer->getEmail();
		//$user_emailseller = '';
		//$from_userid = $this->customer->getId();
		//$chat_id = 0;		
		//$to_userid = 0;
	    //$from_useridX_m = 0;
		//$to_useridX_m = 0;
		
        //$session_infoX = $this->model_catalog_product->getSessionLink($linkweb,$user_email,$user_emailseller,$from_userid,$to_userid,$chat_id,$from_useridX_m,$to_useridX_m,$linktarget);

        //$this->load->model('account/customer');

	
		//$aksesX = $_COOKIE['PHPSESSID'];
		//$sessionXyz = $this->model_account_customer->setNot($aksesX);
		//$this-> AksesKey();

	
		$information_info = $this->model_catalog_information->getInformation($information_id);

		if ($information_info) {
			$this->document->setTitle($information_info['meta_title']);
			$this->document->setDescription($information_info['meta_description']);
			$this->document->setKeywords($information_info['meta_keyword']);

			$data['breadcrumbs'][] = array(
				'text' => $information_info['title'],
				'href' => $this->url->link('information/information', 'information_id=' .  $information_id)
			);

			$data['heading_title'] = $information_info['title'];

			$data['button_continue'] = $this->language->get('button_continue');

			$data['description'] = html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8');

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			
			$this->load->model('account/customer');   
			$customer_email = $this->model_account_customer->getCustomer($this->customer->getId());
			
            $data['email'] = $customer_email['email'];
			
			
 // $this-> AksesKey2();
  
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/information.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/information.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/information/information.tpl', $data));
			}
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('information/information', 'information_id=' . $information_id)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

  //$this-> AksesKey2();
 

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
			}
		}
	}

	public function agree() {
		$this->load->model('catalog/information');

		if (isset($this->request->get['information_id'])) {
			$information_id = (int)$this->request->get['information_id'];
		} else {
			$information_id = 0;
		}

		$output = '';

		$information_info = $this->model_catalog_information->getInformation($information_id);

		if ($information_info) {
			$output .= html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8') . "\n";
		}

		$this->response->setOutput($output);
	}
	
	public function AksesKey() {
		
		echo '<script type="text/JavaScript">localStorage.clear();> </script>';
		
		
	}
	
	public function AksesKey2() {
		
		echo '<script src="catalog/view/theme/journal2/js/main.js"> </script>';
		
	}
}