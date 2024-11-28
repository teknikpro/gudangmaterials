<?php
class ControllerModuleModuleJoiner extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/module_joiner');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('module_joiner', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_form'] = $this->language->get('text_form');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_name'] = $this->language->get('entry_name');	
		$data['entry_row_wise'] = $this->language->get('entry_row_wise');	
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_module'] = $this->language->get('entry_module');
		$data['entry_weightage'] = $this->language->get('entry_weightage');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['button_module_add'] = $this->language->get('button_module_add');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$data['help_weightage'] = $this->language->get('help_weightage');
		$data['help_row_wise'] = $this->language->get('help_row_wise');
		

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
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
				'href' => $this->url->link('module/module_joiner', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/module_joiner', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/module_joiner', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/module_joiner', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
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
		
		if (isset($this->request->post['row_wise'])) {
			$data['row_wise'] = $this->request->post['row_wise'];
		} elseif (!empty($module_info)) {
			$data['row_wise'] = $module_info['row_wise'];
		} else {
			$data['row_wise'] = '';
		}
		
		if (isset($this->request->post['layout_module'])) {
			$data['layout_modules'] = $this->request->post['layout_module'];
		} elseif (!empty($module_info)) {
			$data['layout_modules'] = $module_info['layout_module'];
		} else {
			$data['layout_modules'] = array();
		}
		
		$this->load->model('extension/extension');

		$this->load->model('extension/module');

		$data['extensions'] = array();

		$extensions = $this->model_extension_extension->getInstalled('module');

		foreach ($extensions as $code) {
			$this->load->language('module/' . $code);

			$module_data = array();

			$modules = $this->model_extension_module->getModulesByCode($code);

			foreach ($modules as $module) {
				if (isset($this->request->get['module_id']) && ($this->request->get['module_id'] == $module['module_id'])) continue;
				
				$module_data[] = array(
					'name' => $this->language->get('heading_title') . ' &gt; ' . $module['name'],
					'code' => $code . '.' .  $module['module_id']
				);
			}

			if ($this->config->has($code . '_status') || $module_data) {
				$data['extensions'][] = array(
					'name'   => $this->language->get('heading_title'),
					'code'   => $code,
					'module' => $module_data
				);
			}
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

		$this->response->setOutput($this->load->view('module/module_joiner.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/module_joiner')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		return !$this->error;
	}
}
