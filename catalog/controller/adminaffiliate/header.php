<?php
class ControllerAdminAffiliateHeader extends Controller {
    public function index($data = array()) {
        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";
        $data['logout'] = $this->url->link('adminaffiliate/logout', '', 'SSL');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/adminaffiliate/header.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/adminaffiliate/header.tpl', $data);
        } else {
            return $this->load->view('default/template/adminaffiliate/header.tpl', $data);
        }
    }
}
?>
