<?php
class ControllerModuleModuleJoiner extends Controller {
	public function index($setting) {
	
		$this->load->language('module/module_joiner');
		
		$data['setting'] = $setting;
		
		$this->load->model('extension/module');
		
		$data['heading_title'] = $this->language->get('heading_title');

		$data['modules'] = array();
		
		$modules = $setting['layout_module'];
		
		$data['row_wise'] = $setting['row_wise'];
		
		$total_weightage = 0;
		
		$sort_order = array();
		
		foreach ($modules as $module_info) {
			$total_weightage += $module_info['weightage'];
			$sort_order[] = $module_info['sort_order'];
		}
		
		array_multisort($sort_order,$modules);
		
		foreach ($modules as $module_info) {
			$part = explode('.', $module_info['code']);

			if (isset($part[0]) && $this->config->get($part[0] . '_status')) {
				$data['modules'][] = array(
					'module'		=> $this->load->controller('module/' . $part[0]),
					'weightage'		=> ($total_weightage === 0?6:@round(12 * $module_info['weightage'] / $total_weightage))
				);	
			}

			if (isset($part[1])) {
				$setting_info = $this->model_extension_module->getModule($part[1]);

				if ($setting_info && $setting_info['status']) {
					$data['modules'][] = array(
						'module'		=> $this->load->controller('module/' . $part[0], $setting_info),
						'weightage'		=> ($total_weightage === 0?6:@round(12 * $module_info['weightage'] / $total_weightage))
					);	
				}
			}
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/module_joiner.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/module_joiner.tpl', $data);
		} else {
			return $this->load->view('default/template/module/module_joiner.tpl', $data);
		}
	}
}