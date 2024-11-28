<?php 
class ControllerPaymentIwallet extends Controller {
	private $error = array(); 

	public function index() {
		$this->load->language('payment/iwallet');

		//$this->document->title = $this->language->get('heading_title');
		
		$this->load->model('setting/setting');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->load->model('setting/setting');
			
			$this->model_setting_setting->editSetting('iwallet', $this->request->post);				
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect(HTTPS_SERVER . 'index.php?route=extension/payment&token=' . $this->session->data['token']);
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		
		$data['entry_APIVersion'] = $this->language->get('entry_APIVersion');
		$data['entry_MerchantKey'] = $this->language->get('entry_MerchantKey');		
		$data['entry_MerchantEmail'] = $this->language->get('entry_MerchantEmail');
		$data['entry_callback'] = $this->language->get('entry_callback');
		$data['entry_UseIntMode'] = $this->language->get('entry_UseIntMode');
		$data['entry_order_status'] = $this->language->get('entry_order_status');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['help_APIVersion'] = $this->language->get('help_APIVersion');
		$data['help_MerchantKey'] = $this->language->get('help_MerchantKey');
		$data['help_MerchantEmail'] = $this->language->get('help_MerchantEmail');
		$data['help_callback'] = $this->language->get('help_callback');
		$data['help_UseIntMode'] = $this->language->get('help_UseIntMode');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

 		if (isset($this->error['iwallet_APIVersion'])) {
			$data['error_iwallet_APIVersion'] = $this->error['iwallet_APIVersion'];
		} else {
			$data['error_iwallet_APIVersion'] = '';
		}
		if (isset($this->error['iwallet_MerchantKey'])) {
			$data['error_iwallet_MerchantKey'] = $this->error['iwallet_MerchantKey'];
		} else {
			$data['error_iwallet_MerchantKey'] = '';
		}
		if (isset($this->error['iwallet_MerchantEmail'])) {
			$data['error_iwallet_MerchantEmail'] = $this->error['iwallet_MerchantEmail'];
		} else {
			$data['error_iwallet_MerchantEmail'] = '';
		}
		
  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=extension/payment&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_payment'),
      		'separator' => ' :: '
   		);

   		$data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=payment/iwallet&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
				
		$data['action'] = HTTPS_SERVER . 'index.php?route=payment/iwallet&token=' . $this->session->data['token'];
		
		$data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/payment&token=' . $this->session->data['token'];
		
		if (isset($this->request->post['iwallet_APIVersion'])) {
			$data['iwallet_APIVersion'] = $this->request->post['iwallet_APIVersion'];
		} else {
			$data['iwallet_APIVersion'] = $this->config->get('iwallet_APIVersion');
		}
		
		if (isset($this->request->post['iwallet_MerchantKey'])) {
			$data['iwallet_MerchantKey'] = $this->request->post['iwallet_MerchantKey'];
		} else {
			$data['iwallet_MerchantKey'] = $this->config->get('iwallet_MerchantKey');
		}
		
		if (isset($this->request->post['iwallet_MerchantEmail'])) {
			$data['iwallet_MerchantEmail'] = $this->request->post['iwallet_MerchantEmail'];
		} else {
			$data['iwallet_MerchantEmail'] = $this->config->get('iwallet_MerchantEmail');
		}
		
		$data['callback'] = HTTP_CATALOG . 'index.php?route=payment/iwallet/callback';
		
		if (isset($this->request->post['iwallet_UseIntMode'])) {
			$data['iwallet_UseIntMode'] = $this->request->post['iwallet_UseIntMode'];
		} else {
			$data['iwallet_UseIntMode'] = $this->config->get('iwallet_UseIntMode');
		} 
		
		if (isset($this->request->post['iwallet_order_status_id'])) {
			$data['iwallet_order_status_id'] = $this->request->post['iwallet_order_status_id'];
		} else {
			$data['iwallet_order_status_id'] = $this->config->get('iwallet_order_status_id'); 
		}
		
		$this->load->model('localisation/order_status');
		
		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		
		if (isset($this->request->post['iwallet_status'])) {
			$data['iwallet_status'] = $this->request->post['iwallet_status'];
		} else {
			$data['iwallet_status'] = $this->config->get('iwallet_status');
		}
		
		if (isset($this->request->post['iwallet_sort_order'])) {
			$data['iwallet_sort_order'] = $this->request->post['iwallet_sort_order'];
		} else {
			$data['iwallet_sort_order'] = $this->config->get('iwallet_sort_order');
		}
	
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('payment/iwallet.tpl', $data));
		
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'payment/iwallet')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['iwallet_APIVersion']) {
			$this->error['iwallet_APIVersion'] = $this->language->get('error_APIVersion');
		}
		
		if (!$this->request->post['iwallet_MerchantKey']) {
			$this->error['iwallet_MerchantKey'] = $this->language->get('error_MerchantKey');
		}
		
		if (!$this->request->post['iwallet_MerchantEmail']) {
			$this->error['iwallet_MerchantEmail'] = $this->language->get('error_MerchantEmail');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>