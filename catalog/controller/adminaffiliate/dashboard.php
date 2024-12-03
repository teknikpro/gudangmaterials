<?php
class ControllerAdminAffiliateDashboard extends Controller {
    public function index() {

        if (!$this->affiliate->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('adminaffiliate/dashboard', '', 'SSL');

			$this->response->redirect($this->url->link('adminaffiliate/login', '', 'SSL'));
		}

        // Load model jika diperlukan
        $this->load->model('affiliate/affiliate');
        $affiliate_info = $this->model_affiliate_affiliate->getAffiliate($this->affiliate->getId());
        if($affiliate_info['admin'] != 1){
            $this->affiliate->logout();
            $this->response->redirect($this->url->link('adminaffiliate/login', '', 'SSL'));
        }

        // Menetapkan data untuk view
        $data['heading_title'] = 'Affiliate | Dashboard';

        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";
        $data['logout'] = $this->url->link('adminaffiliate/logout', '', 'SSL');

        $code = $this->affiliate->getCode();
        $this->load->model('affiliate/information');
        $affiliate_id = $this->model_affiliate_information->getIdAffiliate($code);
        $total_klik = $this->model_affiliate_information->getTotalKlikByMonth($affiliate_id);
        $total_transaksi = $this->model_affiliate_information->getTotalTransaksiByMonth($code);
        $jumlah_transaksi = $this->model_affiliate_information->getJumlahTransaksiByMonth();
        $jumlah_komisi = $this->model_affiliate_information->getJumlahKomisiByMonth();

        $productsales = $this->model_affiliate_information->getSalesProduct();
        $komisiinyear = $this->model_affiliate_information->getKomisiLast12Months();

        $data['is_dashboard'] = true;
        $data['total_klik'] = $total_klik;
        $data['total_transaksi'] = $total_transaksi;
        $data['jumlah_transaksi'] = $jumlah_transaksi;
        $data['jumlah_komisi'] = $jumlah_komisi;
        $data['productsales'] = $productsales;
        $data['chart_data'] = json_encode($komisiinyear);

		$data['header'] = $this->load->controller('adminaffiliate/header', $data);
        $data['sidebar'] = $this->load->controller('adminaffiliate/sidebar', $data);
        $data['navbar'] = $this->load->controller('adminaffiliate/navbar', $data);
        $data['footer'] = $this->load->controller('adminaffiliate/footer', $data);
        // Data lain yang ingin ditampilkan

        // Load template untuk halaman affiliate
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/adminaffiliate/dashboard.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/adminaffiliate/dashboard.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/adminaffiliate/dashboard.tpl', $data));
		}
    }
}
?>
