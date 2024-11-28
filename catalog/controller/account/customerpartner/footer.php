<?php
class ControllerAccountCustomerpartnerFooter extends Controller {
	public function index() {
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/customerpartner/footer.tpl')) {
		  return $this->load->view($this->config->get('config_template') . '/template/account/customerpartner/footer.tpl');
		} else {
		  return $this->load->view('default/template/account/customerpartner/footer.tpl');
		}
	}
}
