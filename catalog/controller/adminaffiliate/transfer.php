<?php
class ControllerAdminAffiliateTransfer extends Controller {
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
        $data['heading_title'] = 'Affiliate | Transfer';

        $data['template_assets'] = "https://gudangmaterials.id/catalog/view/theme/journal2/template/affiliate/assets/sbadmin/";
        $data['logout'] = $this->url->link('adminaffiliate/logout', '', 'SSL');

        $this->load->model('affiliate/information');
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $id_affiliate_pengeluaran = $this->request->post['id_affiliate_pengeluaran'];
        
            if (isset($_FILES['transfer_image']) && $_FILES['transfer_image']['error'] == 0) {
                // Mendapatkan informasi file
                $fileTmpPath = $_FILES['transfer_image']['tmp_name'];
                $fileName = $_FILES['transfer_image']['name'];
                $fileSize = $_FILES['transfer_image']['size'];
                $fileType = $_FILES['transfer_image']['type'];
                $fileNameCmps = explode(".", $fileName);
                $fileExtension = strtolower(end($fileNameCmps)); // Mendapatkan ekstensi file
        
                // Tentukan folder tujuan untuk menyimpan gambar
                $uploadFileDir = __DIR__ . '/../../uploads/';
                $uploadSubDir = 'transfers/';
        
                // Periksa dan buat folder jika belum ada
                if (!is_dir($uploadFileDir . $uploadSubDir)) {
                    mkdir($uploadFileDir . $uploadSubDir, 0777, true);
                }
        
                // Buat nama file unik untuk menghindari konflik
                $newFileName = uniqid('transfer_', true) . '.' . $fileExtension;
                $dest_path = $uploadFileDir . $uploadSubDir . $newFileName;
        
                // Validasi ekstensi file
                $allowedExts = ['jpg', 'jpeg', 'png', 'gif'];
                if (in_array($fileExtension, $allowedExts)) {
                    // Validasi ukuran file (misalnya maksimal 5MB)
                    if ($fileSize < 5000000) {
                        // Pindahkan file ke folder yang telah ditentukan
                        if (move_uploaded_file($fileTmpPath, $dest_path)) {
                            echo "File berhasil diupload!";
        
                            // Simpan informasi file ke database
                            $this->model_affiliate_information->updateTransferKomsi($id_affiliate_pengeluaran, $newFileName);
                            $this->model_affiliate_information->addNotifikasiUserTransfer($id_affiliate_pengeluaran);

                            // kirim email

                            $penarikan = $this->model_affiliate_information->getDetailPenarikan($id_affiliate_pengeluaran);
                            $affiliate_id = $penarikan['affiliate_id'];
                            $profile = $this->model_affiliate_information->getDetailAfiliator($affiliate_id);
                            $orderInfo = [
                                'email' => $profile['email'],
                                'store_name' => 'Gudang Material Affiliate'
                            ];
                            $jumlahpenarikan = $penarikan['jumlah'];
                            $fullname = $profile['firstname'] ." ". $profile['lastname'];
    
                            $subject = 'Komisi sebesar '. number_format($jumlahpenarikan) .' berhasil ditransfer';
                            $htmlMessage = '<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><style>body,html{margin:0;padding:0}body{font-family:Arial,sans-serif;background-color:#f7f7f7}table{border-spacing:0;width:100%}img{max-width:100%;height:auto}.email-container{max-width:600px;margin:auto;background-color:#ffffff;border-radius:8px;overflow:hidden;box-shadow:0 2px 5px rgba(0,0,0,0.1)}.header{background-color:#851c1c;padding:20px;text-align:center;color:#ffffff}.header h1{margin:0;font-size:24px}.content{padding:20px}.content h2{color:#333333}.content p{color:#555555;line-height:1.6}.content a{color:#851c1c;text-decoration:none;font-weight:bold}.content .button{display:inline-block;margin-top:20px;padding:10px 20px;background-color:#851c1c;color:#ffffff;text-decoration:none;border-radius:5px;font-weight:bold}.footer{background-color:#f1f1f1;padding:10px;text-align:center;font-size:12px;color:#888888}.footer a{color:#4CAF50;text-decoration:none}@media (max-width:600px){.content{padding:15px}.header h1{font-size:20px}}</style></head><body><table class="email-container"><tr><td class="header"><h1>Komisi sebesar '. number_format($jumlahpenarikan) .' berhasil </h1></td></tr><tr><td class="content"><h2>Halo '. $fullname .'!</h2><p>komisi sebesar '. number_format($jumlahpenarikan) .', berhasil ditransfer!</p></td></tr><tr><td class="footer"><p>&copy; 2024 gudangmaterials.id. All rights reserved.</p></td></tr></table></body></html>';
                            $textMessage = 'Penarikan berhasil.';
    
                            $this->model_affiliate_information->sendMail(
                                $orderInfo['email'],
                                $subject,
                                $htmlMessage,
                                $textMessage,
                                null,
                                $orderInfo['store_name']
                            );
        
                            // Set pesan sukses dan redirect
                            $this->session->data['success'] = "Transfer Berhasil";
                            $this->response->redirect($this->url->link('adminaffiliate/tarikdana', '', 'SSL'));
                        } else {
                            echo "Terjadi kesalahan saat mengupload file.";
                        }
                    } else {
                        echo "File terlalu besar. Maksimal ukuran file adalah 5MB.";
                    }
                } else {
                    echo "Hanya file gambar yang diperbolehkan (jpg, jpeg, png, gif).";
                }
            } else {
                echo "Tidak ada file yang diupload atau terjadi kesalahan.";
            }
        }
        

        $id_affiliate_pengeluaran = $_GET['id_affiliate_pengeluaran'];
        $data_pengeluaran = $this->model_affiliate_information->getDataPengeluaran($id_affiliate_pengeluaran);
        $affiliate_id = $data_pengeluaran['affiliate_id'];

        $status_notif = isset($_GET['status_notif']) ? $_GET['status_notif'] : null;
        if($status_notif){
            $this->db->query("UPDATE oc_affiliate_notifikasi_admin SET status_baca='1' WHERE id_notifikasi_admin='$status_notif' ");
        }

        $affiliator = $this->model_affiliate_information->getDetailAfiliator($affiliate_id);

        $data['afiliator'] = $affiliator;
        $data['data_pengeluaran'] = $data_pengeluaran;
        $data['file_transfer'] = "https://gudangmaterials.id/catalog/uploads/transfers/" . $data_pengeluaran['bukti_transfer'];
        $data['action'] = $this->url->link('adminaffiliate/transfer', '', 'SSL');
		$data['header'] = $this->load->controller('adminaffiliate/header', $data);
        $data['sidebar'] = $this->load->controller('adminaffiliate/sidebar', $data);
        $data['navbar'] = $this->load->controller('adminaffiliate/navbar', $data);
        $data['footer'] = $this->load->controller('adminaffiliate/footer', $data);
        // Data lain yang ingin ditampilkan

        // Load template untuk halaman affiliate
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/adminaffiliate/transfer.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/adminaffiliate/transfer.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/adminaffiliate/transfer.tpl', $data));
		}
    }
}
?>
