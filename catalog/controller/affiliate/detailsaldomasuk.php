<?php
class ControllerAffiliateDetailSaldoMasuk extends Controller {
    public function index() {

        if (!$this->affiliate->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('affiliate/detailsaldomasuk', '', 'SSL');

			$this->response->redirect($this->url->link('affiliate/login', '', 'SSL'));
		}


        // Load model jika diperlukan
        $this->load->model('affiliate/affiliate');

        // Menetapkan data untuk view
        $data['heading_title'] = 'Affiliate | Detail Saldo Masuk';

        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";
        
        $url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
		$parsed_url = parse_url($url);

        $this->load->model('affiliate/information');

        if (isset($parsed_url['query'])) {
			// Memecah query string menjadi array
			parse_str($parsed_url['query'], $query_params);
			
			// Mengambil nilai dari id_status
			if (isset($query_params['id_status'])) {
				$this->model_affiliate_information->updateStatusNotifikasiUserMasuk($query_params['id_status']);
				$datadetail = $this->model_affiliate_information->getDetailPemasukan($query_params['id_status']);
				$data['datadetail'] = $datadetail; 
				
			}else {

				$this->response->redirect($this->url->link('affiliate/riwayattarik', '', true));

			} 
		} else {
			echo "URL tidak memiliki query string.";
		}


		$data['header'] = $this->load->controller('common/header_affiliate', $data);
        $data['footer'] = $this->load->controller('common/footer_affiliate', $data);
        // Data lain yang ingin ditampilkan

        // Load template untuk halaman affiliate
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/affiliate/detailsaldomasuk.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/affiliate/detailsaldomasuk.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/affiliate/detailsaldomasuk.tpl', $data));
		}
    }
}
?>
