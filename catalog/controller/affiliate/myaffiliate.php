<?php
class ControllerAffiliateMyAffiliate extends Controller {
    public function index() {

        if (!$this->affiliate->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('affiliate/myaffiliate', '', 'SSL');

			$this->response->redirect($this->url->link('affiliate/login', '', 'SSL'));
		}

        $data['heading_title'] = 'Affiliate | Affiliate Saya';

        $this->load->model('catalog/product');
        $product_akaru = $this->model_catalog_product->getProduct(334);
        $product_kalsifloor = $this->model_catalog_product->getProduct(614);
        $product_kalsideck = $this->model_catalog_product->getProduct(883);


        $code = $this->affiliate->getCode();
        $link_affiliate = [
            "kalsifloor"    => "https://gudangmaterials.id/index.php?route=product/product&product_id=614&tracking=".$code,
            "kalsideck"     => "https://gudangmaterials.id/index.php?route=product/product&product_id=883&tracking=".$code,
            "akaru"         => "https://gudangmaterials.id/index.php?route=product/product&product_id=334&tracking=".$code,
        ];

        $this->load->model('affiliate/information');
        $tarif_komisi = $this->model_affiliate_information->getTarifKomisiByMember();

        $komisi = [
            "kalsifloor"    => ($tarif_komisi['tarif_komisi'] / 100) * $product_kalsifloor['price'],
            "kalsideck"     => ($tarif_komisi['tarif_komisi'] / 100) * $product_kalsideck['price'],
            "akaru"         => ($tarif_komisi['tarif_komisi'] / 100) * $product_akaru['price'],
        ];

        $affiliate_id = $this->model_affiliate_information->getIdAffiliate($code);
        $total_klik = [
            "kalsifloor"    => $this->model_affiliate_information->getTotalKlik(614, $affiliate_id),
            "kalsideck"     => $this->model_affiliate_information->getTotalKlik(883, $affiliate_id),
            "akaru"         => $this->model_affiliate_information->getTotalKlik(334, $affiliate_id)
        ];

        $transaction_product = $this->model_affiliate_information->getAllTransactionByAffiliate();

        $total_transaksi = [
            "kalsifloor"    => (isset($transaction_product[614]['transaksi']) ? $transaction_product[614]['transaksi'] : 0),
            "kalsideck"     => (isset($transaction_product[883]['transaksi']) ? $transaction_product[883]['transaksi'] : 0),
            "akaru"         => (isset($transaction_product[334]['transaksi']) ? $transaction_product[334]['transaksi'] : 0)
        ];

        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";
        $data['template_image'] = "https://gudangmaterials.id/image/cache/";
        $data['product_akaru'] = $product_akaru;
        $data['product_kalsifloor'] = $product_kalsifloor;
        $data['product_kalsideck'] = $product_kalsideck;
        $data['link_affiliate'] = $link_affiliate;
        $data['tarif_komisi'] = $tarif_komisi;
        $data['komisi'] = $komisi;
        $data['total_klik'] = $total_klik;
        $data['total_transaksi'] = $total_transaksi;
        
        // template
		$data['header'] = $this->load->controller('common/header_affiliate', $data);
        $data['footer'] = $this->load->controller('common/footer_affiliate');
        // Data lain yang ingin ditampilkan

        // Load template untuk halaman affiliate
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/affiliate/myaffiliate.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/affiliate/myaffiliate.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/affiliate/myaffiliate.tpl', $data));
		}
    }
}
?>
