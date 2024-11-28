<?php 
class ModelPaymentIwallet extends Model {
  	public function getMethod($address) {
		$this->load->language('payment/iwallet');
		
		if ($this->config->get('iwallet_status')) {
			$status = TRUE;
		}
		
		$method_data = array();
	
		if ($status) {  
      		$method_data = array( 
        		'code'         => 'iwallet',
        		'title'      => $this->language->get('text_title'),
        		'terms'      => '',
				'sort_order' => $this->config->get('iwallet_sort_order')
      		);
    	}
   
    	return $method_data;
  	}
}
?>