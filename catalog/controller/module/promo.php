<?php  
class ControllerModulePromo extends Controller {
	public function index() {
		$this->language->load('module/promo');
		$this->load->model('extension/promo');
		
		$filter_data = array(
			'page' => 1,
			'limit' => 10,
			'start' => 0,
		);
	 
		$data['heading_title'] = $this->language->get('heading_title');
	 
		$all_promo = $this->model_extension_promo->getAllpromo($filter_data);
	 
		$data['all_promo'] = array();
	 
		foreach ($all_promo as $promo) {
			$data['all_promo'][] = array (
				'title' 		=> html_entity_decode($promo['title'], ENT_QUOTES),
				'description' 	=> (utf8_strlen(strip_tags(html_entity_decode($promo['short_description'], ENT_QUOTES))) > 50 ? utf8_substr(strip_tags(html_entity_decode($promo['short_description'], ENT_QUOTES)), 0, 50) . '...' : strip_tags(html_entity_decode($promo['short_description'], ENT_QUOTES))),
				'view' 			=> $this->url->link('information/promo/promo', 'promo_id=' . $promo['promo_id']),
				'date_added' 	=> date($this->language->get('date_format_short'), strtotime($promo['date_added']))
			);
		}
	 
		if (version_compare(VERSION, '2.2.0.0', '<')) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/promo.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/promo.tpl', $data);
			} else {
				return $this->load->view('default/template/module/promo.tpl', $data);
			}
		} else {
			return $this->load->view('module/promo', $data);
		}
	}
}