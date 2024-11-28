<?php
class ControllerAffiliateTransaksi extends Controller {
    public function index() {

        if (!$this->affiliate->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('affiliate/transaksi', '', 'SSL');

			$this->response->redirect($this->url->link('affiliate/login', '', 'SSL'));
		}

        $data['heading_title'] = 'Affiliate | Transaksi Anda';

        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";

        $this->load->model('affiliate/information');
        $transaction_product = $this->model_affiliate_information->getDetailAllTransactions();
        $data['transactions'] = $transaction_product;

        // template
		$data['header'] = $this->load->controller('common/header_affiliate', $data);
        $data['footer'] = $this->load->controller('common/footer_affiliate');

        // Load template untuk halaman affiliate
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/affiliate/transaksi.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/affiliate/transaksi.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/affiliate/transaksi.tpl', $data));
		}
    }
}
?>
