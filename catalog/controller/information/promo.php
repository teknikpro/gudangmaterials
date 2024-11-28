<?php
class ControllerInformationPromo extends Controller {
	public function index() {
		$this->language->load('information/promo');
		
		$this->load->model('extension/promo');
	 
		$this->document->setTitle($this->language->get('heading_title')); 
	 
		$data['breadcrumbs'] = array();
		
		$data['breadcrumbs'][] = array(
			'text' 		=> $this->language->get('text_home'),
			'href' 		=> $this->url->link('common/home')
		);
		$data['breadcrumbs'][] = array(
			'text' 		=> $this->language->get('heading_title'),
			'href' 		=> $this->url->link('information/promo')
		);
		  
		$url = '';
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}	

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}
		
		$filter_data = array(
			'page' 	=> $page,
			'limit' => 10,
			'start' => 10 * ($page - 1),
		);
		
		$total = $this->model_extension_promo->getTotalpromo();
		
		$pagination = new Pagination();
		$pagination->total = $total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->url = $this->url->link('information/promo', 'page={page}');
		
		$data['pagination'] = $pagination->render();
	 
		$data['results'] = sprintf($this->language->get('text_pagination'), ($total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($total - 10)) ? $total : ((($page - 1) * 10) + 10), $total, ceil($total / 10));

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_title'] = $this->language->get('text_title');
		$data['text_description'] = $this->language->get('text_description');
		$data['text_date'] = $this->language->get('text_date');
		$data['text_view'] = $this->language->get('text_view');
	 
		$all_promo = $this->model_extension_promo->getAllpromo($filter_data);
	 
		$data['all_promo'] = array();
		
		$this->load->model('tool/image');
	 
		foreach ($all_promo as $promo) {
			$data['all_promo'][] = array (
				'title' 		=> html_entity_decode($promo['title'], ENT_QUOTES),
				'image'			=> $this->model_tool_image->resize($promo['image'], 100, 100),
				'description' 	=> (utf8_strlen(strip_tags(html_entity_decode($promo['short_description'], ENT_QUOTES))) > 50 ? utf8_substr(strip_tags(html_entity_decode($promo['short_description'], ENT_QUOTES)), 0, 50) . '...' : strip_tags(html_entity_decode($promo['short_description'], ENT_QUOTES))),
				'view' 			=> $this->url->link('information/promo/promo', 'promo_id=' . $promo['promo_id']),
				'date_added' 	=> date($this->language->get('date_format_short'), strtotime($promo['date_added']))
			);
		}
	 
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (version_compare(VERSION, '2.2.0.0', '<')) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/promo_list.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/promo_list.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/information/promo_list.tpl', $data));
			}
		} else {
			$this->response->setOutput($this->load->view('information/promo_list', $data));
		}
	}
 
	public function promo() {
		$this->load->model('extension/promo');
	  
		$this->language->load('information/promo');
 
		if (isset($this->request->get['promo_id']) && !empty($this->request->get['promo_id'])) {
			$promo_id = $this->request->get['promo_id'];
		} else {
			$promo_id = 0;
		}
 
		$promo = $this->model_extension_promo->getpromo($promo_id);
 
		$data['breadcrumbs'] = array();
	  
		$data['breadcrumbs'][] = array(
			'text' 			=> $this->language->get('text_home'),
			'href' 			=> $this->url->link('common/home')
		);
	  
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/promo')
		);
 
		if ($promo) {
			$data['breadcrumbs'][] = array(
				'text' 		=> $promo['title'],
				'href' 		=> $this->url->link('information/promo/promo', 'promo_id=' . $promo_id)
			);
 
			$this->document->setTitle($promo['title']);
			
			$this->load->model('tool/image');
			
			$data['image'] = $this->model_tool_image->resize($promo['image'], 200, 200);
 
			$data['heading_title'] = html_entity_decode($promo['title'], ENT_QUOTES);
			$data['description'] = html_entity_decode($promo['description'], ENT_QUOTES);
	 
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (version_compare(VERSION, '2.2.0.0', '<')) {
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/promo.tpl')) {
					$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/promo.tpl', $data));
				} else {
					$this->response->setOutput($this->load->view('default/template/information/promo.tpl', $data));
				}
			} else {
				$this->response->setOutput($this->load->view('information/promo', $data));
			}
		} else {
			$data['breadcrumbs'][] = array(
				'text' 		=> $this->language->get('text_error'),
				'href' 		=> $this->url->link('information/promo', 'promo_id=' . $promo_id)
			);
	 
			$this->document->setTitle($this->language->get('text_error'));
	 
			$data['heading_title'] = $this->language->get('text_error');
			$data['text_error'] = $this->language->get('text_error');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['continue'] = $this->url->link('common/home');
	 
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			if (version_compare(VERSION, '2.2.0.0', '<')) {
				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
					$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/error/not_found.tpl', $data));
				} else {
					$this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
				}
			} else {
				$this->response->setOutput($this->load->view('error/not_found', $data));
			}
		}
	}
}