<?php
class ModelExtensionPromo extends Model {	
	public function getpromo($promo_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "promo n LEFT JOIN " . DB_PREFIX . "promo_description nd ON n.promo_id = nd.promo_id WHERE n.promo_id = '" . (int)$promo_id . "' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row;
	}
 
	public function getAllpromo($data) {
		$sql = "SELECT * FROM " . DB_PREFIX . "promo n LEFT JOIN " . DB_PREFIX . "promo_description nd ON n.promo_id = nd.promo_id WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n.status = '1' ORDER BY date_added DESC";
		
		if (isset($data['start']) && isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}
			
			if ($data['limit'] < 1) {
				$data['limit'] = 10;
			}	
		
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}	
		
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	
	public function getTotalpromo() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "promo");
	
		return $query->row['total'];
	}
}