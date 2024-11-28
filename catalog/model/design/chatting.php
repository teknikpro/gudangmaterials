<?php
class ModelDesignChatting extends Model {	
	public function getchatting($chatting_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "chatting WHERE chatting_id=".$chatting_id);
		return $query->rows;
	}
	
	public function getchattings($data) {
		$query = "SELECT a.*,COUNT(CASE WHEN b.chatting_id = '' THEN 0 ELSE b.chatting_id END) AS reply,a.views FROM ".DB_PREFIX."chatting AS a LEFT JOIN ".DB_PREFIX."chatting_reply AS b ON a.chatting_id = b.chatting_id WHERE a.status=1 GROUP BY a.chatting_id ORDER BY a.chatting_id DESC ";
		
		if (isset($data['start']) || isset($data['limit'])) {

			if ($data['start'] < 0) {

				$data['start'] = 0;

			}



			if ($data['limit'] < 1) {

				$data['limit'] = 20;

			}



			$query .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];

		}
		
		$query = $this->db->query($query);
		return $query->rows;
	}
	
	public function getchattingsTotal() {
		$query = "SELECT COUNT(*) as total FROM ".DB_PREFIX."chatting";	
		$query = $this->db->query($query);
		return $query->row['total'];
	}
	
	public function getchattingsTotalAuthor($author) {
		$query = "SELECT COUNT(*) as total FROM ".DB_PREFIX."chatting WHERE customer_id='".$author."' AND status='1'";	
		$query = $this->db->query($query);
		return $query->row['total'];
	}
	
	public function getAuthorchattings($author,$data) {
		$query = "SELECT a.*,COUNT(CASE WHEN b.chatting_id = '' THEN 0 ELSE b.chatting_id END) AS reply,a.views FROM ".DB_PREFIX."chatting AS a LEFT JOIN ".DB_PREFIX."chatting_reply AS b ON a.chatting_id = b.chatting_id WHERE a.customer_id='".$author."' AND a.status='1' GROUP BY a.chatting_id";
		
		if (isset($data['start']) || isset($data['limit'])) {

			if ($data['start'] < 0) {

				$data['start'] = 0;

			}



			if ($data['limit'] < 1) {

				$data['limit'] = 20;

			}



			$query .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];

		}
		
		$query = $this->db->query($query);
		return $query->rows;
	}
	
	public function addTopic($data) {
		$query = $this->db->query("INSERT INTO " . DB_PREFIX . "chatting SET name = '" . $this->db->escape($data['name']) . "',description = '" . $this->db->escape($data['note_description']) . "', username = '" . $this->db->escape($data['username']) . "', customer_id = '" . (int)$this->db->escape($data['customer_id']) . "', email = '" . $this->db->escape($data['email']) . "', avatar = '" . $this->db->escape($data['avatar']) . "',  status = 0");
	}
	
	public function addReply($data) {
		$query = $this->db->query("INSERT INTO " . DB_PREFIX . "chatting_reply SET chatting_id = '" . $this->db->escape($data['chatting_id']) . "', username = '" . $this->db->escape($data['username']) . "', customer_id = '" . (int)$this->db->escape($data['customer_id']) . "',email = '" . $this->db->escape($data['email']) . "', avatar = '" . $this->db->escape($data['avatar']) . "', reply = '" . $this->db->escape($data['reply']) . "', status = 1");
	}
	
	public function getchattingReply($chatting_id) {
		$query = $this->db->query("SELECT a.*,b.name FROM ".DB_PREFIX."chatting_reply AS a LEFT JOIN ".DB_PREFIX."chatting AS b ON a.chatting_id = b.chatting_id WHERE a.status = 1 AND a.chatting_id =".$chatting_id);
		return $query->rows;
	}
	
	public function getchattingViews($chatting_id) {
		$query = $this->db->query("SELECT views FROM ".DB_PREFIX."chatting WHERE chatting_id=".$chatting_id." LIMIT 0,1");
		return $query->rows;
	}
	
	public function addchattingViews($view,$chatting_id) {
		$query = $this->db->query("UPDATE ".DB_PREFIX."chatting SET views=".$view." WHERE chatting_id=".$chatting_id);
	}
	public function addMail($chatting_id) {
		$query = $this->db->query("SELECT username,email FROM ".DB_PREFIX."chatting_reply WHERE chatting_id = ".$chatting_id." UNION SELECT username,email FROM ".DB_PREFIX."chatting WHERE chatting_id = ".$chatting_id);
		return $query->rows;
	}
	public function getPost($chatting_id) {
		$query = $this->db->query("SELECT name FROM ".DB_PREFIX."chatting WHERE chatting_id = ".$chatting_id." LIMIT 0,1");
		return $query->rows;
	}
	
	public function deleteChat($chatting_id) {
		

		$this->db->query("DELETE FROM " . DB_PREFIX . "chatting_reply WHERE chatting_id = '" . (int)$chatting_id . "'");

		
	}
	
	
}
?>