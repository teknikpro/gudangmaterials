<?php
class ControllerPaymentIwallet extends Controller {
	
	var $servUri = 'https://www.i-walletlive.com/payLIVE/PaymentService.asmx?wsdl';
	var $payUri = 'https://www.i-walletlive.com/payLIVE/detailsNew.aspx';
	var $ns = 'http://www.i-walletlive.com/payLIVE';
	
	private function setHeader($soapClient){
		// header data
		$APIVersion = $this->config->get('iwallet_APIVersion');
		$MerchantKey = $this->config->get('iwallet_MerchantKey');
		$MerchantEmail = $this->config->get('iwallet_MerchantEmail');
		$SvcType = 'C2B';
		$UseIntMode = $this->config->get('iwallet_UseIntMode');
		
		$header_params = array(
			"APIVersion"	=> trim($APIVersion),
			"MerchantKey"	=> trim($MerchantKey),
			"MerchantEmail" => trim($MerchantEmail),
			"SvcType" 		=> $SvcType,
			"UseIntMode" 	=> $UseIntMode,
		);
		
		$header = new SOAPHeader($this->ns, 'PaymentHeader', $header_params);
		$soapClient->__setSoapHeaders($header);
		
		return TRUE;
	}
	
	private function getOrderParams(){
		$this->load->model('checkout/order');
		$order_id = $this->session->data['order_id'];
		
		$order_data = $this->model_checkout_order->getOrder($order_id);
		$order_products = $this->model_checkout_order->getOrderProducts($order_id);
		//$total_data = $this->model_sale_order->getOrderTotals($order_id);
		
		$products = array();
		$comment = '';
		
		foreach($order_products as $item){
			
			$options = $this->model_checkout_order->getOrderOptions($order_id, $item['order_product_id']);
			$opts = '';
			if($options){
				$opts .= ' - (';
				foreach ($options as $option) {
					$opts .= ' '.$option['name'].' : '.$option['value'].',';
				}
				$opts = substr($opts, 0, -1);
				
				$opts .= ' )';
			}
			
			$products[] = array(
					'ItemCode' => $item['model'],
                    'ItemName' => $item['name'].$opts,
                    'UnitPrice' => $item['price'],
                    'Quantity' =>  $item['quantity'],
                    'SubTotal' =>  $item['total']*$item['quantity']
					);
					
			$comment .= $item['quantity'].' '.$item['name'].$opts.', ';
		}
		
		// calculate tax, shipping and sub-total
		$taxes = $this->cart->getTaxes();
		$this->load->model('total/shipping');
		$this->load->model('total/tax');
		$shipping_cost = $this->model_total_shipping->getTotalShipping();
		$tax_amount = $this->model_total_tax->getTotalTax($taxes);
		$sub_total = $this->cart->getSubTotal();
		
		//iwallet vars to send        
		$params = array();
		$params['orderId'] = $order_id;
		$params['subtotal'] = $sub_total;
		$params['shippingCost'] = $shipping_cost;
		$params['taxAmount'] = $tax_amount;
		$params['total'] = $order_data['total'];
		$params['comment1'] = substr($comment, 0, -2);;
		$params['orderItems'] = array('OrderItem' => $products);
		
		return $params;
	}
	
	public function index() {
    	$data['button_confirm'] = $this->language->get('button_confirm');
		$data['button_back'] = $this->language->get('button_back');

		$data['continue'] = HTTPS_SERVER . 'index.php?route=checkout/success';

		$data['back'] = HTTPS_SERVER . 'index.php?route=checkout/cart';
		
		$this->id = 'payment';
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/iwallet.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/payment/iwallet.tpl', $data);
		} else {
			return $this->load->view('default/template/payment/iwallet.tpl', $data);
		}
	}
	
	public function confirm() {
		$resposnse = array();
		$resposnse['error'] = '';
		$resposnse['paytocken'] = '';
		// create soap instance
		$soapClient = new SoapClient($this->servUri);
		// set header
		$this->setHeader($soapClient);
		// get order params
		$params = $this->getOrderParams();
		//make a request for proccessing payment
		$result = $soapClient->ProcessPaymentOrder($params);
		
		// check for the request (for debug only)
		// echo $soapClient->__getLastRequest();exit;
		
		// if soap fault occerred
		if (is_soap_fault($result)) {
			$resposnse['error'] = 'ERROR: SOAP Fault! Order proccessing failed!';
		}
		
		// check response and do accordingly
		if(isset($result->ProcessPaymentOrderResult) && strlen($result->ProcessPaymentOrderResult)==36){
			$resposnse['payToken'] = $result->ProcessPaymentOrderResult;
			$resposnse['order_id'] = $this->session->data['order_id'];
			$resposnse['pay_uri'] = $this->payUri;
		}elseif(isset($result->ProcessPaymentOrderResult)){
			$resposnse['error'] = $result->ProcessPaymentOrderResult;
		}else{
			$resposnse['error'] = 'Unknow ERROR! Order proccessing failed!';
		}
		
		$this->response->setOutput(json_encode($resposnse));
		// set output in JSON format
		//$this->load->library('json');
		//$this->response->setOutput(Json::encode($resposnse));
		
	}
	
	public function callback(){
		$status = isset($this->request->get['status']) ? $this->request->get['status'] : -1;
		$cust_ref = isset($this->request->get['cust_ref']) ? $this->request->get['cust_ref'] : '';
		$transac_id = isset($this->request->get['transac_id']) ? $this->request->get['transac_id'] : '';
		$pay_token = isset($this->request->get['pay_token']) ? $this->request->get['pay_token'] : '';
		
		
		if($status == 0){ // Transaction successful and approved
		// create soap instance
		$soapClient = new SoapClient($this->servUri);
		// set header
		$this->setHeader($soapClient);
		// set params
		$params = array();
		$params['payToken'] = $pay_token;
		$params['transactionId'] = $transac_id;
		// make a request to confirm transaction
		$result = $soapClient->ConfirmTransaction($params);
		
		if(isset($result->ConfirmTransactionResult) && $result->ConfirmTransactionResult==1){ //Confirmation Successful
			$this->load->model('checkout/order');
			$comment = "transac_id = ". $transac_id . "\n";
			$this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $this->config->get('iwallet_order_status_id'), $comment);
			$this->response->redirect(HTTP_SERVER . 'index.php?route=checkout/success');
			
		}elseif(isset($result->ConfirmTransactionResult) && $result->ConfirmTransactionResult==0){ //Confirmation failed: Invalid transaction Id
			echo 'Confirmation failed: Invalid transaction Id';
			//$this->response->redirect(HTTPS_SERVER . 'index.php?route=checkout/confirm');
		}elseif(isset($result->ConfirmTransactionResult) && $result->ConfirmTransactionResult==-1){ //Confirmation Failed: Invalid pay token
			echo 'Confirmation Failed: Invalid pay token';
			//$this->response->redirect(HTTPS_SERVER . 'index.php?route=checkout/confirm');
		}else{
			$this->response->redirect(HTTPS_SERVER . 'index.php?route=checkout/cart');
		}
		}elseif($status==-1){ // Technical error contact
			echo 'Technical error contact';
		}elseif($status==-2){ // User cancelled transaction
			$this->response->redirect(HTTPS_SERVER . 'index.php?route=checkout/cart');
		}
		
		exit;
	}
}
?>