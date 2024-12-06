<?php
class ControllerAdminAffiliateVerifikasi extends Controller {
    public function index() {

        if (!$this->affiliate->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('adminaffiliate/dashboard', '', 'SSL');

			$this->response->redirect($this->url->link('adminaffiliate/login', '', 'SSL'));
		}

        $this->load->model('affiliate/affiliate');
        $affiliate_info = $this->model_affiliate_affiliate->getAffiliate($this->affiliate->getId());
        if($affiliate_info['admin'] != 1){
            $this->affiliate->logout();
            $this->response->redirect($this->url->link('adminaffiliate/login', '', 'SSL'));
        }

        // Menetapkan data untuk view
        $data['heading_title'] = 'Affiliate | Verfikasi Afiliator';

        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";
        $data['logout'] = $this->url->link('adminaffiliate/logout', '', 'SSL');

        $this->load->model('affiliate/information');
        if($_SERVER['REQUEST_METHOD'] == 'POST'){

            $affiliate_id = $this->request->post['affiliate_id'];
            $lasan = $this->request->post['alasan'];
            if($lasan){

                $this->model_affiliate_information->tolakVerifikasi($affiliate_id, $lasan);

            }else {

                $this->model_affiliate_information->verifikasiData($affiliate_id);
            }

            $this->session->data['success'] = "Data berhasil diubah";
            $this->response->redirect($this->url->link('adminaffiliate/afiliator', '', 'SSL'));

        }

        $affiliate_id = $_GET['affiliate_id'];
        $affiliator = $this->model_affiliate_information->getDetailAfiliator($affiliate_id);

        $status_notif = isset($_GET['status_notif']) ? $_GET['status_notif'] : null;
        if($status_notif){
            $this->db->query("UPDATE oc_affiliate_notifikasi_admin SET status_baca='1' WHERE id_notifikasi_admin='$status_notif' ");
        }

        $data['afiliator'] = $affiliator;
        $data['action'] = $this->url->link('adminaffiliate/verifikasi', '', 'SSL');
		$data['header'] = $this->load->controller('adminaffiliate/header', $data);
        $data['sidebar'] = $this->load->controller('adminaffiliate/sidebar', $data);
        $data['navbar'] = $this->load->controller('adminaffiliate/navbar', $data);
        $data['footer'] = $this->load->controller('adminaffiliate/footer', $data);
        // Data lain yang ingin ditampilkan

        // Load template untuk halaman affiliate
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/adminaffiliate/verifikasi.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/adminaffiliate/verifikasi.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/adminaffiliate/verifikasi.tpl', $data));
		}
    }
}
?>
