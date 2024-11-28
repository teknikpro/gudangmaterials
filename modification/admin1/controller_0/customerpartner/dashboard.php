<?php
class Controllercustomerpartnerdashboard extends Controller {

	private $error = array();
	private $data = array();

	public function index() {

		// if (!$this->customer->isLogged()) {
		// 	$this->session->data['redirect'] = $this->url->link('account/customerpartner/dashboard', '', true);
		// 	$this->response->redirect($this->url->link('account/login', '', true));
		// }

		$this->load->model('customerpartner/customerpartner');

		// $this->data['chkIsPartner'] = $this->model_customerpartner->chkIsPartner();

		// if(!$this->data['chkIsPartner'] || (isset($this->session->data['marketplace_seller_mode']) && !$this->session->data['marketplace_seller_mode']))
		// 	$this->response->redirect($this->url->link('account/account', '', true));

    	// $this->document->addStyle('catalog/view/theme/default/stylesheet/MP/sell.css');

		$this->language->load('customerpartner/dashboard');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_sale'] = $this->language->get('text_sale');
		$this->data['text_map'] = $this->language->get('text_map');
		$this->data['text_activity'] = $this->language->get('text_activity');
		$this->data['text_recent'] = $this->language->get('text_recent');

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', '', true),
        	'separator' => false
      	);

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', true),
        	'separator' => $this->language->get('text_separator')
      	);

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_dashboard'),
			'href'      => $this->url->link('account/customerpartner/dashboard', '', true),
        	'separator' => $this->language->get('text_separator')
      	);

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

      	$this->data['order'] = $this->load->controller('customerpartner/dashboards/order');
		$this->data['sale'] = $this->load->controller('customerpartner/dashboards/sale');
		$this->data['customer'] = $this->load->controller('customerpartner/dashboards/customer');

		// $this->data['seller_sale'] = '';
		$this->data['seller_map'] = $this->load->controller('customerpartner/map');

		$this->data['chart'] = $this->load->controller('customerpartner/dashboards/chart');
		// $this->data['activity'] = $this->load->controller('account/customerpartner/dashboards/activity');
		$this->data['recent'] = $this->load->controller('customerpartner/dashboards/recent');

		// $this->data['footer'] = $this->load->controller('common/footer');
		// $this->data['header'] = $this->load->controller('common/header');
		// $this->data['column_left'] = $this->load->controller('common/column_left');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/customerpartner/dashboard.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/customerpartner/dashboard.tpl' , $this->data));
		} else {
			$this->response->setOutput($this->load->view('customerpartner/dashboard.tpl' , $this->data));
		}

	}

	public function changereview(){

		$this->language->load('account/customerpartner/dashboard');

		$this->load->model('account/customerpartner');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST' AND $this->customer->getID()) {

			if ($this->model_account_customerpartner->chkIsPartner() AND isset($this->request->post['review'])) {
				$latestcomment=$this->model_account_customerpartner->UpdateReview($this->request->post['review']);
				$json['success'] = $this->language->get('text_change_review');
			}else{
				$json['error'] = $this->language->get('text_error');
			}

		}

		$this->response->setOutput(json_encode($json));

	}

	public function chartinfo() {
		$this->load->language('customerpartner/dashboards/chart');
		$customer_id = $this->request->get['customer_id'];


		$json = array();

		$this->load->model('customerpartner/dashboard');
		// $this->load->model('report/customer');
		$data['token'] = $this->session->data['token'];

		$json['order'] = array();
		$json['customer'] = array();
		$json['xaxis'] = array();

		$json['order']['label'] = $this->language->get('text_order');
		$json['customer']['label'] = $this->language->get('text_customer');
		$json['order']['data'] = array();
		$json['customer']['data'] = array();

		if (isset($this->request->get['range'])) {
			$range = $this->request->get['range'];
		} else {
			$range = 'day';
		}

		switch ($range) {
			default:
			case 'day':
				$results = $this->model_customerpartner_dashboard->getTotalOrdersByDay($customer_id);

				foreach ($results as $key => $value) {
					$json['order']['data'][] = array($key, $value['total']);
				}


				$results = $this->model_customerpartner_dashboard->getTotalCustomersByDay($customer_id);



				foreach ($results as $key => $value) {
					$json['customer']['data'][] = array($key, $value['total']);
				}

				for ($i = 0; $i < 24; $i++) {
					$json['xaxis'][] = array($i, $i);
				}
				break;
			case 'week':
				$results = $this->model_customerpartner_dashboard->getTotalOrdersByWeek($customer_id);

				foreach ($results as $key => $value) {
					$json['order']['data'][] = array($key, $value['total']);
				}

				$results = $this->model_customerpartner_dashboard->getTotalCustomersByWeek($customer_id);

				foreach ($results as $key => $value) {
					$json['customer']['data'][] = array($key, $value['total']);
				}

				$date_start = strtotime('-' . date('w') . ' days');

				for ($i = 0; $i < 7; $i++) {
					$date = date('Y-m-d', $date_start + ($i * 86400));

					$json['xaxis'][] = array(date('w', strtotime($date)), date('D', strtotime($date)));
				}
				break;
			case 'month':
				$results = $this->model_customerpartner_dashboard->getTotalOrdersByMonth($customer_id);

				foreach ($results as $key => $value) {
					$json['order']['data'][] = array($key, $value['total']);
				}

				$results = $this->model_customerpartner_dashboard->getTotalCustomersByMonth($customer_id);

				foreach ($results as $key => $value) {
					$json['customer']['data'][] = array($key, $value['total']);
				}

				for ($i = 1; $i <= date('t'); $i++) {
					$date = date('Y') . '-' . date('m') . '-' . $i;

					$json['xaxis'][] = array(date('j', strtotime($date)), date('d', strtotime($date)));
				}
				break;
			case 'year':
				$results = $this->model_customerpartner_dashboard->getTotalOrdersByYear($customer_id);

				foreach ($results as $key => $value) {
					$json['order']['data'][] = array($key, $value['total']);
				}

				$results = $this->model_customerpartner_dashboard->getTotalCustomersByYear($customer_id);

				foreach ($results as $key => $value) {
					$json['customer']['data'][] = array($key, $value['total']);
				}

				for ($i = 1; $i <= 12; $i++) {
					$json['xaxis'][] = array($i, date('M', mktime(0, 0, 0, $i)));
				}
				break;
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
?>
