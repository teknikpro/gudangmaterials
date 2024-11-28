<?php
class ControllerCommonHeaderAffiliate extends Controller {
	public function index($data = array()) {

		$this->load->model('affiliate/information');
        $member = $this->model_affiliate_information->getTarifKomisiByMember();
		$profile = $this->model_affiliate_information->getProfile();
		$code = $this->affiliate->getCode();
		$affiliate_id = $this->model_affiliate_information->getIdAffiliate($code);
		$jumlah_notif = $this->model_affiliate_information->getJumlahNotifikasiUser($affiliate_id);
		$notifikasi = $this->model_affiliate_information->getNotifikasiUser($affiliate_id);
	
		$data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";

		$data['fullname'] = $profile['firstname'] ." " . $profile['lastname'];
		$data['status_member'] = $member['member'];
		$data['jumlah_notif'] = $jumlah_notif;
		$data['notifikasi'] = $notifikasi;

		$data['link_member'] = $this->url->link('affiliate/member', '', 'SSL');
		$data['link_dashboard'] = $this->url->link('affiliate/dashboard', '', 'SSL');
		$data['link_profile'] = $this->url->link('affiliate/profile', '', 'SSL');
		$data['link_settings'] = $this->url->link('affiliate/settings', '', 'SSL');
		$data['link_notifikasi'] = $this->url->link('affiliate/notifikasi', '', 'SSL');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/affiliate/header.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/affiliate/header.tpl', $data);
		} else {
			return $this->load->view('default/template/affiliate/header.tpl', $data);
		}
	}
}