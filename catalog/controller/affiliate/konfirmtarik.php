<?php
class ControllerAffiliateKonfirmTarik extends Controller {


    public function index() {

        if (!$this->affiliate->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('affiliate/konfirmtarik', '', 'SSL');

			$this->response->redirect($this->url->link('affiliate/login', '', 'SSL'));
		}

        // Load model jika diperlukan
        $this->load->model('affiliate/affiliate');

        // Menetapkan data untuk view
        $data['heading_title'] = 'Affiliate | Konfirmasi Penarikan';

        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";
        $data['backwallet'] = $this->url->link('affiliate/wallet');

        $code = $this->affiliate->getCode();
        $this->load->model('affiliate/information');
        $affiliate_id = $this->model_affiliate_information->getIdAffiliate($code);
        $pemasukan = $this->model_affiliate_information->getPemasukanAffiliate($affiliate_id);
        $pengeluaran = $this->model_affiliate_information->getPengeluaranAffiliate($affiliate_id);
        $saldo = ($pemasukan - $pengeluaran);

        $bankinfo = $this->model_affiliate_information->getProfile();

        $namabank = $bankinfo['bank_name'];
        $namarekening = $bankinfo['bank_account_name'];
        $nomorrekening = $bankinfo['bank_account_number'];
        if (empty($namabank) && empty($namarekening) && empty($nomorrekening)) {
            $this->session->data['warning'] = "Silahkan isi dulu metode pembayaran yang akan digunakan";
            $this->response->redirect($this->url->link('affiliate/payment', '', 'SSL'));
        }

        if($_SERVER['REQUEST_METHOD'] == 'POST'){

            $errors = [];

            if (!isset($this->request->post['jumlah']) || 
                !is_numeric($this->request->post['jumlah']) || 
                $this->request->post['jumlah'] < 10000) {
                $errors['jumlah'] = 'minimal penarikan 10.000!';
            } elseif ($this->request->post['jumlah'] > $saldo) {
                $errors['jumlah'] = 'penarikan tidak boleh melebihi saldo Anda!';
            }

            if (!empty($errors)) {
                $this->session->data['errors'] = $errors;
    
                $this->response->redirect($this->url->link('affiliate/wallet', '', true));
            }

            $data['jumlah'] = $this->request->post['jumlah'];
            $data['tanggal'] = date('d F Y');
            $data['bankinfo'] = $bankinfo;


        }else {
            echo "Tidak ada data yang dikirim."; 
        }


        
        // template
		$data['header'] = $this->load->controller('common/header_affiliate', $data);
        $data['footer'] = $this->load->controller('common/footer_affiliate');
        // Data lain yang ingin ditampilkan

        // Load template untuk halaman affiliate
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/affiliate/konfirmtarik.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/affiliate/konfirmtarik.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/affiliate/konfirmtarik.tpl', $data));
		}
    }

}
?>
