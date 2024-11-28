<?php
class ModelSaleOrder extends Model {

        // hpwd
    public function removeShippingNumber($order_id) {
        $this->db->query("UPDATE `".DB_PREFIX."order` SET shipping_number='', courier='', change_shipping_number='', change_courier='' WHERE order_id ='".(int)$order_id."' ");
        
        $query = $this->db->query("SELECT shipment_profile_id, order_id FROM `".DB_PREFIX."shipment_profile` WHERE order_id ='".(int)$order_id."' ");
        
        if($query->num_rows) {
             $this->db->query("DELETE FROM `".DB_PREFIX."shipment_profile` WHERE order_id ='".(int)$order_id."'");
             $this->db->query("DELETE FROM `".DB_PREFIX."shipment_manifest` WHERE shipment_profile_id ='".(int)$query->row['shipment_profile_id']."' ");
        }
    }

	public function getShippingOrder($order_id){
		$query = $this->db->query("SELECT shipping_number, courier, change_courier, change_shipping_number FROM `" . DB_PREFIX . "order` WHERE order_id = ". (int)$order_id);
		return $query->row;
	}

	public function setShippingNumber($order_id, $shipping_number, $courier) {

        $sql = "UPDATE `". DB_PREFIX . "order` SET shipping_number = '". $shipping_number ."', courier = '".$courier."' ";

        $so_info = $this->getShippingOrder($order_id);

        if($so_info) {
            // if change courier and or shipping number
            $val = ($so_info['courier'] != $courier) ? '1' : '0';
            $sql .= " , change_courier='".$val."' ";

            $val = ($so_info['shipping_number'] != $shipping_number) ? '1' : '0';
            $sql .= " , change_shipping_number='".$val."' ";
        }

		$update = $this->db->query($sql." WHERE order_id ='".(int)$order_id."'");

		$shipment_check = $this->db->query("SELECT * FROM `". DB_PREFIX ."shipment_profile` WHERE order_id ='".(int)$order_id."'");

		if($shipment_check->num_rows < 1) {
			$this->db->query("INSERT INTO `". DB_PREFIX ."shipment_profile` (`shipment_profile_id`, `order_id`, `waybill_number`, `waybill_date`, `courier_name`, `service_code`, `origin`, `weight`, `destination`, `shippper_name`, `receiver_name`, `receiver_address1`, `receiver_address2`, `receiver_address3`, `status`, `pod_receiver`, `pod_date`, `pod_time`) VALUES (NULL, '".(int)$order_id."', '".$shipping_number."', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)");
		}

        return $update ? true : false;

    }

