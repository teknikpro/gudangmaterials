<?php
class ControllerCustomerpartnerKonfirmasiOngkir extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('customerpartner/order');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('customerpartner/konfirmasiongkir');

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['filter_order_id'])) {
			$filter_order_id = $this->request->get['filter_order_id'];
		} else {
			$filter_order_id = null;
		}

		if (isset($this->request->get['filter_customer'])) {
			$filter_customer = $this->request->get['filter_customer'];
		} else {
			$filter_customer = null;
		}

		if (isset($this->request->get['filter_order_status'])) {
			$filter_order_status = $this->request->get['filter_order_status'];
		} else {
			$filter_order_status = null;
		}

		if (isset($this->request->get['filter_order_access'])) {
			$filter_order_access = $this->request->get['filter_order_access'];
		} else {
			$filter_order_access = null;
		}

		if (isset($this->request->get['filter_total'])) {
			$filter_total = $this->request->get['filter_total'];
		} else {
			$filter_total = null;
		}

		if (isset($this->request->get['filter_date_added'])) {
			$filter_date_added = $this->request->get['filter_date_added'];
		} else {
			$filter_date_added = null;
		}

		if (isset($this->request->get['filter_date_modified'])) {
			$filter_date_modified = $this->request->get['filter_date_modified'];
		} else {
			$filter_date_modified = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'o.order_id';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$url = '';

		if (isset($this->request->get['filter_order_id'])) {
			$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
		}

		if (isset($this->request->get['filter_customer'])) {
			$url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_order_status'])) {
			$url .= '&filter_order_status=' . $this->request->get['filter_order_status'];
		}

		if (isset($this->request->get['filter_order_access'])) {
			$url .= '&filter_order_access=' . $this->request->get['filter_order_access'];
		}

		if (isset($this->request->get['filter_total'])) {
			$url .= '&filter_total=' . $this->request->get['filter_total'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['filter_date_modified'])) {
			$url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
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
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('customerpartner/order', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$data['orders'] = array();

		$filter_data = array(
			'filter_order_id'      => $filter_order_id,
			'filter_customer'	   => $filter_customer,
			'filter_order_status'  => $filter_order_status,
			'filter_order_access'  => $filter_order_access,
			'filter_total'         => $filter_total,
			'filter_date_added'    => $filter_date_added,
			'filter_date_modified' => $filter_date_modified,
			'sort'                 => $sort,
			'order'                => $order,
			'start'                => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                => $this->config->get('config_limit_admin')
		);

		$order_total = $this->model_customerpartner_konfirmasiongkir->getTotalOrders($filter_data);

		$results = $this->model_customerpartner_konfirmasiongkir->getKonfirmasiData($filter_data);


		foreach ($results as $result) {

			$data['orders'][] = array(
				'cart_id'			=> $result['cart_id'],
				'customer_id'      	=> $result['customer_id'],
				'date_added'		=> date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'seller_id'      	=> $result['seller_id'],
				'firstname'			=> $result['firstname'],
				'lastname'			=> $result['lastname'],
				'approve'			=> $result['approve'],
				'detail'			=> $this->url->link('customerpartner/konfirmasiongkir/detailOngkir', 'token=' . $this->session->data['token'] . '&cart_id='.$result['cart_id'] . '&customer_id='.$result['customer_id'] . '&seller_id='.$result['seller_id'] . $url, 'SSL'),
			);
		}

		$data['access'] = $this->url->link('customerpartner/order/access', 'token=' . $this->session->data['token'] . '&seller_access=0' . $url, 'SSL');
		$data['cancel'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_missing'] = $this->language->get('text_missing');
		$data['text_loading'] = $this->language->get('text_loading');
		$data['text_access'] = $this->language->get('text_access');
		$data['text_notaccess'] = $this->language->get('text_notaccess');

		$data['column_order_id'] = $this->language->get('column_order_id');
		$data['column_customer'] = $this->language->get('column_customer');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_total'] = $this->language->get('column_total');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_date_modified'] = $this->language->get('column_date_modified');
		$data['column_action'] = $this->language->get('column_action');
		$data['column_seller_access'] = $this->language->get('column_seller_access');

		$data['entry_return_id'] = $this->language->get('entry_return_id');
		$data['entry_order_id'] = $this->language->get('entry_order_id');
		$data['entry_customer'] = $this->language->get('entry_customer');
		$data['entry_order_status'] = $this->language->get('entry_order_status');
		$data['entry_total'] = $this->language->get('entry_total');
		$data['entry_date_added'] = $this->language->get('entry_date_added');
		$data['entry_date_modified'] = $this->language->get('entry_date_modified');

		$data['button_invoice_print'] = $this->language->get('button_invoice_print');
		$data['button_shipping_print'] = $this->language->get('button_shipping_print');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_view'] = $this->language->get('button_view');
		$data['button_ip_add'] = $this->language->get('button_ip_add');
		$data['button_access'] = $this->language->get('button_access');
		$data['button_notaccess'] = $this->language->get('button_notaccess');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_save'] = $this->language->get('button_save');

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if (isset($this->request->get['filter_order_id'])) {
			$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
		}

		if (isset($this->request->get['filter_customer'])) {
			$url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_order_status'])) {
			$url .= '&filter_order_status=' . $this->request->get['filter_order_status'];
		}

		if (isset($this->request->get['filter_total'])) {
			$url .= '&filter_total=' . $this->request->get['filter_total'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['filter_date_modified'])) {
			$url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_order'] = $this->url->link('customerpartner/order', 'token=' . $this->session->data['token'] . '&sort=o.order_id' . $url, 'SSL');
		$data['sort_customer'] = $this->url->link('customerpartner/order', 'token=' . $this->session->data['token'] . '&sort=customer' . $url, 'SSL');
		$data['sort_status'] = $this->url->link('customerpartner/order', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
		$data['sort_access'] = $this->url->link('customerpartner/order', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
		$data['sort_total'] = $this->url->link('customerpartner/order', 'token=' . $this->session->data['token'] . '&sort=o.total' . $url, 'SSL');
		$data['sort_date_added'] = $this->url->link('customerpartner/order', 'token=' . $this->session->data['token'] . '&sort=o.date_added' . $url, 'SSL');
		$data['sort_date_modified'] = $this->url->link('customerpartner/order', 'token=' . $this->session->data['token'] . '&sort=o.date_modified' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['filter_order_id'])) {
			$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
		}

		if (isset($this->request->get['filter_customer'])) {
			$url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_order_status'])) {
			$url .= '&filter_order_status=' . $this->request->get['filter_order_status'];
		}

		if (isset($this->request->get['filter_total'])) {
			$url .= '&filter_total=' . $this->request->get['filter_total'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['filter_date_modified'])) {
			$url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $order_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('customerpartner/order', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($order_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($order_total - $this->config->get('config_limit_admin'))) ? $order_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $order_total, ceil($order_total / $this->config->get('config_limit_admin')));

		$data['filter_order_id'] = $filter_order_id;
		$data['filter_customer'] = $filter_customer;
		$data['filter_order_status'] = $filter_order_status;
		$data['filter_order_access'] = $filter_order_access;
		$data['filter_total'] = $filter_total;
		$data['filter_date_added'] = $filter_date_added;
		$data['filter_date_modified'] = $filter_date_modified;

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['store'] = HTTPS_CATALOG;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('customerpartner/ongkir_list.tpl', $data));
	}

	public function detailOngkir() {

		$url = '';
		$this->load->model('customerpartner/konfirmasiongkir');

		if (isset($this->request->get['customer_id'])) {
			$customer_id = (int)$this->request->get['customer_id'];
		} else {
			$customer_id = 0;
		}

		if (isset($this->request->get['seller_id'])) {
			$seller_id = (int)$this->request->get['seller_id'];
		} else {
			$seller_id = 0;
		}

		if (isset($this->request->get['cart_id'])) {
			$cart_id = (int)$this->request->get['cart_id'];
		} else {
			$cart_id = 0;
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => 'Home',
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => 'Konfirmasi Ongkir',
			'href' => $this->url->link('customerpartner/konfirmasiongkir', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$data['cart_id'] = $cart_id;
		$data['customer_id'] = $customer_id;
		$data['seller_id'] = $seller_id;

		$addressCart = $this->model_customerpartner_konfirmasiongkir->getAddressIdFromCart($cart_id);

		$customerData = $this->model_customerpartner_konfirmasiongkir->getDataCustomer($addressCart['destination']);
		$data['customer_firstname'] = $customerData['firstname'];
		$data['customer_lastname'] = $customerData['lastname'];
		$data['customer_telephone'] = $customerData['telephone'];
		$data['customer_address'] = $customerData['address_1'];
		$data['customer_city']	= $customerData['city'];
		$data['customer_prov'] = $customerData['name'];
		$data['customer_postcode'] = $customerData['postcode'];

		$sellerData = $this->model_customerpartner_konfirmasiongkir->getDataSeller($addressCart['origin']);
		$data['seller_firstname'] = $sellerData['firstname'];
		$data['seller_lastname'] = $sellerData['lastname'];
		$data['seller_telephone'] = $sellerData['telephone'];
		$data['seller_address'] = $sellerData['address_1'];
		$data['seller_city'] = $sellerData['city'];
		$data['seller_prov'] = $sellerData['name'];
		$data['seller_postcode'] = $sellerData['postcode'];

		$data['action'] = $this->url->link('customerpartner/konfirmasiongkir/edit', 'token=' . $this->session->data['token'] . '&customer_id=' . $customer_id . $url, 'SSL');


		$products = $this->model_customerpartner_konfirmasiongkir->getDetailKonfirmasi($customer_id);

		$resultArray = array();
		foreach ($products as $row) {
			// Mengonversi data JSON dalam kolom 'option' menjadi array
			$options = json_decode($row['option'], true);
			
			// Mendapatkan kunci dan nilai dari array 'options'
			$keys = array_keys($options);
			$values = array_values($options);

			$idoptionvalues = implode(",", $values);
			
			// Menambahkan kolom 'keyoption' dan 'valueoption' ke dalam baris saat ini
			$row['keyoption'] = $keys;
			$row['valueoption'] = implode(",", $values);

			$hargaspesial = $this->model_customerpartner_konfirmasiongkir->getHargaSpesial($row['product_id']);
			if($hargaspesial){
				$row['hargafinal'] = implode(",", $hargaspesial);
			}else {
				$row['hargafinal'] = $row['price'];
			}

			if($idoptionvalues){
				$hargaoption = $this->model_customerpartner_konfirmasiongkir->getHargaOption($idoptionvalues);
				$row['hargaoption'] = implode(",", $hargaoption);
			}else {
				$row['hargaoption'] = $row['price'];
			}
			
			// Menambahkan baris yang sudah dimodifikasi ke dalam array hasil akhir
			$resultArray[] = $row;
		}

		$data['daftarproducks'] = array();

		foreach ($resultArray as $product) {
			$data['daftarproducks'][] = array(
				'namaproduk'	=> $product['name'],
				'model'			=> $product['model'],
				'quantity'		=> $product['quantity'],
				'harga'			=> number_format($product['hargaoption'] + $product['hargafinal'] ),
				'jumlah'		=> number_format(($product['quantity'] * ($product['hargaoption'] + $product['hargafinal'] )))
			);
		}


		$dataOngkir = $this->model_customerpartner_konfirmasiongkir->getDataOngkir($cart_id);

		$data['optiontukang']	= $dataOngkir['optiontukang'];
		if($dataOngkir['kurir']){
			$data['customer_kurir'] = $dataOngkir['kurir'];
		}else {
			$data['customer_kurir'] = '';
		}
		if($dataOngkir['hargaongkir']){
			$data['customer_ongkir'] = $dataOngkir['hargaongkir'];
		}else {
			$data['customer_ongkir'] = '';
		}
		if($dataOngkir['hargatukang']){
			$data['customer_tukang'] = $dataOngkir['hargatukang'];
		}else {
			$data['customer_tukang'] = '';
		}


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('customerpartner/ongkir_info.tpl', $data));

		
	}

	Public function edit(){
		$this->load->model('customerpartner/konfirmasiongkir');

		$this->session->data['success'] = "Ongkos Kirim Berhasil dibuat";
		$url = '';

		if(isset($this->request->post['ekspedisi'])){
			$data['ekspedisi'] = $this->request->post['ekspedisi'];
		}

		if(isset($this->request->post['harga'])){
			$data['harga'] = $this->request->post['harga'];
		}

		$this->model_customerpartner_konfirmasiongkir->editOngkosKirim($this->request->post);

		$cart_id = $this->request->post['cart_id'];
		$customer_id = $this->request->post['customer_id'];
		$seller_id = $this->request->post['seller_id'];

		$this->response->redirect($this->url->link('customerpartner/konfirmasiongkir', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		
	}


}
