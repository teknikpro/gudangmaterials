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
				$data['tanggal_pencairan'] = date('d F Y', strtotime($datadetail['tanggal_pencairan']));
				if(isset($data['bukti_transfer'])){
					$data['bukti_transfer'] = "https://gudangmaterials.id/catalog/uploads/transfers/". $datadetail['bukti_transfer'];
				}else {
					$data['bukti_transfer'] = "";
				}
				
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
						$data['bukti_transfer'] = "";

						// kirim email

						$orderInfo = [
							'email' => 'threadlightid@gmail.com',
							'store_name' => 'Gudang Material Affiliate'
						];
						$jumlahpenarikan = $this->request->post['jumlah'];
						$profile = $this->model_affiliate_information->getProfile();
						$fullname = $profile['firstname'] ." ". $profile['lastname'];

						$subject = 'Penarikan Komisi sebesar '. number_format($jumlahpenarikan);
						$htmlMessage = '<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><style>body,html{margin:0;padding:0}body{font-family:Arial,sans-serif;background-color:#f7f7f7}table{border-spacing:0;width:100%}img{max-width:100%;height:auto}.email-container{max-width:600px;margin:auto;background-color:#ffffff;border-radius:8px;overflow:hidden;box-shadow:0 2px 5px rgba(0,0,0,0.1)}.header{background-color:#851c1c;padding:20px;text-align:center;color:#ffffff}.header h1{margin:0;font-size:24px}.content{padding:20px}.content h2{color:#333333}.content p{color:#555555;line-height:1.6}.content a{color:#851c1c;text-decoration:none;font-weight:bold}.content .button{display:inline-block;margin-top:20px;padding:10px 20px;background-color:#851c1c;color:#ffffff;text-decoration:none;border-radius:5px;font-weight:bold}.footer{background-color:#f1f1f1;padding:10px;text-align:center;font-size:12px;color:#888888}.footer a{color:#4CAF50;text-decoration:none}@media (max-width:600px){.content{padding:15px}.header h1{font-size:20px}}</style></head><body><table class="email-container"><tr><td class="header"><h1>Penarikan Komisi '. number_format($jumlahpenarikan) .'</h1></td></tr><tr><td class="content"><h2>Halo Admin!</h2><p>'. $fullname .' melakukan penarikan komisi sebesar '. number_format($jumlahpenarikan) .', silahkan segera diproses!</p><a href="https://gudangmaterials.id/index.php?route=adminaffiliate/tarikdana" class="button">Transfer Sekarang</a></td></tr><tr><td class="footer"><p>&copy; 2024 gudangmaterials.id. All rights reserved.</p></td></tr></table></body></html>';
						$textMessage = 'Mohon segera diproses.';

						$this->model_affiliate_information->sendMail(
							$orderInfo['email'],
							$subject,
							$htmlMessage,
							$textMessage,
							null,
							$orderInfo['store_name']
						);
		
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