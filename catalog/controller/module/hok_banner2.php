<?php
class ControllerModuleHokBanner2 extends Controller {
	public function index($setting) {
		static $module = 0;
		
		$this->load->language('module/hok_banner2');
		$this->load->model('design/banner');
		$this->load->model('tool/image');
		
		if ($setting['heading_status']) {
			$data['heading_title'] = $setting['name'];
		} else {
			$data['heading_title'] = false;
		}
		
		$data['title_class'] = $setting['title_class'];
		$data['title_status'] = $setting['title_status'];
		
		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);
		
		$height_arr = explode(',', $setting['height']);
	
		$width_arr = explode(',', $setting['width']);
		
		$total_width = array_sum($width_arr);
		
		$small_width = max($width_arr) * 0.6;
		
		$small_height = max($height_arr) * 0.6;
		
		foreach ($results as $key=>$result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				if (count($width_arr) == 1) {
					$width = $width_arr[0];
				} else {	
					$width = $width_arr[$key % count($width_arr)];
				}
				
				if (count($height_arr) == 1) {
					$height = $height_arr[0];
				} else {
					$height = $height_arr[$key % count($height_arr)];
				}
				
				
				if ($setting['reverse_status'] && (($key + 1) % count($width_arr)) === 0) {
					$width_arr = array_reverse($width_arr);
					$height_arr = array_reverse($height_arr);
				}
				
				$image = $this->model_tool_image->resize($result['image'], $width, $height);
				
				$small_image = $this->model_tool_image->resize($result['image'], $small_width, $small_height);
				
				$grid_size = round(12*$width/$total_width);
				
				$data['banners'][] = array(
					'title' 		=> $result['title'],
					'link'  		=> $result['link'],
					'banner_image_id'  	=> $result['banner_image_id'],
					'image' 		=> $image,
					'small_image' 	=> $small_image,
					'grid_size' 	=> $grid_size
				);
			}
		}

		$data['module'] = $module++;
		
		// Check Version
		if (version_compare(VERSION, '2.2.0.0', '<') == true) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/hok_banner2.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/hok_banner2.tpl', $data);
			} else {
				return $this->load->view('default/template/module/hok_banner.tpl', $data);
			}
		} else {
			return $this->load->view('module/hok_banner2', $data);
		}
	}
}