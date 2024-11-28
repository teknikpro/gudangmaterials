<?php
class ModelExtensionPromo extends Model {
	public function addpromo($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "promo SET image = '" . $this->db->escape($data['image']) . "', date_added = NOW(), status = '" . (int)$data['status'] . "'");
		
		$promo_id = $this->db->getLastId();
		
		foreach ($data['promo'] as $key => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX ."promo_description SET promo_id = '" . (int)$promo_id . "', language_id = '" . (int)$key . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', short_description = '" . $this->db->escape($value['short_description']) . "'");
		}
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'promo_id=" . (int)$promo_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
	}
	
	public function editpromo($promo_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "promo SET image = '" . $this->db->escape($data['image']) . "', status = '" . (int)$data['status'] . "' WHERE promo_id = '" . (int)$promo_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "promo_description WHERE promo_id = '" . (int)$promo_id. "'");
		
		foreach ($data['promo'] as $key => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX ."promo_description SET promo_id = '" . (int)$promo_id . "', language_id = '" . (int)$key . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', short_description = '" . $this->db->escape($value['short_description']) . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'promo_id=" . (int)$promo_id. "'");
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'promo_id=" . (int)$promo_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
	}
	
	public function getpromo($promo_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'promo_id=" . (int)$promo_id . "') AS keyword FROM " . DB_PREFIX . "promo WHERE promo_id = '" . (int)$promo_id . "'"); 
 
		if ($query->num_rows) {
			return $query->row;
		} else {
			return false;
		}
	}
   
	public function getpromoDescription($promo_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "promo_description WHERE promo_id = '" . (int)$promo_id . "'"); 
		
		foreach ($query->rows as $result) {
			$promo_description[$result['language_id']] = array(
				'title'       			=> $result['title'],
				'short_description'		=> $result['short_description'],
				'description' 			=> $result['description']
			);
		}
		
		return $promo_description;
	}
 
	public function getAllpromo($data) {
		$sql = "SELECT * FROM " . DB_PREFIX . "promo n LEFT JOIN " . DB_PREFIX . "promo_description nd ON n.promo_id = nd.promo_id WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY date_added DESC";
		
		if (isset($data['start']) && isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}
			
			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
		
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}	
		
		$query = $this->db->query($sql);
 
		return $query->rows;
	}
   
	public function deletepromo($promo_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "promo WHERE promo_id = '" . (int)$promo_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "promo_description WHERE promo_id = '" . (int)$promo_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'promo_id=" . (int)$promo_id. "'");
	}
   
	public function getTotalpromo() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "promo");
	
		return $query->row['total'];
	}
}