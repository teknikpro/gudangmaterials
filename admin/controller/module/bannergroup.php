<?php
class ControllerModuleBannerGroup extends Controller {
	private $error = array();

	public function index() {
		$language = $this->load->language('module/bannergroup');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('bannergroup', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();

		// Merge the language array with the data array
		$data = array_merge($data, $language);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_banner'] = $this->language->get('entry_banner');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['dimension'])) {
			$data['error_dimension'] = $this->error['dimension'];
		} else {
			$data['error_dimension'] = '';
		}
		
		if (isset($this->error['toppadding'])) {
			$data['error_toppadding'] = $this->error['toppadding'];
		} else {
			$data['error_toppadding'] = '';
		}
		
		if (isset($this->error['bottompadding'])) {
			$data['error_bottompadding'] = $this->error['bottompadding'];
		} else {
			$data['error_bottompadding'] = '';
		}
		
		if (isset($this->error['rightpadding'])) {
			$data['error_rightpadding'] = $this->error['rightpadding'];
		} else {
			$data['error_rightpadding'] = '';
		}
		
		if (isset($this->error['leftpadding'])) {
			$data['error_leftpadding'] = $this->error['leftpadding'];
		} else {
			$data['error_leftpadding'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/bannergroup', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/bannergroup', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/bannergroup', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/bannergroup', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['banner_id'])) {
			$data['banner_id'] = $this->request->post['banner_id'];
		} elseif (!empty($module_info)) {
			$data['banner_id'] = $module_info['banner_id'];
		} else {
			$data['banner_id'] = '';
		}

		$this->load->model('design/banner');

		$data['banners'] = $this->model_design_banner->getBanners();
		
		if (isset($this->request->post['banner_num'])) {
			$data['banner_num'] = $this->request->post['banner_num'];
		} elseif (!empty($module_info)) {
			$data['banner_num'] = $module_info['banner_num'];
		} else {
			$data['banner_num'] = '';
		}
		
		if (isset($this->request->post['toppadding'])) {
			$data['toppadding'] = $this->request->post['toppadding'];
		} elseif (!empty($module_info)) {
			$data['toppadding'] = $module_info['toppadding'];
		} else {
			$data['toppadding'] = '0';
		}
		
		if (isset($this->request->post['bottompadding'])) {
			$data['bottompadding'] = $this->request->post['bottompadding'];
		} elseif (!empty($module_info)) {
			$data['bottompadding'] = $module_info['bottompadding'];
		} else {
			$data['bottompadding'] = '0';
		}
		
		if (isset($this->request->post['rightpadding'])) {
			$data['rightpadding'] = $this->request->post['rightpadding'];
		} elseif (!empty($module_info)) {
			$data['rightpadding'] = $module_info['rightpadding'];
		} else {
			$data['rightpadding'] = '0';
		}
		
		if (isset($this->request->post['leftpadding'])) {
			$data['leftpadding'] = $this->request->post['leftpadding'];
		} elseif (!empty($module_info)) {
			$data['leftpadding'] = $module_info['leftpadding'];
		} else {
			$data['leftpadding'] = '0';
		}
		
		if (isset($this->request->post['remove_left'])) {
			$data['remove_left'] = $this->request->post['remove_left'];
		} elseif (!empty($module_info)) {
			$data['remove_left'] = $module_info['remove_left'];
		} else {
			$data['remove_left'] = '';
		}
		
		if (isset($this->request->post['remove_right'])) {
			$data['remove_right'] = $this->request->post['remove_right'];
		} elseif (!empty($module_info)) {
			$data['remove_right'] = $module_info['remove_right'];
		} else {
			$data['remove_right'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/bannergroup.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/bannergroup')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		
		if ($this->request->post['banner_num'] == 'Select') {
			$this->error['dimension'] = $this->language->get('error_dimension');
		}
		
		if ($this->request->post['toppadding'] == '') {
			$this->error['toppadding'] = $this->language->get('toppadding');
		}
		
		if ($this->request->post['bottompadding'] == '') {
			$this->error['bottompadding'] = $this->language->get('bottompadding');
		}
		
		if ($this->request->post['rightpadding'] == '') {
			$this->error['rightpadding'] = $this->language->get('rightpadding');
		}
		
		if ($this->request->post['leftpadding'] == '') {
			$this->error['leftpadding'] = $this->language->get('leftpadding');
		}

		return !$this->error;
	}
}