	public function getTracking($order_id, $shipping_number, $courier) {
        $this->load->language('module/hp_tracking_setting');

        $val_return = array();

        $key = $this->config->get('hp_tracking_apitype') == 'ownapi' ? $this->config->get('hp_tracking_rajaongkirapi') : $this->config->get('hpwd_theq_t');

        if($this->config->get('hp_tracking_api_usage') && $key) {

		$shipment_profile = $this->db->query("SELECT shipment_profile_id, TIMESTAMPDIFF(HOUR, last_update, NOW()) as df FROM `". DB_PREFIX ."shipment_profile` WHERE order_id = ". (int)$order_id);

        $so_info = $this->getShippingOrder($order_id);

        if($shipment_profile->num_rows) {
		  $shipment_manifest = $this->db->query("SELECT * FROM `". DB_PREFIX ."shipment_manifest` WHERE shipment_profile_id = ".(int)$shipment_profile->row['shipment_profile_id']);
        }

         $time = ($shipment_profile->row['df'] >= 2) OR !isset($shipment_profile->row['df']);

     // if admin changes courier or time elapsed or still empty manifest
		if(($so_info && $so_info['change_courier'] == 1) || ($so_info && $so_info['change_shipping_number'] == 1) || $time || $shipment_manifest->num_rows < 1) {

			if(strlen($shipping_number) > 0 AND strlen($courier) > 0) {

        $key = $this->config->get('hp_tracking_apitype') == 'ownapi' ? $this->config->get('hp_tracking_rajaongkirapi') : $this->config->get('hpwd_theq_t');

				$curl = curl_init();

				curl_setopt_array($curl, array(
					CURLOPT_URL => "https://pro.rajaongkir.com/api/waybill",
					CURLOPT_RETURNTRANSFER => true,
					CURLOPT_ENCODING => "",
					CURLOPT_MAXREDIRS => 10,
					CURLOPT_TIMEOUT => 30,
					CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
					CURLOPT_CUSTOMREQUEST => "POST",
					CURLOPT_POSTFIELDS => "waybill=".$shipping_number."&courier=".$courier."",
					CURLOPT_HTTPHEADER => array(
						"content-type: application/x-www-form-urlencoded",
						"key: ".$key.""
					),
				));

				$response = curl_exec($curl);
				$err = curl_error($curl);

				curl_close($curl);

				$data = json_decode($response, TRUE);
				if($data['rajaongkir']['status']['code'] == 200){
					$delivered_status = $data['rajaongkir']['result']['delivered']; //resi
					$w_number = $data['rajaongkir']['result']['details']['waybill_number']; //resi
					$w_date = $data['rajaongkir']['result']['details']['waybill_date']; //tgl pengiriman
					$courier = $data['rajaongkir']['result']['summary']['courier_name']; //kurir
					$service = $data['rajaongkir']['result']['summary']['service_code']; //paket pegiriman
					$origin = $data['rajaongkir']['result']['summary']['origin']; //org
					$weight = $data['rajaongkir']['result']['details']['weight']; //berat brng
					$destination = $data['rajaongkir']['result']['details']['destination'];
					$s_name = $data['rajaongkir']['result']['details']['shippper_name']; //nama pengirim
					$r_name = $data['rajaongkir']['result']['details']['receiver_name']; //nama Penerima
					$r_addr1 = $data['rajaongkir']['result']['details']['receiver_address1']; //alamat pengirim
					$r_addr2 = $data['rajaongkir']['result']['details']['receiver_address2']; //alamat pengirim
					$r_addr3 = $data['rajaongkir']['result']['details']['receiver_address3']; //alamat pengirim
					$status = $data['rajaongkir']['result']['delivery_status']['status']; //sts pengiriman
					$pod_receiver = $data['rajaongkir']['result']['delivery_status']['pod_receiver'];
					$pod_date = $data['rajaongkir']['result']['delivery_status']['pod_date'];
					$pod_time = $data['rajaongkir']['result']['delivery_status']['pod_time'];
					
                    $this->db->query("UPDATE `". DB_PREFIX ."shipment_profile` SET `waybill_number` = '". $w_number ."', `waybill_date` = '". $w_date ."', `courier_name` = '". $courier ."', `service_code` = '". $service ."', `origin` = '". $origin ."', `weight` = '". $weight ."', `destination` = '". $destination ."', `shippper_name` = '". $s_name ."', `receiver_name` = '". $r_name ."', `receiver_address1` = '". $r_addr1 ."', `receiver_address2` = '". $r_addr2 ."', `receiver_address3` = '". $r_addr3 ."', `status` = '". $status ."', `pod_receiver` = '". $pod_receiver ."', `pod_date` = '". $pod_date ."', `pod_time` = '". $pod_time ."', `last_update` = NOW() WHERE order_id = ".(int)$order_id);
        
                    $this->db->query("UPDATE `". DB_PREFIX ."order` SET `date_modified` = NOW() WHERE order_id = ".(int)$order_id);

                    $manifests = array();

						$this->db->query("DELETE FROM `". DB_PREFIX ."shipment_manifest` WHERE shipment_profile_id = ".(int)$shipment_profile->row['shipment_profile_id']);

						for($i=0;$i<count($data['rajaongkir']['result']['manifest']);$i++){
							$manifest_code = $data['rajaongkir']['result']['manifest'][$i]['manifest_code'];
							$manifest_desc = $data['rajaongkir']['result']['manifest'][$i]['manifest_description'];
							$manifest_date = $data['rajaongkir']['result']['manifest'][$i]['manifest_date'];
							$manifest_time = $data['rajaongkir']['result']['manifest'][$i]['manifest_time'];
							$manifest_city = $data['rajaongkir']['result']['manifest'][$i]['city_name'];
							$this->db->query("INSERT INTO `". DB_PREFIX ."shipment_manifest` VALUES (NULL, ".(int)$shipment_profile->row['shipment_profile_id'].",'".$manifest_code."','".$manifest_desc."','".$manifest_date."','".$manifest_time."','".$manifest_city."')");

                             $manifests[] = array(
                                'manifest_code' => $manifest_code,
                                'manifest_description' => $manifest_desc,
                                'manifest_date' => $manifest_date,
                                'manifest_time' => $manifest_time,
                                'city_name' => $manifest_city
                            );
					}

					 $val_return = array(
                        'status'   => 200,
                        'message'  => $data['rajaongkir']['status']['description'],
                        'profile'  => array(
                            'status' => $delivered_status,
                            'waybill_number' => $w_number,
                            'waybill_date' => $w_date,
                            'courier_name' => $courier,
                            'service_code' => $service,
                            'origin' => $origin,
                            'weight' => $weight,
                            'destination' => $destination,
                            'shippper_name' => $s_name,
                            'receiver_name' => $r_name,
                            'receiver_address1' => $r_addr1,
                            'receiver_address2' => $r_addr2,
                            'receiver_address3' => $r_addr3,
                            'status' => $status,
                            'pod_receiver' => $pod_receiver,
                            'pod_date' => $pod_date,
                            'pod_time' => $pod_time
                        ),
                        'manifest'  => $manifests
                     );

            // disable change courrier and shipping number 
		      $query = $this->db->query("UPDATE  `" . DB_PREFIX . "order` SET change_courier = '0', change_shipping_number='0' WHERE order_id = ". (int)$order_id);

				} else if($data['rajaongkir']['status']['code'] == 400) {
                    $val_return = array(
                        'status'   => 400,
                        'message'  => $data['rajaongkir']['status']['description'],
                        'profile'  => array(),
                        'manifest'  => array()
                    );
            // enabled change courrier and shipping number
		      $query = $this->db->query("UPDATE  `" . DB_PREFIX . "order` SET change_courier = '1', change_shipping_number='1', courier='', shipping_number='' WHERE order_id = ". (int)$order_id);
				}
			}
		} else if($so_info) {
			$data = array();
			
            $sp = $this->db->query("SELECT * FROM `". DB_PREFIX ."shipment_profile` WHERE order_id = ".(int)$order_id);
            if($sp->num_rows) {
            $sm = $this->db->query("SELECT * FROM `". DB_PREFIX ."shipment_manifest` WHERE shipment_profile_id = '".$sp->row['shipment_profile_id']."' ORDER BY manifest_date DESC, manifest_time DESC");

            if($sm->num_rows) {
			$data['shipment_profile'] = $sp->row;
			$data['shipment_manifest'] = $sm->rows;

                 $val_return = array(
                        'status'   => 200,
                        'message'  => 'OK',
                        'profile'  => $data['shipment_profile'],
                        'manifest' => $data['shipment_manifest']
                 );
                }
            }  else {
                 $val_return = array(
                    'status'   => 400,
                    'message'  => 'Resi belum diinput',
                    'profile'  => array(),
                    'manifest' => array()
             );
            }
		  } else {
               $val_return = array(
                    'status'   => 400,
                    'message'  => 'Resi belum diinput',
                    'profile'  => array(),
                    'manifest' => array()
             );
        }

     } else {
            $val_return = array(
                'status'   => 400,
                'message'  => $this->language->get('text_limit_usage_warning'),
                'profile'  => array(),
                'manifest' => array()
          );
        }

        return $val_return;
	}

