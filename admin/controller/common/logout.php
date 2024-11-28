<?php
class ControllerCommonLogout extends Controller {
	public function index() {
		$this->user->logout();

		unset($this->session->data['token']);
		unset($this->session->data['hp_ext']);
		unset($this->session->data['system_mods']);

		$this->response->redirect($this->url->link('common/login', '', 'SSL'));
	}
}