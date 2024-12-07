<?php
class ControllerAdminAffiliateAturkomisi extends Controller {
    public function index() {

        if (!$this->affiliate->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('adminaffiliate/aturkomisi', '', 'SSL');

			$this->response->redirect($this->url->link('adminaffiliate/login', '', 'SSL'));
		}

        $this->load->model('affiliate/affiliate');
        $affiliate_info = $this->model_affiliate_affiliate->getAffiliate($this->affiliate->getId());
        if($affiliate_info['admin'] != 1){
            $this->affiliate->logout();
            $this->response->redirect($this->url->link('adminaffiliate/login', '', 'SSL'));
        }

        $data['heading_title'] = 'Affiliate | Atur Komisi';

        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";
        $data['logout'] = $this->url->link('adminaffiliate/logout', '', 'SSL');

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $id_affiliate_member = $_POST['id_affiliate_member'];
            $komisi = $_POST['komisi'];

            if ($id_affiliate_member && is_numeric($komisi)) {
                $this->db->query("UPDATE oc_affiliate_member SET tarif_komisi=$komisi WHERE id_affiliate_member='$id_affiliate_member' ");
                $this->session->data['success'] = "Komisi berhasil diubah";
            }
        }
        

        if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

        $this->load->model('affiliate/information');
        $members = $this->model_affiliate_information->getKomisiMember();

        $data['members'] = $members;
        $data['action'] = $this->url->link('adminaffiliate/aturkomisi', '', 'SSL');
		$data['header'] = $this->load->controller('adminaffiliate/header', $data);
        $data['sidebar'] = $this->load->controller('adminaffiliate/sidebar', $data);
        $data['navbar'] = $this->load->controller('adminaffiliate/navbar', $data);
        $data['footer'] = $this->load->controller('adminaffiliate/footer', $data);
        // Data lain yang ingin ditampilkan

        // Load template untuk halaman affiliate
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/adminaffiliate/aturkomisi.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/adminaffiliate/aturkomisi.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/adminaffiliate/aturkomisi.tpl', $data));
		}
    }
}
?>
