<?php
class ControllerCustomerpartnerCategorymapping extends Controller {

	private $error = array();
	private $data = array();

  	public function index() {

  		$data = array_merge($this->load->language('customerpartner/categorymapping'));

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('customerpartner/categorymapping');

		if (isset($this->request->get['filter_attribute'])) {
			$filter_attribute = $this->request->get['filter_attribute'];
		} else {
			$filter_attribute = null;
		}

		if (isset($this->request->get['filter_attribute_id'])) {
			$filter_attribute_id = $this->request->get['filter_attribute_id'];
		} else {
			$filter_attribute_id = null;
		}

		if (isset($this->request->get['filter_category'])) {
			$filter_category = $this->request->get['filter_category'];
		} else {
			$filter_category = null;
		}

		if (isset($this->request->get['filter_category_id'])) {
			$filter_category_id = $this->request->get['filter_category_id'];
		} else {
			$filter_category_id = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'pd.name';
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

		if (isset($this->request->get['filter_attribute'])) {
			$url .= '&filter_attribute=' . urlencode(html_entity_decode($this->request->get['filter_attribute'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_attribute_id'])) {
			$url .= '&filter_attribute_id=' . urlencode(html_entity_decode($this->request->get['filter_attribute_id'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_category'])) {
			$url .= '&filter_category=' . urlencode(html_entity_decode($this->request->get['filter_category'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_category_id'])) {
			$url .= '&filter_category_id=' . urlencode(html_entity_decode($this->request->get['filter_category_id'], ENT_QUOTES, 'UTF-8'));
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

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('customerpartner/categorymapping', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);

		$data['insert'] = $this->url->link('customerpartner/categorymapping/add', 'token=' . $this->session->data['token'] . $url . '&mpcheck=1', 'SSL');

		$data['delete'] = $this->url->link('customerpartner/categorymapping/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['categories'] = array();

		$filterData = array(
			'filter_attribute'	  => $filter_attribute,
			'filter_category' => $filter_category,
			'filter_category_id' => $filter_category_id,
			'filter_attribute_id' => $filter_attribute_id,
			'sort'            => $sort,
			'order'           => $order,
			'start'           => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'           => $this->config->get('config_limit_admin')
		);

		$this->load->model('tool/image');

		$this->load->model('customerpartner/partner');

		$data['partners'] = $this->model_customerpartner_partner->getCustomers();

		$categorymapping_total = $this->model_customerpartner_categorymapping->getTotalCategoryAttributes($filterData);

		$results = $this->model_customerpartner_categorymapping->getCategoryAttributes($filterData);

		if ($results) {
			foreach ($results as $result) {
					$attribute_name = '';

					foreach (explode(',',$result['attribute_id']) as $key => $value) {

						$attribute_name .= $this->model_customerpartner_categorymapping->getAttributeName($value)['name'].', ';

					}

					$attribute_name = rtrim($attribute_name,', ');

	      	$data['categories'][] = array(
					'category_id' => $result['category_id'],
					'attribute_id' => $result['attribute_id'],
					'name'       => $result['name'],
					'attribute_name'       => $attribute_name,
					'selected'   => isset($this->request->post['selected']) && in_array($result['category_id'], $this->request->post['selected']),
					'action'	=> $this->url->link('customerpartner/categorymapping/add', 'token=' . $this->session->data['token'] . '&category_id=' . $result['category_id'] .'&attribute_id='.$result['attribute_id'] , 'SSL')
				);
	    }
		}

 		$data['token'] = $this->session->data['token'];

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} elseif(isset($this->session->data['warning']) && $this->session->data['warning']) {
			$data['error_warning'] = $this->session->data['warning'];
			unset($this->session->data['warning']);
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

		if (isset($this->request->get['filter_attribute'])) {
			$url .= '&filter_attribute=' . urlencode(html_entity_decode($this->request->get['filter_attribute'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_category'])) {
			$url .= '&filter_category=' . urlencode(html_entity_decode($this->request->get['filter_category'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_category_id'])) {
			$url .= '&filter_category_id=' . urlencode(html_entity_decode($this->request->get['filter_category_id'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_attribute_id'])) {
			$url .= '&filter_attribute_id=' . urlencode(html_entity_decode($this->request->get['filter_attribute_id'], ENT_QUOTES, 'UTF-8'));
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$url = '';

		if (isset($this->request->get['filter_attribute'])) {
			$url .= '&filter_attribute=' . urlencode(html_entity_decode($this->request->get['filter_attribute'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_category'])) {
			$url .= '&filter_category=' . urlencode(html_entity_decode($this->request->get['filter_category'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_category_id'])) {
			$url .= '&filter_category_id=' . urlencode(html_entity_decode($this->request->get['filter_category_id'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_attribute_id'])) {
			$url .= '&filter_attribute_id=' . urlencode(html_entity_decode($this->request->get['filter_attribute_id'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		$pagination = new Pagination();
		$pagination->total = $categorymapping_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('customerpartner/categorymapping', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();
		$data['results'] = sprintf($this->language->get('text_pagination'), ($categorymapping_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($categorymapping_total - $this->config->get('config_limit_admin'))) ? $categorymapping_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $categorymapping_total, ceil($categorymapping_total / $this->config->get('config_limit_admin')));

		$data['filter_attribute'] = $filter_attribute;

		$data['filter_category'] = $filter_category;

		$data['filter_category_id'] = $filter_category_id;

		$data['filter_attribute_id'] = $filter_attribute_id;

		$data['sort'] = $sort;

		$data['header'] = $this->load->controller('common/header');

		$data['footer'] = $this->load->controller('common/footer');

		$data['column_left'] = $this->load->controller('common/column_left');

		$this->response->setOutput($this->load->view('customerpartner/categorymapping_list.tpl',$data));
  	}

  	public function add() {

  		$data = array_merge($this->load->language('customerpartner/categorymapping'));

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('customerpartner/categorymapping');

		$this->load->model('catalog/category');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->model_customerpartner_categorymapping->addCategoryAttribute($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('customerpartner/categorymapping', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['token'] = $this->session->data['token'];

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$url = '';

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('customerpartner/categorymapping', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);

   		if($this->request->server['REQUEST_METHOD'] != 'POST' && isset($this->request->get['category_id']) && $this->request->get['category_id']) {

   			$category_details = $this->model_catalog_category->getCategory($this->request->get['category_id']);

			$data['product_categories'][] = array(
				'category_id' => $this->request->get['category_id'],
				'name'		=> isset($category_details['name']) && $category_details['name'] ? $category_details['name'] : '',
			);

			if (isset($this->request->get['attribute_id'])) {

				$data['attribute_id'] = array();

				foreach (explode(',', $this->request->get['attribute_id']) as $key => $value) {

					$attribute_details = $this->model_customerpartner_categorymapping->getAttributeName($value);

					$data['attributes'][] = array(
						'attribute_id' => $value,
						'name'		  => isset($attribute_details['name']) && $attribute_details['name'] ? $attribute_details['name'] : 'All',
					);
				}
			}
		}

    	$data['cancel'] = $this->url->link('customerpartner/categorymapping', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['save'] = $this->url->link('customerpartner/categorymapping/add', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['header'] = $this->load->controller('common/header');

		$data['footer'] = $this->load->controller('common/footer');

		$data['column_left'] = $this->load->controller('common/column_left');

		$this->response->setOutput($this->load->view('customerpartner/categorymapping_form.tpl',$data));
	}

	public function delete() {

    	$this->load->language('customerpartner/categorymapping');

    	$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('customerpartner/categorymapping');

		if ($this->validateDelete()) {

			$this->model_customerpartner_categorymapping->deleteCategoryAttribute(implode(',', $this->request->post['selected']));

			$this->session->data['success'] = $this->language->get('text_success_delete');
		}

    	$this->index();
  	}

  	private function validateDelete() {

    	if (!$this->user->hasPermission('modify', 'customerpartner/categorymapping')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}

    	if (!isset($this->request->post['selected']) || !$this->request->post['selected']) {
      		$this->session->data['warning'] = $this->language->get('error_delete');
					return false;
    	}

		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  	}

  	private function validateForm(){

  		if (!$this->user->hasPermission('modify', 'customerpartner/category')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}

    	if (!isset($this->request->post['attribute_ids']) || !isset($this->request->post['product_category']) || !$this->request->post['attribute_ids'] || !$this->request->post['product_category']) {
      		$this->error['warning'] = $this->language->get('error_field');
    	}

		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  }

	public function categoryAttribute() {
		$json = array();

		if (isset($this->request->get['category_id']) && $this->request->get['category_id']) {
			$this->load->model('customerpartner/categorymapping');

			$results = $this->model_customerpartner_categorymapping->getCategoryAttribute($this->request->get['category_id']);

			if ($results) {
				foreach ($results as $result) {
					$json[] = array(
						'attribute_id'    => $result['attribute_id'],
						'name'            => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
						'attribute_group' => $result['attribute_group']
					);
				}
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->setOutput(json_encode($json));
	}
}
?>
