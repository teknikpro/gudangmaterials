<?php
class ControllerAdminAffiliateSidebar extends Controller {
    public function index($data = array()) {
        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";
        $data['logout'] = $this->url->link('adminaffiliate/logout', '', 'SSL');
        $data['dashboard'] = $this->url->link('adminaffiliate/dashboard', '', 'SSL');
        $data['afiliator'] = $this->url->link('adminaffiliate/afiliator', '', 'SSL');
        $data['transaksi'] = $this->url->link('adminaffiliate/transaksi', '', 'SSL');
        $data['tarikdana'] = $this->url->link('adminaffiliate/tarikdana', '', 'SSL');

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/adminaffiliate/sidebar.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/adminaffiliate/sidebar.tpl', $data);
        } else {
            return $this->load->view('default/template/adminaffiliate/sidebar.tpl', $data);
        }
    }
}
?>
