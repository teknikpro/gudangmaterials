<?php  
class ControllerModuleNews extends Controller {
	public function index() {
		$this->language->load('module/news');
		$this->load->model('extension/news');
		
		$filter_data = array(
			'page' => 1,
			'limit' => 10,
			'start' => 0,
		);
	 
		$data['heading_title'] = $this->language->get('heading_title');
	 
		$all_news = $this->model_extension_news->getAllNews($filter_data);
	 
		$data['all_news'] = array();
	 
		foreach ($all_news as $news) {
			$data['all_news'][] = array (
				'title' 		=> html_entity_decode($news['title'], ENT_QUOTES),
				'description' 	=> (utf8_strlen(strip_tags(html_entity_decode($news['short_description'], ENT_QUOTES))) > 50 ? utf8_substr(strip_tags(html_entity_decode($news['short_description'], ENT_QUOTES)), 0, 50) . '...' : strip_tags(html_entity_decode($news['short_description'], ENT_QUOTES))),
				'view' 			=> $this->url->link('information/news/news', 'news_id=' . $news['news_id']),
				'date_added' 	=> date($this->language->get('date_format_short'), strtotime($news['date_added']))
			);
		}
	 
		if (version_compare(VERSION, '2.2.0.0', '<')) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/news.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/news.tpl', $data);
			} else {
				return $this->load->view('default/template/module/news.tpl', $data);
			}
		} else {
			return $this->load->view('module/news', $data);
		}
	}
}