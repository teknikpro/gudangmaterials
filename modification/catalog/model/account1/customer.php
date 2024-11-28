<?php
class ModelAccountCustomer extends Model {
	public function addCustomer($data) {
		$this->event->trigger('pre.customer.add', $data);

		if (isset($data['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($data['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $data['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}


		$this->load->model('account/customer_group');

		$customer_group_info = $this->model_account_customer_group->getCustomerGroup($customer_group_id);

		$this->db->query("INSERT INTO " . DB_PREFIX . "customer SET customer_group_id = '" . (int)$customer_group_id . "', store_id = '" . (int)$this->config->get('config_store_id') . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape(utf8_strtolower((string)$data['email'])) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', custom_field = '" . $this->db->escape(isset($data['custom_field']['account']) ? json_encode($data['custom_field']['account']) : '') . "', salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', newsletter = '" . (isset($data['newsletter']) ? (int)$data['newsletter'] : 0) . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', status = '1', approved = '" . (int)!$customer_group_info['approval'] . "', date_added = NOW()");


		$customer_id = $this->db->getLastId();

		$this->db->query("INSERT INTO " . DB_PREFIX . "address SET district_id ='" . (int)$this->db->escape($data['district_id']) . "',  customer_id = '" . (int)$customer_id . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', company = '" . $this->db->escape($data['company']) . "', address_1 = '" . $this->db->escape($data['address_1']) . "', address_2 = '" . $this->db->escape($data['address_2']) . "', postcode = '" . $this->db->escape($data['postcode']) . "', country_id = '" . (int)$data['country_id'] . "', zone_id = '" . (int)$data['zone_id'] . "', custom_field = '" . $this->db->escape(isset($data['custom_field']['address']) ? json_encode($data['custom_field']['address']) : '') . "'");

		$address_id = $this->db->getLastId();

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$customer_id . "'");

		$this->load->language('mail/customer');

		$subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

		$message = sprintf($this->language->get('text_welcome'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')) . "\n\n";

		if (!$customer_group_info['approval']) {
			$message .= $this->language->get('text_login') . "\n";
		} else {
			$message .= $this->language->get('text_approval') . "\n";
		}

		$message .= $this->url->link('account/login', '', 'SSL') . "\n\n";
		$message .= $this->language->get('text_services') . "\n\n";
		$message .= $this->language->get('text_thanks') . "\n";
		$message .= html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');

		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		$mail->setTo($data['email']);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
		$mail->setSubject($subject);
		$mail->setText($message);
		$mail->send();

		// Send to main admin email if new account email is enabled
		if ($this->config->get('config_account_mail')) {
			$message  = $this->language->get('text_signup') . "\n\n";
			$message .= $this->language->get('text_website') . ' ' . html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8') . "\n";
			$message .= $this->language->get('text_firstname') . ' ' . $data['firstname'] . "\n";
			$message .= $this->language->get('text_lastname') . ' ' . $data['lastname'] . "\n";
			$message .= $this->language->get('text_customer_group') . ' ' . $customer_group_info['name'] . "\n";
			$message .= $this->language->get('text_email') . ' '  .  $data['email'] . "\n";
			$message .= $this->language->get('text_telephone') . ' ' . $data['telephone'] . "\n";

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode($this->language->get('text_new_customer'), ENT_QUOTES, 'UTF-8'));
			$mail->setText($message);
			$mail->send();

			// Send to additional alert emails if new account email is enabled
			$emails = explode(',', $this->config->get('config_mail_alert'));

			foreach ($emails as $email) {
				if (utf8_strlen($email) > 0 && preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $email)) {
					$mail->setTo($email);
					$mail->send();
				}
			}
		}

		$this->event->trigger('post.customer.add', $customer_id);

		return $customer_id;
	}

	public function createtblMember($firstname,$lastname,$password,$telephone,$email,$jenis_gdm) { 
        $this->db->query("INSERT INTO tbl_member SET online = 1, statsupdate = 1, usernewsletter = 1, konsulsecid = 0, konsulsubid = 0, tipe = 0, username = '" . 	   $firstname . "', userpassword = '" . $password . "', userfullname = '" . $firstname  . " "  . $lastname . "', 	   useremail = '" . $email . "', userphonegsm  = '" . $telephone . "', userlastloggedin = NOW(), userlastactive = NOW(), usercreateddate =  NOW(), useractivestatus = 1, pvprofile = 3, androidnotif = 1, hargakonsultasi = 99999, jenis_gdm = '" . $jenis_gdm . "'");
	}

	public function createtblMemberJadwal($firstname,$lastname,$password,$telephone,$email,$jenis_gdm,$tipe,$mitraid,$secid_m,$subsecid_m) { 
        $this->db->query("INSERT INTO tbl_member SET online = 1, statsupdate = 1, usernewsletter = 1, konsulsecid = '" . (int)$secid_m . "', konsulsubid = '" . (int)$subsecid_m . "', username = '" . $firstname . "', userpassword = '" . $password . "', userfullname = '" . $firstname  . " "  . $lastname . "', useremail = '" . $email . "', userphonegsm  = '" . $telephone . "', userlastloggedin = NOW(), userlastactive = NOW(), usercreateddate =  NOW(), useractivestatus = 1, pvprofile = 3, androidnotif = 1, hargakonsultasi = 99999, jenis_gdm = '" . $jenis_gdm . "', tipe = '" . (int)$tipe . "', mitraid = '" . (int)$mitraid . "'");
	   
        $userid = $this->db->getLastId();
		if ($jenis_gdm == 'seller') {
         $this->db->query("INSERT INTO tbl_konsultan_jadwal SET update_date = NOW(), hari = 1, online = '06:00:00', offline = '23:00:00', diskon = 100, userid  = '" . (int)$userid . "'");
         $this->db->query("INSERT INTO tbl_konsultan_jadwal SET update_date = NOW(), hari = 2, online = '06:00:00', offline = '23:00:00', diskon = 100, userid  = '" . (int)$userid . "'");
         $this->db->query("INSERT INTO tbl_konsultan_jadwal SET update_date = NOW(), hari = 3, online = '06:00:00', offline = '23:00:00', diskon = 100, userid  = '" . (int)$userid . "'");
         $this->db->query("INSERT INTO tbl_konsultan_jadwal SET update_date = NOW(), hari = 4, online = '06:00:00', offline = '23:00:00', diskon = 100, userid  = '" . (int)$userid . "'");
         $this->db->query("INSERT INTO tbl_konsultan_jadwal SET update_date = NOW(), hari = 5, online = '06:00:00', offline = '23:00:00', diskon = 100, userid  = '" . (int)$userid . "'");
         $this->db->query("INSERT INTO tbl_konsultan_jadwal SET update_date = NOW(), hari = 6, online = '06:00:00', offline = '23:00:00', diskon = 100, userid  = '" . (int)$userid . "'");
         $this->db->query("INSERT INTO tbl_konsultan_jadwal SET update_date = NOW(), hari = 7, online = '06:00:00', offline = '23:00:00', diskon = 100, userid  = '" . (int)$userid . "'");
        }
	}


	
	
    //public function gettblCusttomer($firstname,$lastname,$password,$telephone,$email,$jenis_gdm) {
	//	$this->db->query("INSERT INTO " . DB_PREFIX . "customer SET customer_group_id = '" . (int)$customer_group_id . "', store_id = '" . (int)$this->config->get('config_store_id') . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', custom_field = '" . $this->db->escape(isset($data['custom_field']['account']) ? json_encode($data['custom_field']['account']) : '') . "', salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', newsletter = '" . (isset($data['newsletter']) ? (int)$data['newsletter'] : 0) . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', status = '1', approved = '" . (int)!$customer_group_info['approval'] . "', date_added = NOW()");
	
		
    //}
	
    public function getDataCustomerToSeller($user_email){


	    $query = $this->db->query("SELECT  firstname,lastname,password,telephone FROM oc_customer WHERE email like  '". $this->db->escape(utf8_strtolower((string)$user_email)) . "'");

		if ($query->num_rows) {
			return array(
				'firstname'      => $query->row['firstname'],
				'lastname'       => $query->row['lastname'],
				'password'       => $query->row['password'],
				'telephone'      => $query->row['telephone']									
			);
		} else {
			return false;
		}
	}	
	
	
	  
      
	public function editCustomer($data) {
		$this->event->trigger('pre.customer.edit', $data);

		$customer_id = $this->customer->getId();

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', custom_field = '" . $this->db->escape(isset($data['custom_field']) ? json_encode($data['custom_field']) : '') . "' WHERE customer_id = '" . (int)$customer_id . "'");

		$this->event->trigger('post.customer.edit', $customer_id);
	}

	public function editPassword($email, $password) {
		$this->event->trigger('pre.customer.edit.password');

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($password)))) . "' WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");
		$this->db->query("UPDATE tbl_member SET  userpassword = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($password)))) . "' WHERE LOWER(useremail) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		$this->event->trigger('post.customer.edit.password');
	}


	public function editNewsletter($newsletter) {
		$this->event->trigger('pre.customer.edit.newsletter');

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET newsletter = '" . (int)$newsletter . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");

		$this->event->trigger('post.customer.edit.newsletter');
	}

	public function getCustomer($customer_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row;
	}

	public function getCustomerByEmail($email) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row;
	}

	public function getCustomerByToken($token) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE token = '" . $this->db->escape($token) . "' AND token != ''");

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET token = ''");

		return $query->row;
	}

