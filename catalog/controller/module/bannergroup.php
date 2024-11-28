<?php  
class ControllerModuleBannerGroup extends Controller {
	public function index($setting) {
		static $module = 0;
		
		$this->load->model('design/banner');
		$this->load->model('tool/image');
		
		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);
		
		$data['banner_num'] = $setting['banner_num'];
		$data['toppadding'] = $setting['toppadding'];
		$data['rightpadding'] = $setting['rightpadding'];
		$data['bottompadding'] = $setting['bottompadding'];
		$data['leftpadding'] = $setting['leftpadding'];
		$data['remove_left'] = $setting['remove_left'];
		$data['remove_right'] = $setting['remove_right'];
		  
		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->nosize($result['image'])
				);
			}
		}
		
		$data['module'] = $module++;
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/bannergroup.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/bannergroup.tpl', $data);
		} else {
			return $this->load->view('default/template/module/bannergroup.tpl', $data);
		}
	}
}