 public function getExtensions($type) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "extension WHERE `type` = '" . $this->db->escape($type) . "'");

		return $query->rows;
	}
            
	public function getOrder($order_id) {
		$order_query = $this->db->query("SELECT *, (SELECT CONCAT(c.firstname, ' ', c.lastname) FROM " . DB_PREFIX . "customer c WHERE c.customer_id = o.customer_id) AS customer FROM `" . DB_PREFIX . "order` o WHERE o.order_id = '" . (int)$order_id . "'");

		if ($order_query->num_rows) {
			$reward = 0;

			$order_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");

			foreach ($order_product_query->rows as $product) {
				$reward += $product['reward'];
			}

			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$order_query->row['payment_country_id'] . "'");

			if ($country_query->num_rows) {
				$payment_iso_code_2 = $country_query->row['iso_code_2'];
				$payment_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$payment_iso_code_2 = '';
				$payment_iso_code_3 = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$order_query->row['payment_zone_id'] . "'");

			if ($zone_query->num_rows) {
				$payment_zone_code = $zone_query->row['code'];
			} else {
				$payment_zone_code = '';
			}

			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$order_query->row['shipping_country_id'] . "'");

			if ($country_query->num_rows) {
				$shipping_iso_code_2 = $country_query->row['iso_code_2'];
				$shipping_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$shipping_iso_code_2 = '';
				$shipping_iso_code_3 = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$order_query->row['shipping_zone_id'] . "'");

			if ($zone_query->num_rows) {
				$shipping_zone_code = $zone_query->row['code'];
			} else {
				$shipping_zone_code = '';
			}

			if ($order_query->row['affiliate_id']) {
				$affiliate_id = $order_query->row['affiliate_id'];
			} else {
				$affiliate_id = 0;
			}

			$this->load->model('marketing/affiliate');

			$affiliate_info = $this->model_marketing_affiliate->getAffiliate($affiliate_id);

			if ($affiliate_info) {
				$affiliate_firstname = $affiliate_info['firstname'];
				$affiliate_lastname = $affiliate_info['lastname'];
			} else {
				$affiliate_firstname = '';
				$affiliate_lastname = '';
			}

			$this->load->model('localisation/language');

			$language_info = $this->model_localisation_language->getLanguage($order_query->row['language_id']);

			if ($language_info) {
				$language_code = $language_info['code'];
				$language_directory = $language_info['directory'];
			} else {
				$language_code = '';
				$language_directory = '';
			}

			return array(
				'order_id'                => $order_query->row['order_id'],
				'invoice_no'              => $order_query->row['invoice_no'],
				'invoice_prefix'          => $order_query->row['invoice_prefix'],
				'store_id'                => $order_query->row['store_id'],
				'store_name'              => $order_query->row['store_name'],
				'store_url'               => $order_query->row['store_url'],
				'customer_id'             => $order_query->row['customer_id'],
				'customer'                => $order_query->row['customer'],
				'customer_group_id'       => $order_query->row['customer_group_id'],
				'firstname'               => $order_query->row['firstname'],
				'lastname'                => $order_query->row['lastname'],
				'email'                   => $order_query->row['email'],
				'telephone'               => $order_query->row['telephone'],
				'fax'                     => $order_query->row['fax'],
				'custom_field'            => json_decode($order_query->row['custom_field'], true),
				'payment_firstname'       => $order_query->row['payment_firstname'],
				'payment_lastname'        => $order_query->row['payment_lastname'],
				'payment_company'         => $order_query->row['payment_company'],
				'payment_address_1'       => $order_query->row['payment_address_1'],
				'payment_address_2'       => $order_query->row['payment_address_2'],
				'payment_postcode'        => $order_query->row['payment_postcode'],
				'payment_city'            => $order_query->row['payment_city'],
				'payment_zone_id'         => $order_query->row['payment_zone_id'],
				'payment_zone'            => $order_query->row['payment_zone'],
				'payment_zone_code'       => $payment_zone_code,
				'payment_country_id'      => $order_query->row['payment_country_id'],
				'payment_country'         => $order_query->row['payment_country'],
				'payment_iso_code_2'      => $payment_iso_code_2,
				'payment_iso_code_3'      => $payment_iso_code_3,
				'payment_address_format'  => $order_query->row['payment_address_format'],
				'payment_custom_field'    => json_decode($order_query->row['payment_custom_field'], true),
				'payment_method'          => $order_query->row['payment_method'],
				'payment_code'            => $order_query->row['payment_code'],
				'shipping_firstname'      => $order_query->row['shipping_firstname'],
				'shipping_lastname'       => $order_query->row['shipping_lastname'],
				'shipping_company'        => $order_query->row['shipping_company'],
				'shipping_address_1'      => $order_query->row['shipping_address_1'],
				'shipping_address_2'      => $order_query->row['shipping_address_2'],
				'shipping_postcode'       => $order_query->row['shipping_postcode'],
				'shipping_city'           => $order_query->row['shipping_city'],
				'shipping_zone_id'        => $order_query->row['shipping_zone_id'],
				'shipping_zone'           => $order_query->row['shipping_zone'],
				'shipping_zone_code'      => $shipping_zone_code,
				'shipping_country_id'     => $order_query->row['shipping_country_id'],
				'shipping_country'        => $order_query->row['shipping_country'],
				'shipping_iso_code_2'     => $shipping_iso_code_2,
				'shipping_iso_code_3'     => $shipping_iso_code_3,
				'shipping_address_format' => $order_query->row['shipping_address_format'],
				'shipping_custom_field'   => json_decode($order_query->row['shipping_custom_field'], true),
				'shipping_method'         => $order_query->row['shipping_method'],
				'shipping_code'           => $order_query->row['shipping_code'],
				'comment'                 => $order_query->row['comment'],
				'total'                   => $order_query->row['total'],
				'reward'                  => $reward,
				'order_status_id'         => $order_query->row['order_status_id'],
				'affiliate_id'            => $order_query->row['affiliate_id'],
				'affiliate_firstname'     => $affiliate_firstname,
				'affiliate_lastname'      => $affiliate_lastname,
				'commission'              => $order_query->row['commission'],
				'language_id'             => $order_query->row['language_id'],
				'language_code'           => $language_code,
				'language_directory'      => $language_directory,
				'currency_id'             => $order_query->row['currency_id'],
				'currency_code'           => $order_query->row['currency_code'],
				'currency_value'          => $order_query->row['currency_value'],
				'ip'                      => $order_query->row['ip'],
				'forwarded_ip'            => $order_query->row['forwarded_ip'],
				'user_agent'              => $order_query->row['user_agent'],
				'accept_language'         => $order_query->row['accept_language'],
				'date_added'              => $order_query->row['date_added'],
				'date_modified'           => $order_query->row['date_modified']
			);
		} else {
			return;
		}
	}

	public function getOrders($data = array()) {
		$sql = "SELECT o.order_id, CONCAT(o.firstname, ' ', o.lastname) AS customer, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = '" . (int)$this->config->get('config_language_id') . "') AS status, o.shipping_code, o.total, o.currency_code, o.currency_value, o.date_added, o.date_modified FROM `" . DB_PREFIX . "order` o";

		if (isset($data['filter_order_status'])) {
			$implode = array();

			$order_statuses = explode(',', $data['filter_order_status']);

			foreach ($order_statuses as $order_status_id) {
				$implode[] = "o.order_status_id = '" . (int)$order_status_id . "'";
			}

			if ($implode) {
				$sql .= " WHERE (" . implode(" OR ", $implode) . ")";
			}
		} else {
			$sql .= " WHERE o.order_status_id > '0'";
		}

		if (!empty($data['filter_order_id'])) {
			$sql .= " AND o.order_id = '" . (int)$data['filter_order_id'] . "'";
		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND CONCAT(o.firstname, ' ', o.lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(o.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if (!empty($data['filter_date_modified'])) {
			$sql .= " AND DATE(o.date_modified) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
		}

		if (!empty($data['filter_total'])) {
			$sql .= " AND o.total = '" . (float)$data['filter_total'] . "'";
		}

		$sort_data = array(
			'o.order_id',
			'customer',
			'status',
			'o.date_added',
			'o.date_modified',
			'o.total'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY o.order_id";
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

	public function getOrderProducts($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");

		return $query->rows;
	}

	public function getOrderOptions($order_id, $order_product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . (int)$order_product_id . "'");

		return $query->rows;
	}

	public function getOrderVouchers($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_voucher WHERE order_id = '" . (int)$order_id . "'");

		return $query->rows;
	}

	public function getOrderVoucherByVoucherId($voucher_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_voucher` WHERE voucher_id = '" . (int)$voucher_id . "'");

		return $query->row;
	}

	public function getOrderTotals($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$order_id . "' ORDER BY sort_order");

		return $query->rows;
	}

	public function getTotalOrders($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order`";

		if (isset($data['filter_order_status'])) {
			$implode = array();

			$order_statuses = explode(',', $data['filter_order_status']);

			foreach ($order_statuses as $order_status_id) {
				$implode[] = "order_status_id = '" . (int)$order_status_id . "'";
			}

			if ($implode) {
				$sql .= " WHERE (" . implode(" OR ", $implode) . ")";
			}
		} else {
			$sql .= " WHERE order_status_id > '0'";
		}

		if (!empty($data['filter_order_id'])) {
			$sql .= " AND order_id = '" . (int)$data['filter_order_id'] . "'";
		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND CONCAT(firstname, ' ', lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
		}

		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if (!empty($data['filter_date_modified'])) {
			$sql .= " AND DATE(date_modified) = DATE('" . $this->db->escape($data['filter_date_modified']) . "')";
		}

		if (!empty($data['filter_total'])) {
			$sql .= " AND total = '" . (float)$data['filter_total'] . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getTotalOrdersByStoreId($store_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE store_id = '" . (int)$store_id . "'");

		return $query->row['total'];
	}

	public function getTotalOrdersByOrderStatusId($order_status_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id = '" . (int)$order_status_id . "' AND order_status_id > '0'");

		return $query->row['total'];
	}

	public function getTotalOrdersByProcessingStatus() {
		$implode = array();

		$order_statuses = $this->config->get('config_processing_status');

		foreach ($order_statuses as $order_status_id) {
			$implode[] = "order_status_id = '" . (int)$order_status_id . "'";
		}

		if ($implode) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE " . implode(" OR ", $implode));

			return $query->row['total'];
		} else {
			return 0;
		}
	}

	public function getTotalOrdersByCompleteStatus() {
		$implode = array();

		$order_statuses = $this->config->get('config_complete_status');

		foreach ($order_statuses as $order_status_id) {
			$implode[] = "order_status_id = '" . (int)$order_status_id . "'";
		}

		if ($implode) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE " . implode(" OR ", $implode) . "");

			return $query->row['total'];
		} else {
			return 0;
		}
	}

	public function getTotalOrdersByLanguageId($language_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE language_id = '" . (int)$language_id . "' AND order_status_id > '0'");

		return $query->row['total'];
	}

	public function getTotalOrdersByCurrencyId($currency_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE currency_id = '" . (int)$currency_id . "' AND order_status_id > '0'");

		return $query->row['total'];
	}

	public function createInvoiceNo($order_id) {
		$order_info = $this->getOrder($order_id);

		if ($order_info && !$order_info['invoice_no']) {
			$query = $this->db->query("SELECT MAX(invoice_no) AS invoice_no FROM `" . DB_PREFIX . "order` WHERE invoice_prefix = '" . $this->db->escape($order_info['invoice_prefix']) . "'");

			if ($query->row['invoice_no']) {
				$invoice_no = $query->row['invoice_no'] + 1;
			} else {
				$invoice_no = 1;
			}

			$this->db->query("UPDATE `" . DB_PREFIX . "order` SET invoice_no = '" . (int)$invoice_no . "', invoice_prefix = '" . $this->db->escape($order_info['invoice_prefix']) . "' WHERE order_id = '" . (int)$order_id . "'");

			return $order_info['invoice_prefix'] . $invoice_no;
		}
	}

	public function getOrderHistories($order_id, $start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}

		$query = $this->db->query("SELECT oh.date_added, os.name AS status, oh.comment, oh.notify FROM " . DB_PREFIX . "order_history oh LEFT JOIN " . DB_PREFIX . "order_status os ON oh.order_status_id = os.order_status_id WHERE oh.order_id = '" . (int)$order_id . "' AND os.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY oh.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}

	public function getTotalOrderHistories($order_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "order_history WHERE order_id = '" . (int)$order_id . "'");

		return $query->row['total'];
	}

	public function getTotalOrderHistoriesByOrderStatusId($order_status_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "order_history WHERE order_status_id = '" . (int)$order_status_id . "'");

		return $query->row['total'];
	}

	public function getEmailsByProductsOrdered($products, $start, $end) {
		$implode = array();

		foreach ($products as $product_id) {
			$implode[] = "op.product_id = '" . (int)$product_id . "'";
		}

		$query = $this->db->query("SELECT DISTINCT email FROM `" . DB_PREFIX . "order` o LEFT JOIN " . DB_PREFIX . "order_product op ON (o.order_id = op.order_id) WHERE (" . implode(" OR ", $implode) . ") AND o.order_status_id <> '0' LIMIT " . (int)$start . "," . (int)$end);

		return $query->rows;
	}

	public function getTotalEmailsByProductsOrdered($products) {
		$implode = array();

		foreach ($products as $product_id) {
			$implode[] = "op.product_id = '" . (int)$product_id . "'";
		}

		$query = $this->db->query("SELECT DISTINCT email FROM `" . DB_PREFIX . "order` o LEFT JOIN " . DB_PREFIX . "order_product op ON (o.order_id = op.order_id) WHERE (" . implode(" OR ", $implode) . ") AND o.order_status_id <> '0'");

		return $query->row['total'];
	}
}
