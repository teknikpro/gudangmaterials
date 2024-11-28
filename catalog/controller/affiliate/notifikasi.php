<?php
class ControllerAffiliateNotifikasi extends Controller {
    public function index() {

        if (!$this->affiliate->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('affiliate/notifikasi', '', 'SSL');

			$this->response->redirect($this->url->link('affiliate/login', '', 'SSL'));
		}


        // Load model jika diperlukan
        $this->load->model('affiliate/affiliate');

        // Menetapkan data untuk view
        $data['heading_title'] = 'Affiliate | Notifikasi';

        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";

		$this->load->model('affiliate/information');
        $code = $this->affiliate->getCode();
        $affiliate_id = $this->model_affiliate_information->getIdAffiliate($code);
		$notifikasi = $this->model_affiliate_information->getAllNotifikasi($affiliate_id);

        $data['notifikasi'] = $notifikasi;
		$data['header'] = $this->load->controller('common/header_affiliate', $data);
        $data['footer'] = $this->load->controller('common/footer_affiliate', $data);
        // Data lain yang ingin ditampilkan

        // Load template untuk halaman affiliate
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/affiliate/notifikasi.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/affiliate/notifikasi.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/affiliate/notifikasi.tpl', $data));
		}
    }
}
?>
