<?php
class ModelShippingShindo extends Model {
	public function install() {
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "order` ADD `payment_district_id` INT(11) NULL DEFAULT NULL,
		ADD `shipping_district_id` INT(11) NULL DEFAULT NULL,
		ADD `payment_district` VARCHAR(128) NULL DEFAULT NULL,
		ADD `shipping_district` VARCHAR(128) NULL DEFAULT NULL");
		$this->db->query("ALTER TABLE " . DB_PREFIX . "address ADD COLUMN district_id INT(11) NULL");
		$this->db->query("ALTER TABLE " . DB_PREFIX . "zone ADD COLUMN raoprop_id INT(11) NULL");

		$this->db->query("UPDATE " . DB_PREFIX . "zone SET name = 'Nusa Tenggara Barat (NTB)' WHERE name = 'Nusa Tenggara Barat'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET name = 'Nusa Tenggara Timur (NTT)' WHERE name = 'Nusa Tenggara Timur'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET name = 'Bangka Belitung' WHERE name = 'Kepulauan Bangka Belitung'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET name = 'DKI Jakarta' WHERE name = 'Jakarta Raya'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET name = 'Nanggroe Aceh Darussalam (NAD)' WHERE name = 'Aceh'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET name = 'DI Yogyakarta' WHERE name = 'Yogyakarta'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET status = 0 WHERE `name` = 'BoDeTaBek'");

		$this->db->query("INSERT INTO " . DB_PREFIX . "zone (`country_id`, `name`, `code`, `status`) VALUES (100, 'Kalimantan Utara', 'BD', 1)");
		$this->db->query("INSERT INTO " . DB_PREFIX . "zone (`country_id`, `name`, `code`, `status`) VALUES (100, 'Kepulauan Riau', 'KR', 1)");
		$this->db->query("INSERT INTO " . DB_PREFIX . "zone (`country_id`, `name`, `code`, `status`) VALUES (100, 'Papua Barat', 'PB', 1)");
		$this->db->query("INSERT INTO " . DB_PREFIX . "zone (`country_id`, `name`, `code`, `status`) VALUES (100, 'Sulawesi Barat', 'SR', 1)");

		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='1' WHERE name = 'Bali'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='2' WHERE name = 'Bangka Belitung'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='3' WHERE name = 'Banten'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='4' WHERE name = 'Bengkulu'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='5' WHERE name = 'DI Yogyakarta'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='6' WHERE name = 'DKI Jakarta'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='7' WHERE name = 'Gorontalo'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='8' WHERE name = 'Jambi'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='9' WHERE name = 'Jawa Barat'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='10' WHERE name = 'Jawa Tengah'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='11' WHERE name = 'Jawa Timur'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='12' WHERE name = 'Kalimantan Barat'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='13' WHERE name = 'Kalimantan Selatan'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='14' WHERE name = 'Kalimantan Tengah'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='15' WHERE name = 'Kalimantan Timur'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='16' WHERE name = 'Kalimantan Utara'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='17' WHERE name = 'Kepulauan Riau'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='18' WHERE name = 'Lampung'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='19' WHERE name = 'Maluku'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='20' WHERE name = 'Maluku Utara'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='21' WHERE name = 'Nanggroe Aceh Darussalam (NAD)'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='22' WHERE name = 'Nusa Tenggara Barat (NTB)'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='23' WHERE name = 'Nusa Tenggara Timur (NTT)'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='24' WHERE name = 'Papua'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='25' WHERE name = 'Papua Barat'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='26' WHERE name = 'Riau'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='27' WHERE name = 'Sulawesi Barat'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='28' WHERE name = 'Sulawesi Selatan'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='29' WHERE name = 'Sulawesi Tengah'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='30' WHERE name = 'Sulawesi Tenggara'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='31' WHERE name = 'Sulawesi Utara'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='32' WHERE name = 'Sumatera Barat'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='33' WHERE name = 'Sumatera Selatan'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET raoprop_id ='34' WHERE name = 'Sumatera Utara'");
	}
	public function uninstall() {
		$this->db->query("ALTER TABLE `" . DB_PREFIX . "order` DROP `payment_district_id`,
		DROP `shipping_district_id`,
		DROP `payment_district`,
		DROP `shipping_district`");
		$this->db->query("ALTER TABLE " . DB_PREFIX . "address DROP district_id");
		$this->db->query("ALTER TABLE " . DB_PREFIX . "zone DROP raoprop_id");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET name = 'Nusa Tenggara Barat' WHERE name = 'Nusa Tenggara Barat (NTB)'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET name = 'Nusa Tenggara Timur' WHERE name = 'Nusa Tenggara Timur (NTT)'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET name = 'Kepulauan Bangka Belitung' WHERE name = 'Bangka Belitung'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET name = 'Jakarta Raya' WHERE name = 'DKI Jakarta'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET name = 'Aceh' WHERE name = 'Nanggroe Aceh Darussalam (NAD)'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET name = 'Yogyakarta' WHERE name = 'DI Yogyakarta'");
		$this->db->query("UPDATE " . DB_PREFIX . "zone SET status = 1 WHERE `name` = 'BoDeTaBek'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "zone WHERE `name` = 'Kalimantan Utara'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "zone WHERE `name` = 'Kepulauan Riau'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "zone WHERE `name` = 'Papua Barat'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "zone WHERE `name` = 'Sulawesi Barat'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE `code` = 'igsjne'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE `code` = 'igstiki'");

		$this->load->model('extension/extension');
		$this->model_extension_extension->uninstall('shipping', $this->request->get['extension']);
	}

	public function getProvinces() {

		$apikey = $this->config->get('shindo_apikey');
		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => "http://api.rajaongkir.com/basic/province",
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_ENCODING => "",
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 30,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "GET",
		  CURLOPT_HTTPHEADER => array(
		   "content-type: application/x-www-form-urlencoded",
	       "key: 15e5c2146c6c09d1a001178402f59d7f"
		   ),
		));

		$response = curl_exec($curl);
		$err = curl_error($curl);

		curl_close($curl);

		if ($err) {
		  return "cURL Error #:" . $err;
		} else {
			echo "Provinsi Tujuan<br>";
			return json_decode($response, true);
		}


	}



	public function getCities($province_id) {
		$apikey = $this->config->get('shindo_apikey');
		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => "http://api.rajaongkir.com/basic/city",
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_ENCODING => "",
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 30,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "GET",
		  CURLOPT_HTTPHEADER => array(
		    "content-type: application/x-www-form-urlencoded",
	        "key: 15e5c2146c6c09d1a001178402f59d7f"
		  ),
		));

		$response = curl_exec($curl);
		$err = curl_error($curl);

		curl_close($curl);

		if ($err) {
		  return "cURL Error #:" . $err;
		} else {
			return json_decode($response, true);
		}
	}
}
