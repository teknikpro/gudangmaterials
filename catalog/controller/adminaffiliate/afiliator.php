<?php
class ControllerAdminAffiliateAfiliator extends Controller {
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
        $data['heading_title'] = 'Affiliate | Daftar Afiliator';

        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";
        $data['logout'] = $this->url->link('adminaffiliate/logout', '', 'SSL');

        if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

        $this->load->model('affiliate/information');
        $affiliators = $this->model_affiliate_information->getAllAfiliator();

        $data['affiliators'] = $affiliators;
        $data['action'] = $this->url->link('adminaffiliate/verifikasi', '', 'SSL');
		$data['header'] = $this->load->controller('adminaffiliate/header', $data);
        $data['sidebar'] = $this->load->controller('adminaffiliate/sidebar', $data);
        $data['navbar'] = $this->load->controller('adminaffiliate/navbar', $data);
        $data['footer'] = $this->load->controller('adminaffiliate/footer', $data);
        // Data lain yang ingin ditampilkan

        // Load template untuk halaman affiliate
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/adminaffiliate/afiliator.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/adminaffiliate/afiliator.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/adminaffiliate/afiliator.tpl', $data));
		}
    }
}
?>