	public function getTotalCustomersByEmail($email) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row['total'];
	}

	public function getRewardTotal($customer_id) {
		$query = $this->db->query("SELECT SUM(points) AS total FROM " . DB_PREFIX . "customer_reward WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row['total'];
	}

	public function getIps($customer_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "customer_ip` WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->rows;
	}


	public function addLoginAttempt($email) {
	     $member_query = $this->db->query("SELECT * FROM tbl_member WHERE LOWER(useremail) = '" . $this->db->escape(utf8_strtolower((string)$email)) . "'");
		 if ($member_query->num_rows) {
			 $this->userid = $member_query->row['userid'];
			 $this->userfullname = $member_query->row['userfullname'];
		     $this->usertipe = $member_query->row['tipe']; 
			 $this->mitraid = $member_query->row['mitraid'];
			 $this->username = $member_query->row['username'];
			 $this->userpassword = $member_query->row['userpassword'];
			 
		 } else {
			  $this->userid = 0;
			  $this->userfullname ='';
			  $this->usertipe = 0;
			  $this->mitraid = 0;
			  $this->username = '';
			  $this->userpassword = '';
		}	 	

	     //$member_query = $this->db->query("SELECT * FROM tbl_device WHERE userid like  '" . (int)$this->userid . "'");
		 //if ($member_query->num_rows) {
		//	 $this->deviceid = $member_query->row['deviceid'];
		//	 $this->device = $member_query->row['device'];
		  
			 
		// } else {
		//	 $this->deviceid = '';
		//	 $this->device = '';
 		//}	 	        


         $ipX  = $_SERVER['REMOTE_ADDR'];
		 
		//echo "<script src='catalog/view/theme/journal2/js/clear.js'></script>";
			 
		 //$this->AksesClear();
	    $member_query = $this->db->query("SELECT * FROM oc_sessionlink_dummy WHERE session_id='$ipX'");	
		if ($member_query->num_rows) {
			 $this->deviceid = $member_query->row['device_id'];
			 $this->device = '';
		  
			 
		} else {
			 $this->deviceid = '';
			 $this->device = '';
 		}	 	        


	     $member_query = $this->db->query("SELECT * FROM tbl_device WHERE userid like  '" . (int)$this->userid . "'");
		 if ($member_query->num_rows) {
			 $this->db->query("DELETE FROM tbl_device WHERE userid like  '" . (int)$this->userid . "'");
		 }	 	        

	     $this->db->query("INSERT INTO tbl_device SET userid = '" . (int)$this->userid . "', deviceid = '" . $this->deviceid . "', create_date = '" . $this->db->escape(date('Y-m-d H:i:s')) . "', update_date = '" . $this->db->escape(date('Y-m-d H:i:s')) . "'");	
	
		 $this->db->query("DELETE FROM oc_sessionlink_dummy WHERE device_id like  '" . $this->deviceid . "'");
	
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_login WHERE email = '" . $this->db->escape(utf8_strtolower((string)$email)) . "'");

		if (!$query->num_rows) {
						
			//$this->db->query("INSERT INTO " . DB_PREFIX . "customer_login SET userid = '" . (int)$this->userid . "', userfullname = '" . $this->userfullname . "', usertipe = '" . (int)$this->usertipe . "', mitraid = '" . (int)$this->mitraid . "', username = '" . $this->username . "', userpassword = '" . $this->userpassword . "', email = '" . $this->db->escape(utf8_strtolower((string)$email)) . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', total = 1, date_added = '" . $this->db->escape(date('Y-m-d H:i:s')) . "', date_modified = '" . $this->db->escape(date('Y-m-d H:i:s')) . "'");			
				
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer_login SET userid = '" . (int)$this->userid . "', userfullname = '" . $this->userfullname . "', usertipe = '" . (int)$this->usertipe . "', mitraid = '" . (int)$this->mitraid . "', username = '" . $this->username . "', userpassword = '" . $this->userpassword . "', deviceid = '" . $this->deviceid . "', device = '" . $this->device . "', email = '" . $this->db->escape(utf8_strtolower((string)$email)) . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', total = 1, date_added = '" . $this->db->escape(date('Y-m-d H:i:s')) . "', date_modified = '" . $this->db->escape(date('Y-m-d H:i:s')) . "'");		
				
		} else {
			//$this->db->query("UPDATE " . DB_PREFIX . "customer_login SET ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', total = (total + 1), date_modified = '" . $this->db->escape(date('Y-m-d H:i:s')) . "', userid = '" . (int)$this->userid . "', userfullname = '" . $this->userfullname . "', usertipe = '" . (int)$this->usertipe . "', mitraid = '" . (int)$this->mitraid . "', username = '" . $this->username . "', userpassword = '" . $this->userpassword . "' WHERE email = '" . $this->db->escape(utf8_strtolower((string)$email)) . "'");
			
			$this->db->query("UPDATE " . DB_PREFIX . "customer_login SET ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', total = (total + 1), date_modified = '" . $this->db->escape(date('Y-m-d H:i:s')) . "', userid = '" . (int)$this->userid . "', userfullname = '" . $this->userfullname . "', usertipe = '" . (int)$this->usertipe . "', mitraid = '" . (int)$this->mitraid . "', username = '" . $this->username . "', userpassword = '" . $this->userpassword . "', deviceid = '" . $this->deviceid . "', device = '" . $this->device . "' WHERE email = '" . $this->db->escape(utf8_strtolower((string)$email)) . "'");			
	
			
		}
		
				
	}
	


	public function getLoginAttempts($email) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "customer_login` WHERE email = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row;
	}

	public function deleteLoginAttempts($email) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "customer_login` WHERE email = '" . $this->db->escape(utf8_strtolower($email)) . "'");
	}
	
	public function getIsPartner($id) {
		$query = $this->db->query("SELECT is_partner FROM " . DB_PREFIX . "customerpartner_to_customer WHERE customer_id = '" . (int)$id . "'");

		if ($query->num_rows) {
			return array(
				'is_partner'       => $query->row['is_partner']
									
			);
		} else {
			return false;
		}
	}	

	public function getSessionLink($linkweb,$user_email,$user_emailseller,$from_useridX,$to_useridX,$chat_idX,$from_useridX_m,$to_useridX_m,$linktarget,$ipX){
 
 	    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sessionlink WHERE email like  '" . $this->db->escape(utf8_strtolower((string)$user_email)) . "'");
	
		if ($query->num_rows) {
	        $queryX = $this->db->query("SELECT * FROM " . DB_PREFIX . "sessionlink where email like '" . $this->db->escape(utf8_strtolower((string)$user_email)) . "' and session_id != '" . $this->db->escape($this->session->getId()) . "'");
			if ($queryX->num_rows) {
			 // return false;
			//} else {
				//$linkweb = "https://gudangmaterials.id/index.php?route=product/product&path=595&product_id=277";
			  $this->db->query("UPDATE " . DB_PREFIX . "sessionlink SET  ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', session_id = '" . $this->db->escape($this->session->getId()) . "', linktarget = '" . $linktarget . "', from_userid_m = '" . (int)$from_useridX_m . "', to_userid_m = '" . (int)$to_useridX_m . "', from_userid = '" . (int)$from_useridX . "', to_userid = '" . (int)$to_useridX . "', chat_id = '" . (int)$chat_idX . "', link = '" . $linkweb . "', emailseller = '" . $user_emailseller . "' WHERE  email like  '" . $this->db->escape(utf8_strtolower((string)$user_email)) . "'");
			  return true;
			}
			 return true;
			 
		} else {
		  $queryY = $this->db->query("SELECT * FROM " . DB_PREFIX . "sessionlink where email != '" . $this->db->escape(utf8_strtolower((string)$user_email)) . "' and session_id = '" . $this->db->escape($this->session->getId()) . "'");
		  if ($queryY->num_rows) {			 
			  $this->db->query("DELETE FROM " . DB_PREFIX . "sessionlink where email != '" . $this->db->escape(utf8_strtolower((string)$user_email)) . "' and session_id = '" . $this->db->escape($this->session->getId()) . "'");
			  $this->db->query("INSERT " . DB_PREFIX . "sessionlink SET ip = '" . $ipX . "', linktarget = '" . $linktarget . "', from_userid_m = '" . (int)$from_useridX_m . "', to_userid_m = '" . (int)$to_useridX_m . "', from_userid = '" . (int)$from_useridX . "', to_userid = '" . (int)$to_useridX . "', chat_id = '" . (int)$chat_idX . "', session_id = '" . $this->db->escape($this->session->getId()) . "', link = '" . $linkweb . "', email = '" . $this->db->escape(utf8_strtolower((string)$user_email)) . "', emailseller = '" . $user_emailseller . "'");
			  return true;
		   } else {
	
			  $this->db->query("INSERT " . DB_PREFIX . "sessionlink SET ip = '" . $ipX . "', linktarget = '" . $linktarget . "', from_userid_m = '" . (int)$from_useridX_m . "', to_userid_m = '" . (int)$to_useridX_m . "', from_userid = '" . (int)$from_useridX . "', to_userid = '" . (int)$to_useridX . "', chat_id = '" . (int)$chat_idX . "', session_id = '" . $this->db->escape($this->session->getId()) . "', link = '" . $linkweb . "', email = '" . $this->db->escape(utf8_strtolower((string)$user_email)) . "', emailseller = '" . $user_emailseller . "'");
			  return true;			   
		  }
		  
		   return true;
        }
	}			




	public function getFromUserIdMember($user_email){
 		$query = $this->db->query("SELECT userid FROM tbl_member WHERE useremail like  '". $this->db->escape(utf8_strtolower((string)$user_email)) . "'");

		if ($query->num_rows) {
			return array(
				'from_userid'       => $query->row['userid']
									
			);
		} else {
			return false;
		}
	}	

	public function getToUserIdMember($user_email){
 		$query = $this->db->query("SELECT userid FROM tbl_member WHERE useremail like  '". $this->db->escape(utf8_strtolower((string)$user_email)) . "'");

		if ($query->num_rows) {
			return array(
				'to_userid'       => $query->row['userid']
									
			);
		} else {
			return false;
		}
	}	

	public function addMemberToSeller($firstname,$lastname,$password,$telephone,$email){	
		
        $this->db->query("INSERT INTO tbl_member SET online = 1, statsupdate = 1, usernewsletter = 1, konsulsecid = 15, konsulsubid = 50, tipe = 1, username = '" . $firstname . "', userpassword = '" . $password . "', userfullname = '" . $firstname  . " "  . $lastname . "', useremail = '" . $email . "', userphonegsm  = '" . $telephone . "', userlastloggedin = NOW(), userlastactive = NOW(), usercreateddate =  NOW(), useractivestatus = 1, pvprofile = 3, androidnotif = 1, hargakonsultasi = 99999, jenis_gdm = '" . "seller" . "'");
        $userid = $this->db->getLastId();
        $this->db->query("INSERT INTO tbl_konsultan_jadwal SET update_date = NOW(), hari = 1, online = '06:00:00', offline = '23:00:00', diskon = 100, userid  = '" . (int)$userid . "'");
        $this->db->query("INSERT INTO tbl_konsultan_jadwal SET update_date = NOW(), hari = 2, online = '06:00:00', offline = '23:00:00', diskon = 100, userid  = '" . (int)$userid . "'");
        $this->db->query("INSERT INTO tbl_konsultan_jadwal SET update_date = NOW(), hari = 3, online = '06:00:00', offline = '23:00:00', diskon = 100, userid  = '" . (int)$userid . "'");
        $this->db->query("INSERT INTO tbl_konsultan_jadwal SET update_date = NOW(), hari = 4, online = '06:00:00', offline = '23:00:00', diskon = 100, userid  = '" . (int)$userid . "'");
        $this->db->query("INSERT INTO tbl_konsultan_jadwal SET update_date = NOW(), hari = 5, online = '06:00:00', offline = '23:00:00', diskon = 100, userid  = '" . (int)$userid . "'");
        $this->db->query("INSERT INTO tbl_konsultan_jadwal SET update_date = NOW(), hari = 6, online = '06:00:00', offline = '23:00:00', diskon = 100, userid  = '" . (int)$userid . "'");
        $this->db->query("INSERT INTO tbl_konsultan_jadwal SET update_date = NOW(), hari = 7, online = '06:00:00', offline = '23:00:00', diskon = 100, userid  = '" . (int)$userid . "'");

    }

	public function getChatId($from_useridX_m,$to_useridX_m){
 		$query = $this->db->query("SELECT  max(chat_id) as chat_id  from tbl_chat where from_userid = '" . (int)$from_useridX_m . "' and to_userid = '" . (int)$to_useridX_m . "' order by chat_id desc");

		if ($query->num_rows) {
			return array(
				'chat_id'       => $query->row['chat_id']
									
			);
		} else {
			return $query->row['chat_id'];
		}
	}


	public function getChatIdMessage($chat_id){
 		$query = $this->db->query("SELECT  count(*) as total_chat_id  from tbl_chat_message where chat_id = '" . (int)$chat_id . "'");

		if ($query->num_rows) {
			return array(
				'total_chat_id'       => $query->row['total_chat_id']
									
			);
		} else {
			return false;
		}
	}


	public function getIdMemberSeller($user_email){
 		$query = $this->db->query("SELECT  count(*) as total_user_id  from tbl_member where useremail like  '". $this->db->escape(utf8_strtolower((string)$user_email)) . "'");

		if ($query->num_rows) {
			return array(
				'total_user_id'       => $query->row['total_user_id']
									
			);
		} else {
			return $query->row['total_user_id'];
		}
	}
	
	public function createChatIdMessage($from_useridX_m,$to_useridX_m){
		$waktuhabis = date("Y-m-d H:i:s", strtotime("+1000 day"));
		$waktunotif = date("Y-m-d H:i:s", strtotime("+1000 day"));		
		$this->db->query("INSERT tbl_chat SET  rate = 1, create_date = NOW(), update_date = NOW(), waktunotif = '" . $waktunotif . "',  waktuhabis = '" . $waktuhabis . "', readterm = 1, paid = 1, finish = 0, isfree = 1, harga = 35000, hargax = 35000, quantity = 1, total = 35000, jmlchat = 1, program = 'cus-seller', from_userid = '" . (int)$from_useridX_m . "', to_userid = '" . (int)$to_useridX_m . "'");	
        $chat_id = $this->db->getLastId();
		
		//$this->db->query("INSERT tbl_chat_message SET iskirim =1, pesan = 'Hallo, ada yg bisa kami bantu', create_date = NOW(), update_date = NOW(), chat_id = '" . (int)$chat_id . "',  from_userid = '" . (int)$from_useridX_m . "', to_userid = '" . (int)$to_useridX_m . "'");	
    return  $chat_id;   

	}


	public function createMessage($from_useridX_m,$to_useridX_m,$chat_idX){
		
			
		$this->db->query("INSERT tbl_chat_message SET iskirim =1, pesan = 'Hallo, bisa dibantu', create_date = NOW(), update_date = NOW(), chat_id = '" . (int)$chat_idX . "',  from_userid = '" . (int)$from_useridX_m . "', to_userid = '" . (int)$to_useridX_m . "'");	
        $id = $this->db->getLastId();
		
		$this->db->query("UPDATE tbl_member SET isketik =0 where userid = '" . (int)$to_useridX_m . "'");	
        

	return  $id;   	
	}

	public function createChatId($from_useridX_m,$to_useridX_m){
		$waktuhabis = date("Y-m-d H:i:s", strtotime("+1000 day"));
		$waktunotif = date("Y-m-d H:i:s", strtotime("+1000 day"));		
		$this->db->query("INSERT tbl_chat SET  rate = 1, create_date = NOW(), update_date = NOW(), waktunotif = '" . $waktunotif . "',  waktuhabis = '" . $waktuhabis . "', readterm = 1, paid = 1, finish = 0, isfree = 1, harga = 35000, hargax = 35000, quantity = 1, total = 35000, jmlchat = 1, program = 'cus-seller', from_userid = '" . (int)$from_useridX_m . "', to_userid = '" . (int)$to_useridX_m . "'");	
        $chat_id = $this->db->getLastId();
		
	
		
	     return  $chat_id;	
		
	}
	



	public function createChatId2($from_useridX_m,$to_useridX_m){
		
		$this->db->query("INSERT tbl_chat SET  create_date = NOW(), update_date = NOW(), waktunotif = NOW(), waktuhabis = NOW(), readterm = 1, paid = 1, finish = 0, isfree = 1, harga = 35000, hargax = 35000, quantity = 1, total = 35000, jmlchat = 1, program = 'cus-seller', from_userid = '" . (int)$from_useridX_m . "', to_userid = '" . (int)$to_useridX_m . "'");	
        $chat_id = $this->db->getLastId();
		return $chat_id;
	}


	public function getIsIP($user_email) {
		$query = $this->db->query("SELECT ip FROM " . DB_PREFIX . "customer_login WHERE email like  '". $this->db->escape(utf8_strtolower((string)$user_email)) . "'");

		if ($query->num_rows) {
			return array(
				'ip'       => $query->row['ip']
									
			);
		} else {
			return false;
		}
	}	
	
	public function getIsIP2($user_email) {
		$query = $this->db->query("SELECT ip FROM " . DB_PREFIX . "customer WHERE email like  '". $this->db->escape(utf8_strtolower((string)$user_email)) . "'");

		if ($query->num_rows) {
			return array(
				'ip'       => $query->row['ip']
									
			);
		} else {
			return false;
		}
	}	
   // public function createItem(){
   //   $aksesXYZ = echo '<script>sessionStorage.aksesX = "helloxxxx";</script>';
	//return false;
	//}

	public function set($akses,$from_useridX_m,$user_email,$is_partner) {
		$this->code = $akses;

		if (!isset($this->session->data['akses']) || ($this->session->data['akses'] != $akses)) {
			$this->session->data['akses'] = $akses;
		}

		if (!isset($this->request->cookie['akses']) || ($this->request->cookie['akses'] != $akses)) {
			setcookie('KeyNote', $akses, time() + 60 * 60 * 24 * 30, '/', $this->request->server['HTTP_HOST']);

			//if ($result = $this->db->query("SHOW TABLES LIKE '" . "oc_sessionlink" . $from_useridX_m . "'"  )) {
				//if($result->num_rows == 1) {
					//$this->db->query("UPDATE " . "oc_sessionlink" .$from_useridX_m . " SET from_userid = " . $from_useridX_m .  ", email = '". $this->db->escape(utf8_strtolower((string)$user_email)) . "', session_id = '" . $akses . "'");			
				//}
			//} else {
                    //$this->db->query("CREATE TABLE " . "oc_sessionlink" . $from_useridX_m . " as SELECT * FROM oc_sessionlink_blank");
					//$this->db->query("INSERT INTO " . "oc_sessionlink" . $from_useridX_m . " SET from_userid = " . $from_useridX_m .  ", email = '". $this->db->escape(utf8_strtolower((string)$user_email)) . "', session_id = '" . $akses . "'");
			//}
            if ($this->getTableSessionLink($from_useridX_m)) {
			     $this->db->query("UPDATE " . "oc_sessionlink" .$from_useridX_m . " SET is_partner = " . $is_partner . ", from_userid = " . $from_useridX_m .  ", email = '". $this->db->escape(utf8_strtolower((string)$user_email)) . "', session_id = '" . $akses . "'");				
			} else {
				
                //$this->db->query("DROP  TABLE " . "oc_sessionlink" . $from_useridX_m . "");			
                $this->db->query("CREATE TABLE " . "oc_sessionlink" . $from_useridX_m . " as SELECT * FROM oc_sessionlink_blank");
			    $this->db->query("INSERT INTO " . "oc_sessionlink" . $from_useridX_m . " SET is_partner = " . $is_partner . ", from_userid = " . $from_useridX_m .  ", email = '". $this->db->escape(utf8_strtolower((string)$user_email)) . "', session_id = '" . $akses . "'");
			}
			
			$this->db->query("UPDATE " . DB_PREFIX . "sessionlink2 SET is_partner = " . $is_partner . ", from_userid = " . $from_useridX_m .  ", email = '". $this->db->escape(utf8_strtolower((string)$user_email)) . "', session_id = '" . $akses . "'");							
				
            return $akses;	
		}
	}

	public function setTest($aksesX) {
		$this->code = $aksesX;

		if (!isset($this->session->data['aksesNot']) || ($this->session->data['aksesNot'] != $aksesX)) {
			$this->session->data['aksesNot'] = $aksesX;
		}

		if (!isset($this->request->cookie['aksesNot']) || ($this->request->cookie['aksesNot'] != $aksesX)) {
		    setcookie('userid', $aksesX, time() + 60 * 60 * 24 * 30, '/', $this->request->server['HTTP_HOST']);
			//$aksesX = $_COOKIE[$aksesX];
			//$this->db->query("INSERT " . DB_PREFIX . "sessionlink2 SET  session_id = '" . $aksesX . "'");
			
        return $aksesX;
	
		}
	}	


	public function setNot($aksesX) {
		$this->code = $aksesX;

		if (!isset($this->session->data['aksesNot']) || ($this->session->data['aksesNot'] != $aksesX)) {
			$this->session->data['aksesNot'] = $aksesX;
		}

		if (!isset($this->request->cookie['aksesNot']) || ($this->request->cookie['aksesNot'] != $aksesX)) {
		    setcookie('aksesNot', $aksesX, time() + 60 * 60 * 24 * 30, '/', $this->request->server['HTTP_HOST']);
			//$aksesX = $_COOKIE[$aksesX]);
			$this->db->query("INSERT " . DB_PREFIX . "sessionlink2 SET  session_id = '" . $aksesX . "'");
			

        return $aksesX;
	
		}
	}	

	
	public function AksesClear() {
		
	 //// echo '<script src="catalog/view/theme/journal2/js/clear.js"> </script>';
	 //echo '<script> localStorage.clear() </script>';
	 
	
     $this->journal2->minifier->addScript('catalog/view/theme/journal2/js/clear.js', 'header');
	 }	

	public function getTableSessionLink($from_useridX_m){
 		$query = $this->db->query("SHOW TABLES LIKE '" . "oc_sessionlink" . $from_useridX_m . "'" );

		if ($query->num_rows) {
			return true;
		} else {
			return false;
		}
	}


	
}
