<?php
class ControllerAffiliateProfile extends Controller {
    public function index() {
        // Mengambil data dari model atau setting
        $this->load->language('affiliate/profile');

        $this->load->model('affiliate/affiliate');

        $data['heading_title'] = 'Affiliate | Profile';
        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";
        $data['link_infopribadi'] = $this->url->link('affiliate/infopribadi', '', 'SSL');
        $data['link_pembayaran'] = $this->url->link('affiliate/pembayaran', '', 'SSL');
        $data['link_password'] = $this->url->link('affiliate/password', '', 'SSL');

        if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

        $data['header'] = $this->load->controller('common/header_affiliate', $data);
        $data['footer'] = $this->load->controller('common/footer_affiliate');

        // Load template untuk halaman affiliate
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/affiliate/profile.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/affiliate/profile.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/affiliate/profile.tpl', $data));
		}
    }
}
?>
