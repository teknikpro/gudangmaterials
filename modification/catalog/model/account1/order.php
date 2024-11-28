<?php
class ModelAccountOrder extends Model {
	public function getOrder($order_id) {
		$order_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$order_id . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND order_status_id > '0'");

		if ($order_query->num_rows) {
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

			return array(
				'order_id'                => $order_query->row['order_id'],
				'invoice_no'              => $order_query->row['invoice_no'],
				'invoice_prefix'          => $order_query->row['invoice_prefix'],
				'store_id'                => $order_query->row['store_id'],
				'store_name'              => $order_query->row['store_name'],
				'store_url'               => $order_query->row['store_url'],
				'customer_id'             => $order_query->row['customer_id'],
				'firstname'               => $order_query->row['firstname'],
				'lastname'                => $order_query->row['lastname'],
				'telephone'               => $order_query->row['telephone'],
				'fax'                     => $order_query->row['fax'],
				'email'                   => $order_query->row['email'],
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
				'payment_method'          => $order_query->row['payment_method'],
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
				'shipping_method'         => $order_query->row['shipping_method'],
				'comment'                 => $order_query->row['comment'],
				'total'                   => $order_query->row['total'],
				'order_status_id'         => $order_query->row['order_status_id'],
				'language_id'             => $order_query->row['language_id'],
				'currency_id'             => $order_query->row['currency_id'],
				'currency_code'           => $order_query->row['currency_code'],
				'currency_value'          => $order_query->row['currency_value'],
				'date_modified'           => $order_query->row['date_modified'],
				'date_added'              => $order_query->row['date_added'],
				'ip'                      => $order_query->row['ip']
			);
		} else {
			return false;
		}
	}

	public function getOrders($start = 0, $limit = 20) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 1;
		}

		$query = $this->db->query("SELECT o.order_id, o.firstname, o.lastname, os.name as status, o.date_added, o.total, o.currency_code, o.currency_value FROM `" . DB_PREFIX . "order` o LEFT JOIN " . DB_PREFIX . "order_status os ON (o.order_status_id = os.order_status_id) WHERE o.customer_id = '" . (int)$this->customer->getId() . "' AND o.order_status_id > '0' AND o.store_id = '" . (int)$this->config->get('config_store_id') . "' AND os.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY o.order_id DESC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}

	public function getOrderProduct($order_id, $order_product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . (int)$order_product_id . "'");

		return $query->row;
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
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_voucher` WHERE order_id = '" . (int)$order_id . "'");

		return $query->rows;
	}

	public function getOrderTotals($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$order_id . "' ORDER BY sort_order");

		return $query->rows;
	}

	public function getOrderHistories($order_id) {
		$query = $this->db->query("SELECT date_added, os.name AS status, oh.comment, oh.notify FROM " . DB_PREFIX . "order_history oh LEFT JOIN " . DB_PREFIX . "order_status os ON oh.order_status_id = os.order_status_id WHERE oh.order_id = '" . (int)$order_id . "' AND os.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY oh.date_added");

		return $query->rows;
	}


    // hpwd
    public function getShippingOrder($order_id){
		$query = $this->db->query("SELECT shipping_number, courier, change_courier, change_shipping_number FROM `" . DB_PREFIX . "order` WHERE order_id = ". (int)$order_id);
		return $query->row;
	}

	public function getTracking($order_id) {
        $this->load->language('module/hp_tracking_setting');

        $val_return = array();

        $key = $this->config->get('hp_tracking_apitype') == 'ownapi' ? $this->config->get('hp_tracking_rajaongkirapi') : $this->config->get('hpwd_theq_t');

        if($this->config->get('hp_tracking_api_usage') && $key) {

		$shipment_profile = $this->db->query("SELECT shipment_profile_id, TIMESTAMPDIFF(HOUR, last_update, NOW()) as df FROM `". DB_PREFIX ."shipment_profile` WHERE order_id = ". (int)$order_id);

        $so_info = $this->getShippingOrder($order_id);

        if($shipment_profile->num_rows) {
		  $shipment_manifest = $this->db->query("SELECT * FROM `". DB_PREFIX ."shipment_manifest` WHERE shipment_profile_id = ".(int)$shipment_profile->row['shipment_profile_id']);
        }

        $time = (isset($shipment_profile->row['df']) AND $shipment_profile->row['df'] >= 2) OR (isset($shipment_profile->row['df']) AND is_null($shipment_profile->row['df'])) OR (!isset($shipment_profile->row['df'])) ? true : false;

        // if admin changes courier or time elapsed
		if(($so_info && $so_info['change_courier'] == 1) || ($so_info && $so_info['change_shipping_number'] == 1) || $time || isset($shipment_manifest) && $shipment_manifest->num_rows < 1) {

     		if(strlen($so_info['shipping_number']) > 0 AND strlen($so_info['courier']) > 0) {

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
					CURLOPT_POSTFIELDS => "waybill=".$so_info['shipping_number']."&courier=".$so_info['courier']."",
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

            // enable change courrier and shipping number
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

	public function getOrderHistoryDate($order_id) {
        $data = array();

        $query = $this->db->query("SELECT DISTINCT date_added, order_status_id FROM " . DB_PREFIX . "order_history WHERE order_id='".(int)$order_id."' ORDER BY date_added ASC");

		foreach($query->rows as $row) {
            $data[$row['order_status_id']] = $row['date_added'];
        }
        return $data;
    } 
	public function getTotalOrders() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` o WHERE customer_id = '" . (int)$this->customer->getId() . "' AND o.order_status_id > '0' AND o.store_id = '" . (int)$this->config->get('config_store_id') . "'");

		return $query->row['total'];
	}

	public function getTotalOrderProductsByOrderId($order_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");

		return $query->row['total'];
	}

	public function getTotalOrderVouchersByOrderId($order_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order_voucher` WHERE order_id = '" . (int)$order_id . "'");

		return $query->row['total'];
	}
}