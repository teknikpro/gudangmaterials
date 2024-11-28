<?php
class ControllerCommonCekresi extends Controller {

	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		$data['heading_title'] = "Cek Resi Pengiriman Barang";
		$data['html2'] = "Cek Resi Pengiriman Barang";

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/html2.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/html2.tpl', $data);
		} else {
			return $this->load->view('default/template/module/html2.tpl', $data);
		}
	}
}