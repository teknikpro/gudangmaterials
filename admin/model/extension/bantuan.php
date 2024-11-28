<?php
class ModelExtensionBantuan extends Model {
	public function addbantuan($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "bantuan SET image = '" . $this->db->escape($data['image']) . "', date_added = NOW(), status = '" . (int)$data['status'] . "'");
		
		$bantuan_id = $this->db->getLastId();
		
		foreach ($data['bantuan'] as $key => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX ."bantuan_description SET bantuan_id = '" . (int)$bantuan_id . "', language_id = '" . (int)$key . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', short_description = '" . $this->db->escape($value['short_description']) . "'");
		}
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'bantuan_id=" . (int)$bantuan_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
	}
	
	public function editbantuan($bantuan_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "bantuan SET image = '" . $this->db->escape($data['image']) . "', status = '" . (int)$data['status'] . "' WHERE bantuan_id = '" . (int)$bantuan_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "bantuan_description WHERE bantuan_id = '" . (int)$bantuan_id. "'");
		
		foreach ($data['bantuan'] as $key => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX ."bantuan_description SET bantuan_id = '" . (int)$bantuan_id . "', language_id = '" . (int)$key . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "', short_description = '" . $this->db->escape($value['short_description']) . "'");
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'bantuan_id=" . (int)$bantuan_id. "'");
		
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'bantuan_id=" . (int)$bantuan_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
	}
	
	public function getbantuan($bantuan_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'bantuan_id=" . (int)$bantuan_id . "') AS keyword FROM " . DB_PREFIX . "bantuan WHERE bantuan_id = '" . (int)$bantuan_id . "'"); 
 
		if ($query->num_rows) {
			return $query->row;
		} else {
			return false;
		}
	}
   
	public function getbantuanDescription($bantuan_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "bantuan_description WHERE bantuan_id = '" . (int)$bantuan_id . "'"); 
		
		foreach ($query->rows as $result) {
			$bantuan_description[$result['language_id']] = array(
				'title'       			=> $result['title'],
				'short_description'		=> $result['short_description'],
				'description' 			=> $result['description']
			);
		}
		
		return $bantuan_description;
	}
 
	public function getAllbantuan($data) {
		$sql = "SELECT * FROM " . DB_PREFIX . "bantuan n LEFT JOIN " . DB_PREFIX . "bantuan_description nd ON n.bantuan_id = nd.bantuan_id WHERE nd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY date_added DESC";
		
		if (isset($data['start']) && isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}
			
			if ($data['limit'] < 1) {
				$data['limit'] = 60;
			}	
		
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}	
		
		$query = $this->db->query($sql);
 
		return $query->rows;
	}
   
	public function deletebantuan($bantuan_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "bantuan WHERE bantuan_id = '" . (int)$bantuan_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "bantuan_description WHERE bantuan_id = '" . (int)$bantuan_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'bantuan_id=" . (int)$bantuan_id. "'");
	}
   
	public function getTotalbantuan() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "bantuan");
	
		return $query->row['total'];
	}
}