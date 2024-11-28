<?php
class ModelDesignChatting extends Model {
	
	public function addchatting($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "chatting SET name = '" . $this->db->escape($data['name']) . "',description = '" . $this->db->escape($data['description']) . "', username = '".$data['username']."', email = '".$data['email']."' , status = '" . (int)$data['status'] . "'");

		$chatting_id = $this->db->getLastId();

		if (isset($data['chatting_image'])) {
			foreach ($data['chatting_image'] as $chatting_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "chatting_image SET chatting_id = '" . (int)$chatting_id . "', image = '" .  $this->db->escape($chatting_image['image']) . "'");

				$chatting_image_id = $this->db->getLastId();

				foreach ($chatting_image['chatting_image_description'] as $language_id => $chatting_image_description) {				
					$this->db->query("INSERT INTO " . DB_PREFIX . "chatting_image_description SET chatting_image_id = '" . (int)$chatting_image_id . "', language_id = '" . (int)$language_id . "', chatting_id = '" . (int)$chatting_id . "', title = '" .  $this->db->escape($chatting_image_description['title']) . "'");
				}
			}
		}		
	}

	public function editchatting($chatting_id, $data) {
		// $this->db->query("UPDATE " . DB_PREFIX . "chatting SET name = '" . $this->db->escape($data['name']) . "', description = '" . $this->db->escape($data['description']) . "', status = '" . (int)$data['status'] . "' WHERE chatting_id = '" . (int)$chatting_id . "'");

         $this->db->query("UPDATE " . DB_PREFIX . "chatting SET name = '" . $this->db->escape($data['name']) . "', description = '" . $this->db->escape($data['description']) . "', status = '" . (int)$data['status'] . "', cust_id = '" . (int)$this->db->escape($data['customer_id']) . "', seller_id = '" . (int)$this->db->escape($data['seller_id']) . "'  WHERE chatting_id = '" . (int)$chatting_id . "'");


		$this->db->query("DELETE FROM " . DB_PREFIX . "chatting_image WHERE chatting_id = '" . (int)$chatting_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "chatting_image_description WHERE chatting_id = '" . (int)$chatting_id . "'");

		if (isset($data['chatting_image'])) {
			foreach ($data['chatting_image'] as $chatting_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "chatting_image SET chatting_id = '" . (int)$chatting_id . "', image = '" .  $this->db->escape($chatting_image['image']) . "'");

				$chatting_image_id = $this->db->getLastId();

				foreach ($chatting_image['chatting_image_description'] as $language_id => $chatting_image_description) {				
					$this->db->query("INSERT INTO " . DB_PREFIX . "chatting_image_description SET chatting_image_id = '" . (int)$chatting_image_id . "', language_id = '" . (int)$language_id . "', chatting_id = '" . (int)$chatting_id . "', title = '" .  $this->db->escape($chatting_image_description['title']) . "'");
				}
			}
		}			
	}
	
	public function editchattingReply($chatting_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "chatting_reply SET reply = '" . $this->db->escape($data['reply']) . "', status = '" . (int)$data['status'] . "' WHERE id = '" . (int)$chatting_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "chatting_image WHERE chatting_id = '" . (int)$chatting_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "chatting_image_description WHERE chatting_id = '" . (int)$chatting_id . "'");

		if (isset($data['chatting_image'])) {
			foreach ($data['chatting_image'] as $chatting_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "chatting_image SET chatting_id = '" . (int)$chatting_id . "', image = '" .  $this->db->escape($chatting_image['image']) . "'");

				$chatting_image_id = $this->db->getLastId();

				foreach ($chatting_image['chatting_image_description'] as $language_id => $chatting_image_description) {				
					$this->db->query("INSERT INTO " . DB_PREFIX . "chatting_image_description SET chatting_image_id = '" . (int)$chatting_image_id . "', language_id = '" . (int)$language_id . "', chatting_id = '" . (int)$chatting_id . "', title = '" .  $this->db->escape($chatting_image_description['title']) . "'");
				}
			}
		}			
	}

	public function deletechatting($chatting_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "chatting WHERE chatting_id = '" . (int)$chatting_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "chatting_image WHERE chatting_id = '" . (int)$chatting_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "chatting_reply WHERE chatting_id = '" . (int)$chatting_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "chatting_image_description WHERE chatting_id = '" . (int)$chatting_id . "'");
	}
	
	public function deletechattingReply($chatting_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "chatting_reply WHERE id = '" . (int)$chatting_id . "'");
	}

	public function getchatting($chatting_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "chatting WHERE chatting_id = '" . (int)$chatting_id . "'");

		return $query->row;
	}
	
	public function getchattingReply($chatting_id) {
		$query = $this->db->query("SELECT a.status,a.chatting_id,a.reply,b.name FROM " . DB_PREFIX . "chatting_reply AS a LEFT JOIN " . DB_PREFIX . "chatting AS b ON a.chatting_id = b.chatting_id  WHERE a.id = '" . (int)$chatting_id . "'");

		return $query->row;
	}

	public function getchattings($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "chatting";

		$sort_data = array(
			'name',
			'status'
		);	

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY name";	
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
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

	public function getchattingImages($chatting_id) {
		$chatting_image_data = array();

		$chatting_image_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "chatting_image WHERE chatting_id = '" . (int)$chatting_id . "'");

		foreach ($chatting_image_query->rows as $chatting_image) {
			$chatting_image_description_data = array();

			$chatting_image_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "chatting_image_description WHERE chatting_image_id = '" . (int)$chatting_image['chatting_image_id'] . "' AND chatting_id = '" . (int)$chatting_id . "'");

			foreach ($chatting_image_description_query->rows as $chatting_image_description) {			
				$chatting_image_description_data[$chatting_image_description['language_id']] = array('title' => $chatting_image_description['title']);
			}

			$chatting_image_data[] = array(
				'chatting_image_description' => $chatting_image_description_data,				
				'image'                    => $chatting_image['image']	
			);
		}

		return $chatting_image_data;
	}

	public function getTotalchattings() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "chatting");

		return $query->row['total'];
	}	
	public function getTotalchattingsReply() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "chatting_reply");

		return $query->row['total'];
	}
	
	public function getchattingsReply($data = array()) {
		$sql = "SELECT a.id,a.status,a.reply,a.chatting_id,b.name FROM " . DB_PREFIX . "chatting_reply AS a LEFT JOIN "  . DB_PREFIX . "chatting AS b ON a.chatting_id = b.chatting_id ";

		$sort_data = array(
			'name',
			'status'
		);	

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY name";	
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
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
	public function getEmail($id) {
		$query = $this->db->query("SELECT email FROM " . DB_PREFIX . "user WHERE user_id=".$id);
		return $query->row['email'];
	} 

	public function getSellerName_($chatting_id) {
  		$query = $this->db->query("select b.screenname as seller_name, concat(c.firstname,' ',c.lastname) as customer_name from oc_chatting a, oc_customerpartner_to_customer b, oc_customer c where a.seller_id=b.customer_id and a.cust_id=c.customer_id and a.chatting_id = '" . (int)$chatting_id . "'");
		
		if ($query->num_rows) {
			return array(
				'customer_name'       => $query->row['customer_name'],
				'seller_name'         => $query->row['seller_name']			
			);
		} else {
			return false;
		}
	}

	public function getSellerName($seller_id) {
  		$query = $this->db->query("select b.screenname as seller_name, concat(c.firstname,' ',c.lastname) as customer_name from oc_chatting a, oc_customerpartner_to_customer b, oc_customer c where a.seller_id=b.customer_id and a.cust_id=c.customer_id and a.seller_id = '" . (int)$seller_id . "'");
		
		if ($query->num_rows) {
			return array(
				
				'seller_name'         => $query->row['seller_name']			
			);
		} else {
			return false;
		}
	}



}
?>