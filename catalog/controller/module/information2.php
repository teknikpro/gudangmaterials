<?php
class ControllerModuleInformation2 extends Controller {
	public function index() {
		$this->load->language('module/information2');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_sitemap'] = $this->language->get('text_sitemap');

		$this->load->model('catalog/information2');

		$data['informations'] = array();

		foreach ($this->model_catalog_information2->getInformations() as $result) {
			$data['informations'][] = array(
				'title' => $result['title'],
				'href'  => $this->url->link('information/information2', 'information_id=' . $result['information_id'])
			);
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['sitemap'] = $this->url->link('information/sitemap');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/information2.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/information2.tpl', $data);
		} else {
			return $this->load->view('default/template/module/information.tpl', $data);
		}
	}
}