<?php
class ControllerModuleDirectdiscuss extends Controller{

    public function index() {
        $this->load->language('module/directdiscuss');

        $heading_title = $this->language->get('heading_title');
        $this->document->setTitle($heading_title);

        $this->load->model('extension/module');

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            if (!isset($this->request->get['module_id'])) {
                $this->model_extension_module->addModule('directdiscuss', $this->request->post);
            } else {
                $this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
            }

            $this->model_setting_setting->editSetting('directdiscuss', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        if (!isset($this->request->get['module_id'])) {
            $settings = $this->model_setting_setting->getSetting('directdiscuss');
        } else {
            $settings = $this->model_extension_module->getModule($this->request->get['module_id']);
        }

        if (!isset($settings['widget_code'])) {
            $settings['widget_code'] = '';
        }
        if (!isset($settings['name'])) {
            $settings['name'] = '';
        }
				if (!isset($settings['status'])) {
					$settings['status'] = 0;
				}

        $data['widget_code'] = $settings['widget_code'];
        $data['name'] = $settings['name'];
			  $data['status'] = $settings['status'];


        $data['heading_title'] = $heading_title;
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['entry_code'] = $this->language->get('entry_code');
				$data['entry_name'] = $this->language->get('entry_name');
				$data['entry_help_text'] = $this->language->get('entry_help_text');
				$data['entry_help_success_text'] = $this->language->get('entry_help_success_text');
			  $data['entry_status'] = $this->language->get('entry_status');

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');



        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (!isset($this->request->get['module_id'])) {
            $data['action'] = $this->url->link('module/directdiscuss', 'token=' . $this->session->data['token'], 'SSL');
        } else {
            $data['action'] = $this->url->link('module/directdiscuss', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
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

        $data['breadcrumbs'][] = array(
            'text' => $heading_title,
            'href' => $this->url->link('module/directdiscuss', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        $this->response->setOutput($this->load->view('module/directdiscuss.tpl', $data));
    }

    private function validate() {
        return true;
    }
}
