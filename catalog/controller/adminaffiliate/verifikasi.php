<?php
class ControllerAdminAffiliateVerifikasi extends Controller {
    public function index() {

        if (!$this->affiliate->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('adminaffiliate/dashboard', '', 'SSL');

			$this->response->redirect($this->url->link('adminaffiliate/login', '', 'SSL'));
		}

        $this->load->model('affiliate/affiliate');
        $affiliate_info = $this->model_affiliate_affiliate->getAffiliate($this->affiliate->getId());
        if($affiliate_info['admin'] != 1){
            $this->affiliate->logout();
            $this->response->redirect($this->url->link('adminaffiliate/login', '', 'SSL'));
        }

        // Menetapkan data untuk view
        $data['heading_title'] = 'Affiliate | Verfikasi Afiliator';

        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";
        $data['logout'] = $this->url->link('adminaffiliate/logout', '', 'SSL');

        $this->load->model('affiliate/information');
        if($_SERVER['REQUEST_METHOD'] == 'POST'){

            $affiliate_id = $this->request->post['affiliate_id'];
            $lasan = $this->request->post['alasan'];
            if($lasan){

                $this->model_affiliate_information->tolakVerifikasi($affiliate_id, $lasan);
                $subjectemail = "Pendaftaran Affiliate Ditolak";
                $textMessageEmail = "Registrasi Ditolak";
                $isipesan = "Mohon maaf untuk pendaftaran anda di gudangmaterials affiliate belum disetujui karena " . $lasan;
                $ucapan = '<p>Terimakasih sudah mendaftar di gudangmaterials affiliate</p>';
                $linkaksi = '';

            }else {

                $this->model_affiliate_information->verifikasiData($affiliate_id);
                $subjectemail = "Pendaftaran Affiliate Berhasil";
                $textMessageEmail = "Registrasi Berhasil";
                $isipesan = "Selamat pendaftaran anda di gudangmaterials affiliate telah berhasil, silahkan login menggunakan akun yang sudah didaftarkan sebelumnya!";
                $ucapan = '';
                $linkaksi = '<a href="https://gudangmaterials.id/index.php?route=affiliate/login" class="button">Login Sekarang</a>';

            }

            // kirim email

            $profile = $this->model_affiliate_information->getDetailAfiliator($affiliate_id);
            $orderInfo = [
                'email' => $profile['email'],
                'store_name' => 'Gudang Material Affiliate'
            ];
            $fullname = $profile['firstname'] ." ". $profile['lastname'];

            $subject = $subjectemail;
            $htmlMessage = '<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><style>body,html{margin:0;padding:0}body{font-family:Arial,sans-serif;background-color:#f7f7f7}table{border-spacing:0;width:100%}img{max-width:100%;height:auto}.email-container{max-width:600px;margin:auto;background-color:#ffffff;border-radius:8px;overflow:hidden;box-shadow:0 2px 5px rgba(0,0,0,0.1)}.header{background-color:#851c1c;padding:20px;text-align:center;color:#ffffff}.header h1{margin:0;font-size:24px}.content{padding:20px}.content h2{color:#333333}.content p{color:#555555;line-height:1.6}.content a{color:#851c1c;text-decoration:none;font-weight:bold}.content .button{display:inline-block;margin-top:20px;padding:10px 20px;background-color:#851c1c;color:#ffffff;text-decoration:none;border-radius:5px;font-weight:bold}.footer{background-color:#f1f1f1;padding:10px;text-align:center;font-size:12px;color:#888888}.footer a{color:#4CAF50;text-decoration:none}@media (max-width:600px){.content{padding:15px}.header h1{font-size:20px}}</style></head><body><table class="email-container"><tr><td class="header"><h1>Registrasi Affiliate Gudangmaterials</h1></td></tr><tr><td class="content"><h2>Halo '. $fullname .'!</h2><p>'. $isipesan .'</p>'. $ucapan .'' . $linkaksi .'</td></tr><tr><td class="footer"><p>&copy; 2024 gudangmaterials.id. All rights reserved.</p></td></tr></table></body></html>';
            $textMessage = $textMessageEmail;

            $this->model_affiliate_information->sendMail(
                $orderInfo['email'],
                $subject,
                $htmlMessage,
                $textMessage,
                null,
                $orderInfo['store_name']
            );

            $this->session->data['success'] = "Data berhasil diubah";
            $this->response->redirect($this->url->link('adminaffiliate/afiliator', '', 'SSL'));

        }

        $affiliate_id = $_GET['affiliate_id'];
        $affiliator = $this->model_affiliate_information->getDetailAfiliator($affiliate_id);

        $status_notif = isset($_GET['status_notif']) ? $_GET['status_notif'] : null;
        if($status_notif){
            $this->db->query("UPDATE oc_affiliate_notifikasi_admin SET status_baca='1' WHERE id_notifikasi_admin='$status_notif' ");
        }

        $data['afiliator'] = $affiliator;
        $data['action'] = $this->url->link('adminaffiliate/verifikasi', '', 'SSL');
		$data['header'] = $this->load->controller('adminaffiliate/header', $data);
        $data['sidebar'] = $this->load->controller('adminaffiliate/sidebar', $data);
        $data['navbar'] = $this->load->controller('adminaffiliate/navbar', $data);
        $data['footer'] = $this->load->controller('adminaffiliate/footer', $data);
        // Data lain yang ingin ditampilkan

        // Load template untuk halaman affiliate
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/adminaffiliate/verifikasi.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/adminaffiliate/verifikasi.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/adminaffiliate/verifikasi.tpl', $data));
		}
    }
}
?>
