<?php
class ControllerAccountAktivasi extends Controller {


	public function index() {

		$this->load->language('account/success');

		$this->document->setTitle($this->language->get('heading_title'));

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
			'text' => $this->language->get('text_success'),
			'href' => $this->url->link('account/success')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$this->load->model('account/customer_group');

		$cekcode = $this->model_account_customer_group->getCodeAktivasi($this->request->get['code']);

		if($cekcode){
			if($cekcode['status'] == 0){
				$this->model_account_customer_group->updateDataStatus($cekcode['customer_id']);
				$pesansingkat = "Selamat, akun anda sudah aktif. dan bisa menggunakan semua fitur di Gudang Material";
			}else{
				$pesansingkat = "Akun anda sudah terdaftar dan sudah aktif";
			}
		}else {
			$pesansingkat = "Aktivasi gagal silahkan hubungi team Gudang Material, untuk memperbaiki";
		}

		$customer_group_info = $this->model_account_customer_group->getCustomerGroup($this->config->get('config_customer_group_id'));

		if ($customer_group_info && !$customer_group_info['approval']) {
			$data['text_message'] = $pesansingkat;
		} else {
			$data['text_message'] = sprintf($this->language->get('text_approval'), $this->config->get('config_name'), $this->url->link('information/contact'));
		}

		$data['button_continue'] = $this->language->get('button_continue');

		if ($this->cart->hasProducts()) {
			$data['continue'] = $this->url->link('checkout/cart');
		} else {
			//$data['continue'] = $this->url->link('account/account', '', 'SSL');
			  $data['continue'] = $this->url->link('information/information','information_id=24', 'SSL');
		
		
			 
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/aktivasi.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/aktivasi.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/aktivasi.tpl', $data));
		}
	}

}