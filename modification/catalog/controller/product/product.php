<?php
class ControllerProductProduct extends Controller {
	private $error = array();

	public function index() {
		
					// if (!$this->customer->isLogged()) {
					// 	$this->session->data['redirect'] = $this->url->link('informarion/information', 'information_id=24', 'SSL');		
					// 	$this->response->redirect($this->url->link('account/login', '', 'SSL'));
					// }

		$scheme = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http";
		$host = $_SERVER['HTTP_HOST'];
		$path = $_SERVER['REQUEST_URI'];

		$product_redirect = $scheme . "://" . $host . $path;
		$this->session->data['product_redirect'] = $product_redirect;

		// add klik
		$parsed_url = parse_url($product_redirect);
		parse_str($parsed_url['query'], $query_params);
		$product_id = isset($query_params['product_id']) ? $query_params['product_id'] : null;
		$tracking = isset($query_params['tracking']) ? $query_params['tracking'] : null;
		if($tracking){

			$this->load->model('affiliate/information');
			$this->model_affiliate_information->addKlik($product_id, $tracking);

		}
					
		$this->load->language('product/product');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
		      
		$this->load->model('catalog/category');

		if (isset($this->request->get['path'])) {
			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path)
					);
				}
			}

			// Set the last category breadcrumb
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category_info) {
				$url = '';

				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}

				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}

				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}

				if (isset($this->request->get['limit'])) {
					$url .= '&limit=' . $this->request->get['limit'];
				}

				$data['breadcrumbs'][] = array(
					'text' => $category_info['name'],
					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url)
				);
			}
		}

		$this->load->model('catalog/manufacturer');

		if (isset($this->request->get['manufacturer_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_brand'),
				'href' => $this->url->link('product/manufacturer')
			);

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

			if ($manufacturer_info) {
				$data['breadcrumbs'][] = array(
					'text' => $manufacturer_info['name'],
					'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url)
				);
			}
		}

		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_search'),
				'href' => $this->url->link('product/search', $url)
			);
		}

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}



                                    $this->load->model('account/customerpartner');

                                    $check_seller = $this->model_account_customerpartner->getProductSellerDetails($this->request->get['product_id']);
									
									$user_emailseller = '';
									if (isset($check_seller['customer_id']) && $check_seller['customer_id']) {
										$user_emailseller = $check_seller['email'];
										$to_useridX = $check_seller['customer_id'];
									}
									
		$this->load->model('account/customer');
		
        $chat_idX = 0;	
		$from_useridX_m = 0;
		$to_useridX_m = 0;
		$to_useridX = 0;
		
        $check_total_user_id = $this->model_account_customer->getIdMemberSeller($user_emailseller);
		
		 //$message = (int)$check_total_user_id['total_user_id'];
		// echo "<script type='text/javascript'>alert('$message');</script>";			
		
		
		if ( (int)$check_total_user_id['total_user_id'] > 0) {		
		    $check_id = $this->model_account_customer->getFromUserIdMember($this->customer->getEmail());
									
            
		    if ($check_id) {		
             	$from_useridX_m = $check_id['from_userid'];

		    }		
		
		    $check_id = $this->model_account_customer->getToUserIdMember($user_emailseller);
									

            
		    if ($check_id) {		
             	$to_useridX_m = $check_id['to_userid'];

		    }				

		    $check_id = $this->model_account_customer->getChatId($from_useridX_m,$to_useridX_m);
									
            	  
		    if ( (int)$check_id['chat_id'] > 0) {		
             	$chat_idX = $check_id['chat_id'];
				 
	            $check_total_chat_id = $this->model_account_customer->getChatIdMessage($chat_idX);
				
					
				
				if ( (int)$check_total_chat_id['total_chat_id'] == 0) {
					$check_id = $this->model_account_customer->getChatId($from_useridX_m,$to_useridX_m); 
					$chat_idX = $check_id['chat_id'];
					$check_id = $this->model_account_customer->createMessage($from_useridX_m,$to_useridX_m,$chat_idX);						
				}
			   // $check_id2 = $this->model_account_customer->createMessage($from_useridX_m,$to_useridX_m,$chat_idX);
                //$chat_idX = $check_id2['chat_id'];				

			} else {
	
				$check_id = $this->model_account_customer->createChatIdMessage($from_useridX_m,$to_useridX_m);	
				//$chat_idX = $check_id['chat_id'];
				$check_id = $this->model_account_customer->getChatId($from_useridX_m,$to_useridX_m); 
				$chat_idX = $check_id['chat_id'];
				$check_id = $this->model_account_customer->createMessage($from_useridX_m,$to_useridX_m,$chat_idX);	

				
          	   				
               // $check_total_chat_id = $this->model_account_customer->getChatIdMessage($chat_idX);
				//if ($check_total_chat_id) {
					// $this->model_account_customer->createMessage($from_useridX_m,$to_useridX_m,$chat_idX) ;				
				//}	
		    }				
        } else {

            $check_data_seller = $this->model_account_customer->getDataCustomerToSeller($user_emailseller);
		
		    //$message = (int)$check_data_seller['firstname'];
			//$message = $check_data_seller['firstname'];
		    //echo "<script type='text/javascript'>alert('$message');</script>";			
		
		    $this->model_account_customer->addMemberToSeller($check_data_seller['firstname'],$check_data_seller['lastname'],$check_data_seller['password'],$check_data_seller['telephone'],$user_emailseller);
		
		}
		  
           // $this->load->model('journal2/product');
        $linktarget = '';
		$linkweb = "https://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
		//$linkweb = "https://gudangmaterials.id/index.php?route=product/product&path=595&product_id=277";
        if ($chat_idX > 0 and $from_useridX_m > 0 and $to_useridX_m > 0) {	
		              $linktarget = "https://gudangmaterials.id/customer/apps/chat-start.html?action=read&chatid=" . $chat_idX  . "&userid=" . $to_useridX_m ;
					  //$linktarget = "https://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
                      
			} else {
				      $linktarget = "https://gudangmaterials.id/customer/apps/";                     
		}             
			
		$user_email = $this->customer->getEmail();
		$from_useridX = $this->customer->getId();
		

		$this->load->model('account/customer');
		$check_id = $this->model_account_customer->getIsIP($this->customer->getEmail());
									

            $ipX = '';
		    if ($check_id) {		
             	$ipX = $check_id['ip'];

		    }						    
		
		
        $session_infoX = $this->model_account_customer->getSessionLink($linkweb,$user_email,$user_emailseller,$from_useridX,$to_useridX,$chat_idX,$from_useridX_m,$to_useridX_m,$linktarget,$ipX);
		


		$this->load->model('catalog/product');

                $this->load->model('journal2/product');
            

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $product_info['name'],
				'href' => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id'])
			);

			$this->document->setTitle($product_info['meta_title']);
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/product', 'product_id=' . $this->request->get['product_id']), 'canonical');
			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

			$data['heading_title'] = $product_info['name'];

			$data['text_select'] = $this->language->get('text_select');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_sku'] = $this->language->get('text_sku');
			$data['text_reward'] = $this->language->get('text_reward');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_stock'] = $this->language->get('text_stock');
			$data['text_discount'] = $this->language->get('text_discount');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_option'] = $this->language->get('text_option');
			$data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$data['text_write'] = $this->language->get('text_write');
			$data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));
			$data['text_note'] = $this->language->get('text_note');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_related'] = $this->language->get('text_related');
			$data['text_payment_recurring'] = $this->language->get('text_payment_recurring');
			$data['text_loading'] = $this->language->get('text_loading');
			$data['text_connect']	=	$this->language->get('text_connect');
            $data['logged'] = $this->customer->isLogged();
			$data['text_login_contact'] = $this->language->get('text_login_contact');
			
			$data['entry_qty'] = $this->language->get('entry_qty');
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_review'] = $this->language->get('entry_review');
			$data['entry_rating'] = $this->language->get('entry_rating');
			$data['entry_good'] = $this->language->get('entry_good');
			$data['entry_bad'] = $this->language->get('entry_bad');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_upload'] = $this->language->get('button_upload');
			$data['button_continue'] = $this->language->get('button_continue');

			$this->language->load('module/marketplace');
			$data['text_ask_admin'] = $this->language->get('text_ask_admin');
			$data['text_ask_question'] = $this->language->get('text_ask_question');
			$data['text_close'] = $this->language->get('text_close');
			$data['text_subject'] = $this->language->get('text_subject');
			$data['text_ask'] = $this->language->get('text_ask');
			$data['text_send'] = $this->language->get('text_send');
			$data['text_error_mail'] = $this->language->get('text_error_mail');
			$data['text_success_mail'] = $this->language->get('text_success_mail');
			$data['text_ask_seller']	=	$this->language->get('text_ask_seller');

			$data['logged'] = $this->customer->isLogged();
			$data['send_mail'] = $this->url->link('account/customerpartner/sendmail','','SSL');
			$data['mail_for'] = '&contact_seller=true';

			$this->load->model('catalog/review');

			$data['tab_description'] = $this->language->get('tab_description');
			$data['tab_attribute'] = $this->language->get('tab_attribute');
			$data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);

			$data['product_id'] = (int)$this->request->get['product_id'];
			$data['manufacturer'] = $product_info['manufacturer'];
			$data['sku'] = $product_info['sku'];
			$data['kategori_dagang'] = $product_info['kategori_dagang'];
			$data['ukuran_unit'] = $product_info['ukuran_unit'];
			$data['location'] = $product_info['location'];

			if (strpos($this->config->get('config_template'), 'journal2') === 0) {
			    $this->load->model('catalog/manufacturer');
			    $data['text_manufacturer'] = $this->language->get('text_manufacturer');
                $manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($product_info['manufacturer_id']);
                if ($manufacturer_info && $manufacturer_info['image'] && $this->journal2->settings->get('manufacturer_image', '0') == '1') {
                    $this->journal2->settings->set('manufacturer_image', 'on');
                    $data['manufacturer_image_width'] = $this->journal2->settings->get('manufacturer_image_width', 100);
                    $data['manufacturer_image_height'] = $this->journal2->settings->get('manufacturer_image_height', 100);
                    $data['manufacturer_image'] = Journal2Utils::resizeImage($this->model_tool_image, $manufacturer_info['image'], $data['manufacturer_image_width'], $data['manufacturer_image_height']);
                    switch ($this->journal2->settings->get('manufacturer_image_additional_text', 'none')) {
                        case 'brand':
                            $data['manufacturer_image_name'] = $product_info['manufacturer'];
                            break;
                        case 'custom':
                            $data['manufacturer_image_name'] = $this->journal2->settings->get('manufacturer_image_custom_text');
                            break;
                    }
                }
			}
            
			$data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$data['model'] = $product_info['model'];
			$data['reward'] = $product_info['reward'];
			$data['points'] = $product_info['points'];
			$data['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');


                if (true && $product_info['quantity'] <= 0) {
                    $data['stock_status'] = 'outofstock';
                }
                if (true && $product_info['quantity'] > 0) {
                    $data['stock_status'] = 'instock';
                }
                $data['labels'] = $this->model_journal2_product->getLabels($product_info['product_id']);
            
			if ($product_info['quantity'] <= 0) {
				$data['stock'] = $product_info['stock_status'];
			} elseif ($this->config->get('config_stock_display')) {
				$data['stock'] = $product_info['quantity'];
			} else {
				$data['stock'] = $this->language->get('text_instock');
			}

			$this->load->model('tool/image');

			if ($product_info['image']) {
$data['popup_fixed'] = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
				$data['popup'] = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			} else {
				$data['popup'] = $this->model_tool_image->resize('no_image.png', $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			}

			if ($product_info['image']) {
$data['thumb_fixed'] = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_additional_width'), $this->config->get('config_image_additional_height'));
				$data['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			} else {
				$data['thumb'] = $this->model_tool_image->resize('no_image.png', $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			}

			$data['images'] = array();

			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);

			foreach ($results as $result) {
				$data['images'][] = array(
'original' => strpos($this->config->get('config_template'), 'journal2') === 0 ? Journal2Utils::resizeImage($this->model_tool_image, $result['image']) : '',
					'popup' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')),
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_additional_width'), $this->config->get('config_image_additional_height'))
				);
			}

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$data['price'] = false;
			}

			if ((float)$product_info['special']) {

                if (strpos($this->config->get('config_template'), 'journal2') === 0 && $this->journal2->settings->get('show_countdown_product_page', 'on') == 'on') {
                    $this->load->model('journal2/product');
                    $date_end = $this->model_journal2_product->getSpecialCountdown($this->request->get['product_id']);
                    if ($date_end === '0000-00-00') {
                        $date_end = false;
                    }
                    $data['date_end'] = $date_end;
                }
            
				$data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$data['special'] = false;
			}

			if ($this->config->get('config_tax')) {
				$data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
			} else {
				$data['tax'] = false;
			}

			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);

			$data['discounts'] = array();

			foreach ($discounts as $discount) {
				$data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')))
				);
			}

			$data['options'] = array();

			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false));
						} else {
							$price = false;
						}

						$product_option_value_data[] = array(
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id'         => $option_value['option_value_id'],
							'name'                    => $option_value['name'],
							'image'                   => strpos($this->config->get('config_template'), 'journal2') === 0 && $option_value['image'] && is_file(DIR_IMAGE . $option_value['image']) ? Journal2Utils::resizeImage($this->model_tool_image, $option_value['image'], $this->journal2->settings->get('product_page_options_push_image_width', 30), $this->journal2->settings->get('product_page_options_push_image_height', 30), 'crop') : $this->model_tool_image->resize($option_value['image'], 50, 50),
							'price'                   => $price,
							'price_prefix'            => $option_value['price_prefix']
						);
					}
				}

				$data['options'][] = array(
					'product_option_id'    => $option['product_option_id'],
					'product_option_value' => $product_option_value_data,
					'option_id'            => $option['option_id'],
					'name'                 => $option['name'],
					'type'                 => $option['type'],
					'value'                => $option['value'],
					'required'             => $option['required']
				);
			}

			if ($product_info['minimum']) {
				$data['minimum'] = $product_info['minimum'];
			} else {
				$data['minimum'] = 1;
			}

			$data['review_status'] = $this->config->get('config_review_status');

			if ($this->config->get('config_review_guest') || $this->customer->isLogged()) {
				$data['review_guest'] = true;
			} else {
				$data['review_guest'] = false;
			}

			if ($this->customer->isLogged()) {
				$data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
			} else {
				$data['customer_name'] = '';
			}

			$data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
			$data['rating'] = (int)$product_info['rating'];

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$data['captcha'] = $this->load->controller('captcha/' . $this->config->get('config_captcha'));
			} else {
				$data['captcha'] = '';
			}

			$data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);

			$data['products'] = array();

			$results = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}


                $date_end = false;
                if (strpos($this->config->get('config_template'), 'journal2') === 0 && $special && $this->journal2->settings->get('show_countdown', 'never') !== 'never') {
                    $this->load->model('journal2/product');
                    $date_end = $this->model_journal2_product->getSpecialCountdown($result['product_id']);
                    if ($date_end === '0000-00-00') {
                        $date_end = false;
                    }
                }
            

                $additional_images = $this->model_catalog_product->getProductImages($result['product_id']);

                $image2 = false;

                if (count($additional_images) > 0) {
                    $image2 = $this->model_tool_image->resize($additional_images[0]['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                }
            
				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,

                'thumb2'       => $image2,
            

                'labels'        => $this->model_journal2_product->getLabels($result['product_id']),
            
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,

                'date_end'       => $date_end,
            
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}


                if($this->config->get('marketplace_status')) {
                    $this->load->model('account/customerpartner');
                    $this->load->language('customerpartner/profile');

                    if ($this->config->get('wk_custom_shipping_status') && isset($this->session->data['shipping_address']['postcode']) && isset($this->request->get['product_id']) && $this->request->get['product_id']) {
                        $check_seller = $this->model_account_customerpartner->getProductSellerDetails($this->request->get['product_id']);
                        $seller_id = 0;
                        if (isset($check_seller['customer_id']) && $check_seller['customer_id']) {
                            $seller_id = $check_seller['customer_id'];
                        }

                        $data['text_seller_information'] = $this->language->get('text_seller_information');

				



                        $this->load->model('customerpartner/information');

                        $data['informations'] = array();

                        $informations = $this->model_customerpartner_information->getSellerInformations($seller_id);

                        if ($informations) {
                          $count = 0;

                          foreach ($informations as $result) {
                            $data['informations'][] = array(
                              'title' => $result['title'],
                              'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
                            );

                            $count++;

                            if ($count == 3) {
                              break;
                            }
                          }
                        }

                        $weight = 0;
                        if (isset($product_info['weight']) && $product_info['weight']) {
                            $weight = $product_info['weight'];
                        }
                        $max_days = $this->model_account_customerpartner->getMinDays($seller_id,$this->session->data['shipping_address']['postcode'],$weight);
                        if (isset($max_days['max_days']) && $max_days['max_days']) {
                            $date = new DateTime(date('Y-m-d', strtotime("+".$max_days['max_days']." days")));
                            $data['delivery_date'] = $date->format('Y-m-d');
                            $data['text_delivery_date'] = $this->language->get('text_delivery_date');
                        }
                    }
					
					

					
					
					
                    $data['showSellerInfo'] = false;
                    $data['wk_custome_field_wkcustomfields'] = true;
                    $customFields = array();
                    $data['customFields'] = array();
                    $customFields = $this->model_catalog_product->getProductCustomFields($this->request->get['product_id']);
                    foreach ($customFields as $key => $value) {
                        $customFieldsName = $this->model_catalog_product->getCustomFieldName($value['fieldId']);
                        $customFieldsOptionId = $this->model_catalog_product->getCustomFieldOptionId($this->request->get['product_id'],$value['fieldId']);
                        $customFieldValue = '';
                        foreach ($customFieldsOptionId as $key => $option) {
                            if(is_numeric($option['option_id'])){
                                $customFieldValue .= $this->model_catalog_product->getCustomFieldOption($option['option_id']).", ";
                            }else{
                                $customFieldValue = $option['option_id'];
                            }
                        }
                        $data['customFields'][] = array(
                            'fieldName' =>  $customFieldsName,
                            'fieldValue'    =>  trim($customFieldValue,', '),
                        );
                    }

                                $checkSellerOwnProduct = $this->model_account_customerpartner->checkSellerOwnProduct($this->request->get['product_id']);

                                $this->load->language('module/marketplace');
                                if ($checkSellerOwnProduct && !$this->config->get('marketplace_sellerbuyproduct')) {
                                    $data['allowedProductBuy'] = false;
                                    $data['error_own_product'] = $this->language->get('error_own_product');
                                }else{
                                    $data['allowedProductBuy'] = true;
                                    $data['error_own_product'] = false;
                                }



                                if (!$this->config->get('marketplace_seller_info_by_module') && !$this->config->get('marketplace_seller_info_hide')) {

                                    $this->load->language('customerpartner/profile');

                                    $this->load->model('customerpartner/master');

                                    $check_seller = $this->model_account_customerpartner->getProductSellerDetails($this->request->get['product_id']);

                                    $this->load->model('customerpartner/master');

                                    if ($check_seller) {

                                        $partner = $this->model_customerpartner_master->getProfile($check_seller['customer_id']);

                                        switch ($this->config->get('marketplace_product_name_display')) {
                                            case 'sn':
                                                //$data['info_name'] = $partner['firstname']. ' ' .$partner['lastname'];
												$data['info_name'] = $partner['screenname'];
                                                break;

                                            case 'cn':
                                                //$data['info_name'] = $partner['companyname'];
												$data['info_name'] = $partner['screenname'];
                                                break;

                                            case 'sncn':
                                                //$data['info_name'] = $partner['firstname']. ' ' .$partner['lastname'].' '.'And'.' '.$partner['companyname'];
												$data['info_name'] = $partner['screenname'];
                                                break;
                                        }

                                        switch ($this->config->get('marketplace_product_image_display')) {
                                            case 'avatar':
                                                if ($partner['avatar'] && file_exists(DIR_IMAGE . $partner['avatar'])) {
                                                    $data['info_image'] = $this->model_tool_image->resize($partner['avatar'], 80, 80);
                                                } else if($this->config->get('marketplace_default_image_name') && file_exists(DIR_IMAGE . $this->config->get('marketplace_default_image_name'))) {
                                                    if($partner['avatar'] != 'removed') {
                                                        $data['info_image'] = $this->model_tool_image->resize($this->config->get('marketplace_default_image_name'), 80, 80);
                                                    } else {
                                                        $data['info_image'] = '';
                                                    }
                                                }else{
                                                    $data['info_image'] = $this->model_tool_image->resize($this->config->get('config_logo'), 80, 80);
                                                }
                                                break;

                                            case 'companylogo':
                                                if ($partner['companylogo'] && file_exists(DIR_IMAGE . $partner['companylogo'])) {
                                                    $data['info_image'] = $this->model_tool_image->resize($partner['companylogo'], 80, 80);
                                                } else if($this->config->get('marketplace_default_image_name') && file_exists(DIR_IMAGE . $this->config->get('marketplace_default_image_name'))) {
                                                    if($partner['companylogo'] != 'removed') {
                                                        $data['info_image'] = $this->model_tool_image->resize($this->config->get('marketplace_default_image_name'), 80, 80);
                                                    } else {
                                                        $data['info_image'] = '';
                                                    }
                                                }else{
                                                    $data['info_image'] = $this->model_tool_image->resize($this->config->get('config_logo'), 80, 80);
                                                }
                                                break;

                                            case 'companybanner':
                                                if ($partner['companybanner'] && file_exists(DIR_IMAGE . $partner['companybanner'])) {
                                                    $data['info_image'] = $this->model_tool_image->resize($partner['companybanner'], 80, 80);
                                                } else if($this->config->get('marketplace_default_image_name') && file_exists(DIR_IMAGE . $this->config->get('marketplace_default_image_name'))) {
                                                    if($partner['companybanner'] != 'removed') {
                                                        $data['info_image'] = $this->model_tool_image->resize($this->config->get('marketplace_default_image_name'), 80, 80);
                                                    } else {
                                                        $data['info_image'] = '';
                                                    }
                                                }else{
                                                    $data['info_image'] = $this->model_tool_image->resize($this->config->get('config_logo'), 80, 80);
                                                }
                                                break;
                                        }

                                        $data['review_fields'] = $this->model_customerpartner_master->getAllReviewFields();

                                        foreach ($data['review_fields'] as $key => $review_field) {
                                          $data['review_fields'][$key]['field_value'] = $this->model_customerpartner_master->getAllAverageFeedback($check_seller['customer_id'],$review_field['field_id']);
                                        }

                                        $data['info_feedback_total'] = round($this->model_customerpartner_master->getAverageFeedback($check_seller['customer_id']));

                                        $data['info_total_products'] = $this->model_customerpartner_master->getPartnerCollectionCount($check_seller['customer_id']);

                                        $data['info_heading_text'] = $this->language->get('text_seller_info_heading');
                                        $data['info_price_text']   = $this->language->get('text_seller_info_price');
                                        $data['info_value_text']   = $this->language->get('text_seller_info_value');
                                        $data['info_quality_text'] = $this->language->get('text_seller_info_quality');
                                        $data['info_product_text'] = $this->language->get('text_seller_info_product');
                                        $data['showSellerRating']  = $this->config->get('text_seller_info_product');
                                        $data['loadProfile'] = $this->url->link('customerpartner/profile&id='.$check_seller['customer_id'],'','SSL');

									   $this->load->model('customerpartner/master');
									   $chatting_id = 0;
									   $seller_info_ = $this->model_customerpartner_master->getChattingSellerID($check_seller['customer_id']);

										if ($seller_info_) {		
											$chatting_id = $seller_info_['chatting_id'];
													
										}		
										$data['text_href']	=	'';
										$data['ispartnerkode_012']	= 0;
										if ($from_useridX_m == $to_useridX_m) {	
										 $data['ispartnerkode_012']	= 1;
										}
										
										//if ($chatting_id == 0) {
										//  $data['text_href']	=	'';
										//}else{
										//  $data['text_href']	=	$this->language->get('text_href') . $chatting_id ;
										//}	

										if ($chat_idX > 0 and $from_useridX_m > 0 and $to_useridX_m > 0) {	
													 
													 $data['text_href']	= $linktarget;
											} else {
													 $data['text_href']	= "https://gudangmaterials.id/customer/apps/";
										}

                                        $data['showSellerInfo'] = true;
                                    }
                                }
                        }else{
                            $data['wk_custome_field_wkcustomfields'] = false;
                            $data['allowedProductBuy'] = true;
                            $data['showSellerInfo'] = false;
                        }
            
			$data['tags'] = array();

			if ($product_info['tag']) {
				$tags = explode(',', $product_info['tag']);

				foreach ($tags as $tag) {
					$data['tags'][] = array(
						'tag'  => trim($tag),
						'href' => $this->url->link('product/search', 'tag=' . trim($tag))
					);
				}
			}

			$data['recurrings'] = $this->model_catalog_product->getProfiles($this->request->get['product_id']);

			$this->model_catalog_product->updateViewed($this->request->get['product_id']);

			$data['ceklogin'] = $this->customer->isLogged();
			$data['link_login'] = $this->url->link('account/login', '', 'SSL');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/product.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/product.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/product/product.tpl', $data));
			}
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/product', $url . '&product_id=' . $product_id)
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

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
			}
		}
	}

	public function review() {
		$this->load->language('product/product');

		$this->load->model('catalog/review');

		$data['text_no_reviews'] = $this->language->get('text_no_reviews');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['reviews'] = array();

		$review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);

		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], ($page - 1) * 5, 5);

		foreach ($results as $result) {
			$data['reviews'][] = array(
				'author'     => $result['author'],
				'text'       => nl2br($result['text']),
				'rating'     => (int)$result['rating'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = 5;
		$pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total, ceil($review_total / 5));

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/review.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/review.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/product/review.tpl', $data));
		}
	}

	public function write() {
		$this->load->language('product/product');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}

			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

			if (empty($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
				$json['error'] = $this->language->get('error_rating');
			}

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('captcha/' . $this->config->get('config_captcha') . '/validate');

				if ($captcha) {
					$json['error'] = $captcha;
				}
			}

			if (!isset($json['error'])) {
				$this->load->model('catalog/review');

				$this->model_catalog_review->addReview($this->request->get['product_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function getRecurringDescription() {
		$this->language->load('product/product');
		$this->load->model('catalog/product');

		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		if (isset($this->request->post['recurring_id'])) {
			$recurring_id = $this->request->post['recurring_id'];
		} else {
			$recurring_id = 0;
		}

		if (isset($this->request->post['quantity'])) {
			$quantity = $this->request->post['quantity'];
		} else {
			$quantity = 1;
		}

		$product_info = $this->model_catalog_product->getProduct($product_id);
		$recurring_info = $this->model_catalog_product->getProfile($product_id, $recurring_id);

		$json = array();

		if ($product_info && $recurring_info) {
			if (!$json) {
				$frequencies = array(
					'day'        => $this->language->get('text_day'),
					'week'       => $this->language->get('text_week'),
					'semi_month' => $this->language->get('text_semi_month'),
					'month'      => $this->language->get('text_month'),
					'year'       => $this->language->get('text_year'),
				);

				if ($recurring_info['trial_status'] == 1) {
					$price = $this->currency->format($this->tax->calculate($recurring_info['trial_price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')));
					$trial_text = sprintf($this->language->get('text_trial_description'), $price, $recurring_info['trial_cycle'], $frequencies[$recurring_info['trial_frequency']], $recurring_info['trial_duration']) . ' ';
				} else {
					$trial_text = '';
				}

				$price = $this->currency->format($this->tax->calculate($recurring_info['price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')));

				if ($recurring_info['duration']) {
					$text = $trial_text . sprintf($this->language->get('text_payment_description'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				} else {
					$text = $trial_text . sprintf($this->language->get('text_payment_cancel'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				}

				$json['success'] = $text;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
