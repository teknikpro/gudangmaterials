<?php 
class ControllerDesignChatting extends Controller {
	private $error = array();

	public function index() {
		
		$this->load->language('design/chatting');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('design/chatting');
		
		$this->load->model('customerpartner/review');

		$this->getList();
		
	}

	public function insert() {
		$this->load->language('design/chatting');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('design/chatting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$username = $this->user->getUserName();
			$user_id = $this->user->session->data['user_id'];
			$getEmail = $this->model_design_chatting->getEmail($user_id);
			
			$this->request->post['username'] = $username;
			$this->request->post['email']    = $getEmail;
			
			$this->model_design_chatting->addchatting($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('design/chatting', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}
	

	public function update() {
		$this->load->language('design/chatting');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('design/chatting');
		$data['text_form'] = 'Edit Chatting Topic';

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			
			$this->model_design_chatting->editchatting($this->request->get['chatting_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

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
			
			$this->response->redirect($this->url->link('design/chatting', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			
		}

		$this->getForm();
	}
	
	public function updateReply() {
		$this->load->language('design/chatting');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('design/chatting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_design_chatting->editchattingReply($this->request->get['chatting_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('design/chatting/getchattingReply', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			
			
		}

		$this->getFormReply();
	}

	public function delete() {
		$this->load->language('design/chatting');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('design/chatting');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $chatting_id) {
				$this->model_design_chatting->deletechatting($chatting_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

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
			$this->response->redirect($this->url->link('design/chatting', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			
		}

		$this->getList();
	}
	
	public function deleteReply() {
		$this->load->language('design/chatting');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('design/chatting');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $chatting_id) {
				$this->model_design_chatting->deletechattingReply($chatting_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

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
			
			$this->response->redirect($this->url->link('design/chatting/getchattingReply', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			
		}

		$this->getchattingReply();
	}

	protected function getList() {
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

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

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('design/chatting', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		$data['insert'] = $this->url->link('design/chatting/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('design/chatting/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['chattings'] = array();

		$data1 = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$chatting_total = $this->model_design_chatting->getTotalchattings();

		$results = $this->model_design_chatting->getchattings($data1);

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('design/chatting/update', 'token=' . $this->session->data['token'] . '&chatting_id=' . $result['chatting_id'] . $url, 'SSL')
			);

			if($result['status'] == 0) {
				$status = "Disabled";
			}else if($result['status'] == 1) {
				$status = "Enabled";	
			}else {
				$status = "Closed";
			}
			
	        
            $seller_info_ = $this->model_design_chatting->getSellerName_($result['chatting_id']);

		    if ($seller_info_) {		
                $seller_name = $seller_info_['seller_name'];
				$customer_name = $seller_info_['customer_name'];
				
		    }		
					
			$data['chattings'][] = array(
				'chatting_id'   => $result['chatting_id'],
				'name'          => $result['name'],	
				'seller_name'   => $seller_name,
				'customer_name' => $customer_name,
				'status'        => $status,				
				'selected'      => isset($this->request->post['selected']) && in_array($result['chatting_id'], $this->request->post['selected']),				
				'action'        => $action
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_action'] = $this->language->get('column_action');	

		$data['button_insert'] = $this->language->get('button_insert');
		$data['button_delete'] = $this->language->get('button_delete');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('design/chatting', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
		$data['sort_status'] = $this->url->link('design/chatting', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $chatting_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('design/chatting', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();
		$data['results'] = sprintf($this->language->get('text_pagination'), ($chatting_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($chatting_total - $this->config->get('config_limit_admin'))) ? $chatting_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $chatting_total, ceil($chatting_total / $this->config->get('config_limit_admin')));
		$data['sort'] = $sort;
		$data['order'] = $order;
		
		$data['header'] = $this->load->controller('common/header');

		$data['column_left'] = $this->load->controller('common/column_left');

		$data['footer'] = $this->load->controller('common/footer');



		$this->response->setOutput($this->load->view('design/chatting_list.tpl', $data));

	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_closed'] = $this->language->get('text_closed');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_image_manager'] = $this->language->get('text_image_manager');
		$data['text_browse'] = $this->language->get('text_browse');
		$data['text_clear'] = $this->language->get('text_clear');		
		
		//$data['filter_seller'] = $filter_seller;
		//$data['filter_customer'] = $filter_customer;


		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_seller'] = $this->language->get('entry_seller'); 
		$data['entry_customer'] = $this->language->get('entry_customer'); 
		$data['help_seller'] = $this->language->get('help_seller'); 
		$data['help_customer'] = $this->language->get('help_customer'); 
		
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_link'] = $this->language->get('entry_link');
		$data['entry_image'] = $this->language->get('entry_image');		
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add_chatting'] = $this->language->get('button_add_chatting');
		$data['button_remove'] = $this->language->get('button_remove');

	    $url = '';

		if (isset($this->request->get['filter_seller'])) {
			$url .= '&filter_seller=' . urlencode(html_entity_decode($this->request->get['filter_seller'], ENT_QUOTES, 'UTF-8'));
		}


		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['seller'])) {
			$data['error_seller'] = $this->error['seller'];
		} else {
			$data['error_seller'] = '';
		}

		if (isset($this->error['customer'])) {
			$data['error_customer'] = $this->error['customer'];
		} else {
			$data['error_customer'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['chatting_image'])) {
			$data['error_chatting_image'] = $this->error['chatting_image'];
		} else {
			$data['error_chatting_image'] = array();
		}	

		if (isset($this->request->get['review_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$review_info = $this->model_customerpartner_review->getReview($this->request->get['review_id']);

			$review_fields = $this->model_customerpartner_review->getAllReviewFields();

			if ($review_fields) {
				foreach ($review_fields as $key => $value) {
					$attribute_value = $this->model_customerpartner_review->getReviewAttributeValue($this->request->get['review_id'],$value['field_id']);
					if (isset($attribute_value['field_value']) && $attribute_value['field_value']) {
						$data['review_attributes'][$value['field_id']] = $attribute_value['field_value'];
					}
				}
			}
		}
		
	        


         $data['token'] = $this->session->data['token'];

		if (isset($this->request->post['seller_id'])) {
			$data['seller_id'] = $this->request->post['seller_id'];
		} elseif (!empty($review_info)) {
			$data['seller_id'] = $review_info['seller_id'];
		} else {
			$data['seller_id'] = '';
		}

		if (isset($this->request->post['seller'])) {
			$data['seller'] = $this->request->post['seller'];
		} elseif (!empty($review_info)) {
			$data['seller'] = $review_info['seller_name'];
		} else {
			$data['seller'] = '';
		}
		
		

		if (isset($this->request->post['customer_id'])) {
			$data['customer_id'] = $this->request->post['customer_id'];
		} elseif (!empty($review_info)) {
			$data['customer_id'] = $review_info['customer_id'];
		} else {
			$data['customer_id'] = '';
		}

		if (isset($this->request->post['customer'])) {
			$data['customer'] = $this->request->post['customer'];
		} elseif (!empty($review_info)) {
			$data['customer'] = $review_info['customer_name'];
		} else {
			$data['customer'] = '';
		}
		
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

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('design/chatting', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		if (!isset($this->request->get['chatting_id'])) { 
			$data['action'] = $this->url->link('design/chatting/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('design/chatting/update', 'token=' . $this->session->data['token'] . '&chatting_id=' . $this->request->get['chatting_id'] . $url, 'SSL');
		}

		$data['cancel'] = $this->url->link('design/chatting', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['chatting_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$chatting_info = $this->model_design_chatting->getchatting($this->request->get['chatting_id']);
		}

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($chatting_info)) {
			$data['name'] = $chatting_info['name'];
		} else {
			$data['name'] = '';
		}
		
		if (isset($this->request->post['description'])) {
			$data['description'] = $this->request->post['description'];
 
			
			
		} elseif (!empty($chatting_info)) {
			$data['description'] = $chatting_info['description'];
           $seller_info_ = $this->model_design_chatting->getSellerName_($this->request->get['chatting_id']);	

		    if ($seller_info_) {		
                $seller_name = $seller_info_['seller_name'];
				$customer_name =  $seller_info_['customer_name'];
				
		    }			
	         $data['seller'] = $seller_name;
			 $data['customer'] = $customer_name;		
							
			
			
			
		} else {
			$data['description'] = '';
			$data['seller'] = '';
			$data['customer'] = '';				
			
			
			
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($chatting_info)) {
			$data['status'] = $chatting_info['status'];
		} else {
			$data['status'] = true;
		}

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		$this->load->model('tool/image');

		if (isset($this->request->post['chatting_image'])) {
			$chatting_images = $this->request->post['chatting_image'];
		} elseif (isset($this->request->get['chatting_id'])) {
			$chatting_images = $this->model_design_chatting->getchattingImages($this->request->get['chatting_id']);	
		} else {
			$chatting_images = array();
		}

        
	
         //   $seller_info_ = $this->model_design_chatting->getSellerName_($this->request->get['chatting_id']);	

		  //  if ($seller_info_) {		
          //      $seller_name = $seller_info_['seller_name'];
			//	$customer_name =  $seller_info_['customer_name'];
				
		  //  }			
	     //    $data['seller'] = $seller_name;
		//	 $data['customer'] = $customer_name;		
	
			
		

		
		
	


		$data['chatting_images'] = array();

		foreach ($chatting_images as $chatting_image) {
			if ($chatting_image['image'] && file_exists(DIR_IMAGE . $chatting_image['image'])) {
				$image = $chatting_image['image'];
			} else {
				$image = 'no_image.jpg';
			}			

			$data['chatting_images'][] = array(
				'chatting_image_description' => $chatting_image['chatting_image_description'],
				'image'                    => $image,
				'thumb'                    => $this->model_tool_image->resize($image, 100, 100)
			);	
		} 

		$data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);		
		$data['header'] = $this->load->controller('common/header');

		$data['column_left'] = $this->load->controller('common/column_left');

		$data['footer'] = $this->load->controller('common/footer');



		$this->response->setOutput($this->load->view('design/chatting_form.tpl', $data));

	}
	
	protected function getFormReply() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_closed'] = $this->language->get('text_closed');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_image_manager'] = $this->language->get('text_image_manager');
		$data['text_browse'] = $this->language->get('text_browse');
		$data['text_clear'] = $this->language->get('text_clear');			

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_reply'] = $this->language->get('entry_reply');
		$data['entry_link'] = $this->language->get('entry_link');
		$data['entry_image'] = $this->language->get('entry_image');		
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add_chatting'] = $this->language->get('button_add_chatting');
		$data['button_remove'] = $this->language->get('button_remove');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['reply'])) {
			$data['error_reply'] = $this->error['reply'];
		} else {
			$data['error_reply'] = '';
		}

		if (isset($this->error['chatting_image'])) {
			$data['error_chatting_image'] = $this->error['chatting_image'];
		} else {
			$data['error_chatting_image'] = array();
		}	

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

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('design/chatting', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		if (!isset($this->request->get['chatting_id'])) { 
			$data['action'] = $this->url->link('design/chatting/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('design/chatting/updateReply', 'token=' . $this->session->data['token'] . '&chatting_id=' . $this->request->get['chatting_id'] . $url, 'SSL');
		}

		$data['cancel'] = $this->url->link('design/chatting/getchattingReply', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['chatting_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$chatting_info = $this->model_design_chatting->getchattingReply($this->request->get['chatting_id']);
		}

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($chatting_info)) {
			$data['name'] = $chatting_info['name'];
		} else {
			$data['name'] = '';
		}
		
		if (isset($this->request->post['reply'])) {
			$data['reply'] = $this->request->post['reply'];
		} elseif (!empty($chatting_info)) {
			$data['reply'] = $chatting_info['reply'];
		} else {
			$data['reply'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($chatting_info)) {
			$data['status'] = $chatting_info['status'];
		} else {
			$data['status'] = true;
		}




		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		$this->load->model('tool/image');

		if (isset($this->request->post['chatting_image'])) {
			$chatting_images = $this->request->post['chatting_image'];
		} elseif (isset($this->request->get['chatting_id'])) {
			$chatting_images = $this->model_design_chatting->getchattingImages($this->request->get['chatting_id']);	
		} else {
			$chatting_images = array();
		}

		$data['chatting_images'] = array();

		foreach ($chatting_images as $chatting_image) {
			if ($chatting_image['image'] && file_exists(DIR_IMAGE . $chatting_image['image'])) {
				$image = $chatting_image['image'];
			} else {
				$image = 'no_image.jpg';
			}			

			$data['chatting_images'][] = array(
				'chatting_image_description' => $chatting_image['chatting_image_description'],
				'image'                    => $image,
				'thumb'                    => $this->model_tool_image->resize($image, 100, 100)
			);	
		} 

		$data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);		
		$data['header'] = $this->load->controller('common/header');

		$data['column_left'] = $this->load->controller('common/column_left');

		$data['footer'] = $this->load->controller('common/footer');



		$this->response->setOutput($this->load->view('design/chatting_form_reply.tpl', $data));
		

	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'design/chatting')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['seller_id']) {
			$this->error['seller'] = $this->language->get('error_seller');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (isset($this->request->post['chatting_image'])) {
			foreach ($this->request->post['chatting_image'] as $chatting_image_id => $chatting_image) {
				foreach ($chatting_image['chatting_image_description'] as $language_id => $chatting_image_description) {
					if ((utf8_strlen($chatting_image_description['title']) < 2) || (utf8_strlen($chatting_image_description['title']) > 64)) {
						$this->error['chatting_image'][$chatting_image_id][$language_id] = $this->language->get('error_title'); 
					}					
				}
			}	
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'design/chatting')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	public function getchattingReply() {
	
		$this->load->language('design/chatting');

		$this->document->setTitle('chatting Reply');

		$this->load->model('design/chatting');
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

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

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('design/chatting', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);


		$data['breadcrumbs'][] = array(
			'text'      => 'chatting Reply',
			'href'      => $this->url->link('design/chatting/getchattingReply', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		$data['insert'] = $this->url->link('design/chatting/insertReply', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('design/chatting/deleteReply', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['chattings'] = array();

		$data1 = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$chatting_total = $this->model_design_chatting->getTotalchattingsReply();

		$results = $this->model_design_chatting->getchattingsReply($data1);
		
		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('design/chatting/updateReply', 'token=' . $this->session->data['token'] . '&chatting_id=' . $result['id'] . $url, 'SSL')
			);

			if($result['status'] == 0) {
				$status = "Disabled";
			}else if($result['status'] == 1) {
				$status = "Enabled";	
			}else {
				$status = "Closed";
			}
			
			$data['chattings'][] = array(
				'chatting_id' => $result['chatting_id'],
				'id'          => $result['id'],
				'name'      => $result['name'],	
				'reply'      => $result['reply'],	
				'status'    => $status,				
				'selected'  => isset($this->request->post['selected']) && in_array($result['chatting_id'], $this->request->post['selected']),				
				'action'    => $action
			);
		}

		$data['heading_title'] = 'chatting Reply';

		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_action'] = $this->language->get('column_action');	

		$data['button_insert'] = $this->language->get('button_insert');
		$data['button_delete'] = $this->language->get('button_delete');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('design/chatting/getchattingReply', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
		$data['sort_status'] = $this->url->link('design/chatting/getchattingReply', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $chatting_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('design/chatting/getchattingReply', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();
		
		$data['results'] = sprintf($this->language->get('text_pagination'), ($chatting_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($chatting_total - $this->config->get('config_limit_admin'))) ? $chatting_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $chatting_total, ceil($chatting_total / $this->config->get('config_limit_admin')));
		
		$data['sort'] = $sort;
		$data['order'] = $order;
		
		$data['header'] = $this->load->controller('common/header');

		$data['column_left'] = $this->load->controller('common/column_left');

		$data['footer'] = $this->load->controller('common/footer');



		$this->response->setOutput($this->load->view('design/chatting_reply_list.tpl', $data));

	
	}

	public function autocomplete() {

		$json = array();

		if (isset($this->request->get['filter_customer']) || isset($this->request->get['filter_seller'])) {

			$this->load->model('customerpartner/review');

			if (isset($this->request->get['filter_customer'])) {
				$filter_customer = $this->request->get['filter_customer'];
			} else {
				$filter_customer = '';
			}

			if (isset($this->request->get['customer_id'])) {
				$filter_customer_id = $this->request->get['customer_id'];
			} else {
				$filter_customer_id = '';
			}

			if (isset($this->request->get['filter_seller'])) {
				$filter_seller = $this->request->get['filter_seller'];
				$filter_seller_field = 1;
			} else {
				$filter_seller = '';
				$filter_seller_field = '';
			}

			if (isset($this->request->get['seller_id'])) {
				$filter_seller_id = $this->request->get['seller_id'];
			} else {
				$filter_seller_id = '';
			}

			$data = array(
				'filter_customer'         => $filter_customer,
				'filter_customer_id'      => $filter_customer_id,
				'filter_seller'  	      => $filter_seller,
				'filter_seller_id'  	  => $filter_seller_id,
				'filter_seller_field'     => $filter_seller_field,
			);

			$results = $this->model_customerpartner_review->getCustomers($data);

			foreach ($results as $result) {

				$json[] = array(
					'customer_id' 		 => $result['customer_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
				);
			}
		}

		$this->response->setOutput(json_encode($json));
	}

}
?>