<?php
class ModelDesignBanner extends Model {
	public function getBanner($banner_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "banner_image bi LEFT JOIN " . DB_PREFIX . "banner_image_description bid ON (bi.banner_image_id  = bid.banner_image_id) WHERE bi.banner_id = '" . (int)$banner_id . "' AND bid.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY bi.sort_order ASC");

		return $query->rows;
	}
	
	public function updateSessionLink($userid,$linkweb,$user_email){  	 
	  $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sessionlink WHERE email = '" . $this->db->escape(utf8_strtolower((string)$user_email)) . "'");

		if ($query->num_rows) {
			$this->db->query("UPDATE " . DB_PREFIX . "sessionlink SET  link = '" . $linkweb . "' WHERE email = '" . $this->db->escape(utf8_strtolower((string)$user_email)) . "'");		
		}
	}			
	
}