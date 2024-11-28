<?php
class ControllerAffiliateHome extends Controller {
    public function index() {
        // Mengambil data dari model atau setting
        $this->load->language('affiliate/home');

        // Load model jika diperlukan
        $this->load->model('affiliate/affiliate');

        // Menetapkan data untuk view
        $data['heading_title'] = 'Affiliate Home';
        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/";
        $data['link_register'] = "https://gudangmaterials.id/index.php?route=affiliate/register";
        // Data lain yang ingin ditampilkan

        // Load template untuk halaman affiliate
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/affiliate/home.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/affiliate/home.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/affiliate/home.tpl', $data));
		}
    }
}
?>
