<?php
class ControllerAdminAffiliateLogout extends Controller {
	public function index() {
		if ($this->affiliate->isLogged()) {
			$this->affiliate->logout();

			$this->response->redirect($this->url->link('adminaffiliate/logout', '', 'SSL'));
		}

		$this->load->language('affiliate/logout');

		$this->document->setTitle($this->language->get('heading_title'));
		$data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";
		$data['login'] = $this->url->link('adminaffiliate/login', '', 'SSL');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/adminaffiliate/logout.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/adminaffiliate/logout.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/adminaffiliate/logout.tpl', $data));
		}
	}
}