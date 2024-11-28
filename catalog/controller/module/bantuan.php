<?php  
class ControllerModuleBantuan extends Controller {
	public function index() {
		$this->language->load('module/bantuan');
		$this->load->model('extension/bantuan');
		
		$filter_data = array(
			'page' => 1,
			'limit' => 10,
			'start' => 0,
		);
	 
		$data['heading_title'] = $this->language->get('heading_title');
	 
		$all_bantuan = $this->model_extension_bantuan->getAllbantuan($filter_data);
	 
		$data['all_bantuan'] = array();
	 
		foreach ($all_bantuan as $bantuan) {
			$data['all_bantuan'][] = array (
				'title' 		=> html_entity_decode($bantuan['title'], ENT_QUOTES),
				'description' 	=> (utf8_strlen(strip_tags(html_entity_decode($bantuan['short_description'], ENT_QUOTES))) > 50 ? utf8_substr(strip_tags(html_entity_decode($bantuan['short_description'], ENT_QUOTES)), 0, 50) . '...' : strip_tags(html_entity_decode($bantuan['short_description'], ENT_QUOTES))),
				'view' 			=> $this->url->link('information/bantuan/bantuan', 'bantuan_id=' . $bantuan['bantuan_id']),
				'date_added' 	=> date($this->language->get('date_format_short'), strtotime($bantuan['date_added']))
			);
		}
	 
		if (version_compare(VERSION, '2.2.0.0', '<')) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/bantuan.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/bantuan.tpl', $data);
			} else {
				return $this->load->view('default/template/module/bantuan.tpl', $data);
			}
		} else {
			return $this->load->view('module/bantuan', $data);
		}
	}
}