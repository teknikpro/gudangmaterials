<?php
class ModelExtensionBantuan extends Model {	
	public function getbantuan($bantuan_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "bantuan n LEFT JOIN " . DB_PREFIX . "bantuan_description nd ON n.bantuan_id = nd.bantuan_id WHERE n.bantuan_id = '" . (int)$bantuan_id . "' AND nd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row;
	}
 
	public function getAllbantuan($data) {
		$sql = "SELECT * FROM " . DB_PREFIX . "bantuan n LEFT JOIN " . DB_PREFIX . "bantuan_description nd ON n.bantuan_id = nd.bantuan_id WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND n.status = '1' ORDER BY date_added DESC";
		
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
	
	public function getTotalbantuan() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "bantuan");
	
		return $query->row['total'];
	}
}