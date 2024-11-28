<?php
class ModelShippingFree extends Model {
	function getQuote($address) {
		$this->load->language('shipping/free');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('free_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if (!$this->config->get('free_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}


		if ($this->cart->getSubTotal() < $this->config->get('free_total')) {
			$status = false;
		}

			if ($this->config->get('config_cart_weight')) {
				$weight = $this->weight->format($this->cart->getWeight(), $this->config->get('config_weight_class_id'), $this->language->get('decimal_point'), $this->language->get('thousand_point'));
			} else {
				$weight = '';
			}
	        $approve = 0;		
	       
			$this->load->model('catalog/product');
            			
			 
	         $product_info__2 = $this->model_catalog_product->CekKonfirmasi($this->customer->getId());
	
		              $kurir = "";
					  $ongkir = 0;                     
				   				
		            if ($product_info__2) {		
             	       
					  $ongkir = $product_info__2['ongkir'];
				      $kurir  = $product_info__2['kurir'];
		              }					 
			
   		if ($ongkir == 0) {
			$status = false;
		}


		$method_data = array();

		if ($status) {
			$quote_data = array();

			$quote_data['free'] = array(
				'code'         => 'free.free',
				//'title'        => $this->language->get('text_description'),
				'title'        => "Kurir " . $kurir,
				//'cost'         => 10.00,
			    'cost'          => $ongkir,
				'tax_class_id' => 0,
				//'text'         => $this->currency->format(10.00)
				 'text'         => $this->currency->format($ongkir)
			);

			$method_data = array(
				'code'       => 'free',
				'title'      => $this->language->get('text_title'),
				'quote'      => $quote_data,
				'sort_order' => $this->config->get('free_sort_order'),
				'error'      => false
			);
		}

		return $method_data;
	}
	
	

		
	
}