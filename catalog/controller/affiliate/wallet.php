<?php
class ControllerAffiliateWallet extends Controller {
    public function index() {

        if (!$this->affiliate->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('affiliate/wallet', '', 'SSL');

			$this->response->redirect($this->url->link('affiliate/login', '', 'SSL'));
		}

        // Load model jika diperlukan
        $this->load->model('affiliate/affiliate');

        // Menetapkan data untuk view
        $data['heading_title'] = 'Affiliate | Wallet';

        $code = $this->affiliate->getCode();
        $this->load->model('affiliate/information');
        $affiliate_id = $this->model_affiliate_information->getIdAffiliate($code);
        $pemasukan = $this->model_affiliate_information->getPemasukanAffiliate($affiliate_id);
        $pengeluaran = $this->model_affiliate_information->getPengeluaranAffiliate($affiliate_id);
        $saldo = ($pemasukan - $pengeluaran);
        $data['action'] = "https://gudangmaterials.id/index.php?route=affiliate/konfirmtarik";

        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";
        $data['link_riwayat'] = $this->url->link('affiliate/riwayattarik', '', 'SSL');
        $data['saldo'] = number_format($saldo, 0, ',', '.');

        $data['is_tarik_komisi'] = true;
        
        // template
		$data['header'] = $this->load->controller('common/header_affiliate', $data);
        $data['footer'] = $this->load->controller('common/footer_affiliate', $data);
        // Data lain yang ingin ditampilkan

        // Load template untuk halaman affiliate
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/affiliate/wallet.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/affiliate/wallet.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/affiliate/wallet.tpl', $data));
		}
    }
}
?>
