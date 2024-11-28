<?php
class ControllerCommonFooterAffiliate extends Controller {
	public function index($data = array()) {

		$data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/affiliate/footer.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/affiliate/footer.tpl', $data);
		} else {
			return $this->load->view('default/template/affiliate/footer.tpl', $data);
		}
	}
}