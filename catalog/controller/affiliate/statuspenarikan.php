<?php
class ControllerAffiliateStatusPenarikan extends Controller {
	public function index(){
		if (!$this->affiliate->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('affiliate/statuspenarikan', '', 'SSL');

			$this->response->redirect($this->url->link('affiliate/login', '', 'SSL'));
		}

        // Load model jika diperlukan
        $this->load->model('affiliate/affiliate');

        // Menetapkan data untuk view
        $data['heading_title'] = 'Affiliate | Status Penarikan';

        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";

		$url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
		$parsed_url = parse_url($url);

		$this->load->model('affiliate/information');

		if (isset($parsed_url['query'])) {
			// Memecah query string menjadi array
			parse_str($parsed_url['query'], $query_params);
			
			// Mengambil nilai dari id_status
			if (isset($query_params['id_status'])) {
				$this->model_affiliate_information->updateStatusNotifikasiUserKeluar($query_params['id_status']);
				$datadetail = $this->model_affiliate_information->getDetailPenarikan($query_params['id_status']);

				if($datadetail['status_penarikan'] == 2){
					$icon = '<i class="fas fa-check-circle" style="font-size: 50px; color: green;"></i>';
					$keterangan = "Penarikan Anda Berhasil.";
					$status = "berhasil";
					$badge = "badge-success";
				}else if($datadetail['status_penarikan'] == 3) {
					$icon = '<i class="fas fa-times-circle" style="font-size: 50px; color: red;"></i>';
					$keterangan = "Penarikan Anda Gagal.";
					$status = "gagal";
					$badge = "badge-danger";
				}else {
					$icon = '<i class="fas fa-spinner fa-spin" style="font-size: 50px;"></i>';
					$keterangan = "Penarikan Anda sedang diproses.";
					$status = "diproses";
					$badge = "badge-warning";
				}

				$data['jumlah'] = $datadetail['jumlah'];
				$data['tanggal'] = date('d F Y', strtotime($datadetail['tanggal']));
				$data['icon'] = $icon;
				$data['keterangan'] = $keterangan;
				$data['status'] = $status;
				$data['badge'] = $badge;
				
			}else {

				if($_SERVER['REQUEST_METHOD'] == 'POST'){

					if($this->request->post['jumlah']){
		
						$this->model_affiliate_information->prosesTarikKomisi($this->request->post['jumlah']);
		
						$data['jumlah'] = $this->request->post['jumlah'];
						$data['tanggal'] = $this->request->post['tanggal'];
						$data['icon'] = '<i class="fas fa-spinner fa-spin" style="font-size: 50px;"></i>';
						$data['keterangan'] = "Penarikan Anda sedang diproses.";
						$data['status'] = "diproses";
						$data['badge'] = "badge-warning";
		
					}
		
				}else {
					$this->response->redirect($this->url->link('affiliate/riwayattarik', '', true));
				}

			} 
		} else {
			echo "URL tidak memiliki query string.";
		}
        
        // template
		$data['header'] = $this->load->controller('common/header_affiliate', $data);
        $data['footer'] = $this->load->controller('common/footer_affiliate');
        // Data lain yang ingin ditampilkan

        // Load template untuk halaman affiliate
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/affiliate/statuspenarikan.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/affiliate/statuspenarikan.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/affiliate/statuspenarikan.tpl', $data));
		}

	}
}