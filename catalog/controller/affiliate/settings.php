<?php
class ControllerAffiliateSettings extends Controller {
    public function index() {

        if (!$this->affiliate->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('affiliate/settings', '', 'SSL');

			$this->response->redirect($this->url->link('affiliate/login', '', 'SSL'));
		}

        // Load model jika diperlukan
        $this->load->model('affiliate/affiliate');

        // Menetapkan data untuk view
        $data['heading_title'] = 'Affiliate | Settings';

        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";
        $data['link_wallet'] = $this->url->link('affiliate/wallet', '', 'SSL');
        $data['link_transaksi'] = $this->url->link('affiliate/transaksi', '', 'SSL');
        $data['link_myaffiliate'] = $this->url->link('affiliate/myaffiliate', '', 'SSL');
        
        // template
		$data['header'] = $this->load->controller('common/header_affiliate', $data);
        $data['footer'] = $this->load->controller('common/footer_affiliate');
        // Data lain yang ingin ditampilkan

        // Load template untuk halaman affiliate
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/affiliate/settings.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/affiliate/settings.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/affiliate/settings.tpl', $data));
		}
    }
}
?>
