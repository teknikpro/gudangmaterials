<?php
class ControllerAdminAffiliateNavbar extends Controller {
    public function index($data = array()) {
        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";
        $data['logout'] = $this->url->link('adminaffiliate/logout', '', 'SSL');

        $this->load->model('affiliate/information');
        $profile = $this->model_affiliate_information->getProfile();
        $jmlnotifikasi = $this->model_affiliate_information->getJumlahNotifikasiAdmin();
        $notifikasi = $this->model_affiliate_information->getNotifikasiAdmin();
        $pagenotifikasi = $this->url->link('adminaffiliate/notifikasi', '', 'SSL');
        

        $data['fullname'] = $profile['firstname'] . " " . $profile['lastname'];
        $data['jmlnotifikasi'] = $jmlnotifikasi;
        $data['notifikasi'] = $notifikasi;
        $data['pagenotifikasi'] = $pagenotifikasi;

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/adminaffiliate/navbar.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/adminaffiliate/navbar.tpl', $data);
        } else {
            return $this->load->view('default/template/adminaffiliate/navbar.tpl', $data);
        }
    }
}
?>
