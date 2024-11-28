<?php
class ControllerAffiliateMember extends Controller {
    public function index() {

        if (!$this->affiliate->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('affiliate/member', '', 'SSL');

			$this->response->redirect($this->url->link('affiliate/login', '', 'SSL'));
		}

        // Load model jika diperlukan
        $this->load->model('affiliate/affiliate');

        // Menetapkan data untuk view
        $data['heading_title'] = 'Affiliate | Member';

        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";
        $data['link_tingkatmember'] = "https://gudangmaterials.id/index.php?route=affiliate/tingkatmember";

        $this->load->model('affiliate/information');
        $member = $this->model_affiliate_information->getTarifKomisiByMember();
        $data['status_member'] = $member['member'];
        
        // template
		$data['header'] = $this->load->controller('common/header_affiliate', $data);
        $data['footer'] = $this->load->controller('common/footer_affiliate');
        // Data lain yang ingin ditampilkan

        // Load template untuk halaman affiliate
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/affiliate/member.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/affiliate/member.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/affiliate/member.tpl', $data));
		}
    }
}
?>
