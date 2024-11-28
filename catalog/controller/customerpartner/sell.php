<?php
class ControllerCustomerpartnerSell extends Controller {

	private $error = array();
	private $data = array();

	public function index() {

		$this->data = array_merge($this->data, $this->language->load('customerpartner/sell'));

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addStyle('catalog/view/theme/default/stylesheet/MP/sell.css');

		$this->load->model('tool/image');

		$this->load->model('customerpartner/master');

		$this->data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		$this->data['compare'] = $this->url->link('product/compare');
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'c2p.product_id';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_product_limit');
		}

		$buttontitle = $this->config->get('marketplace_sellbuttontitle');
		$sellerHeader = $this->config->get('marketplace_sellheader');

		$this->data['sell_title'] = $buttontitle[$this->config->get('config_language_id')];
		$this->data['sell_header'] = $sellerHeader[$this->config->get('config_language_id')];
		$this->data['showpartners'] = $this->config->get('marketplace_showpartners');
		$this->data['showproducts'] = $this->config->get('marketplace_showproducts');

        /**
         * Marketplace Sell page tab
         */
		$this->data['tabs'] = array();
		$marketplace_tab = $this->config->get('marketplace_tab');
		if(isset($marketplace_tab['heading']) AND $marketplace_tab['heading']){
			ksort($marketplace_tab['heading']);
			ksort($marketplace_tab['description']);
			foreach ($marketplace_tab['heading'] as $key => $value) {
				$text = $marketplace_tab['description'][$key][$this->config->get('config_language_id')];
			    $text = trim(html_entity_decode($text));
				$this->data['tabs'][] = array(
					'id' => $key,
					'hrefValue' => $value[$this->config->get('config_language_id')],
					'description' => $text,
				);
			}
		}
		/**
         * Marketplace Sell page tab
         */

        /**
         * Marketplace shows sellers
         * [$partners get long term sellers ]
         * @var [type]
         */
		$partners = $this->model_customerpartner_master->getOldPartner();

		$this->data['partners'] = array();

		foreach ($partners as $key => $result) {

			if ($result['avatar']) {
				$image = $this->model_tool_image->resize($result['avatar'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			} else if($result['avatar'] == 'removed') {
				$image = '';
			} else if($this->config->get('marketplace_default_image_name')) {
				$image = $this->model_tool_image->resize($this->config->get('marketplace_default_image_name'), $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			} else {
				$image = $this->model_tool_image->resize('no_image.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			}

			$this->data['partners'][] = array(
				'customer_id' 		=> $result['customer_id'],
				'name' 		  		=> $result['firstname'].' '.$result['lastname'],
				'screenname' 		 => $result['screenname'],
				'companyname' 		=> $result['companyname'],
				'backgroundcolor' 		=> $result['backgroundcolor'],
				'country'  	  		=> $result['country'],
				'sellerHref'  		=> $this->url->link('customerpartner/profile', 'id=' . $result['customer_id'],'SSL'),
				'thumb'       		=> $image,
				'total_products'    => $this->model_customerpartner_master->getPartnerCollectionCount($result['customer_id']),
			);

		}
		/**
         * Marketplace shows seller
         */

        /**
         * Marketplace shows Seller's latest products
         */
		$filter_data = array(
			'sort'                => $sort,
			'order'               => $order,
			'start'               => ($page - 1) * $limit,
			'limit'               => $limit
		);

		//products
		$latest = $this->model_customerpartner_master->getLatest($filter_data);
		$totalLatest = $this->model_customerpartner_master->getTotalLatest($filter_data);
		$this->data['latest'] = array();

		$this->load->model('catalog/product');

		foreach($latest as $key => $result){

		  $product_info = $this->model_catalog_product->getProduct($result['product_id']);

		  if (isset($product_info['price']) && $product_info['price']) {
		    $result['price'] = $product_info['price'];
		  }

			if ($result['image'] && is_file(DIR_IMAGE.$result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			} else {
				$image = $this->model_tool_image->resize('no_image.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			}

			if ($result['avatar']) {
				$avatar = $this->model_tool_image->resize($result['avatar'], 70, 70);
			} else if($result['avatar'] == 'removed') {
				$avatar = '';
			} else if($this->config->get('marketplace_default_image_name')) {
				$avatar = $this->model_tool_image->resize($this->config->get('marketplace_default_image_name'), 50, 50);
			} else {
				$avatar = $this->model_tool_image->resize('no_image.png', 50, 50);
			}

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}

			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}

			if ($this->config->get('config_tax')) {
				$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
			} else {
				$tax = false;
			}

			if ($this->config->get('config_review_status')) {
				$rating = (int)$result['rating'];
			} else {
				$rating = false;
			}

			$this->data['latest'][] = array(
				'product_id'  => $result['product_id'],
				'seller_name' => $result['seller_name'],
				'country'  	  => $result['country'],
				'avatar'  	  => $avatar,
				'backgroundcolor'  	  => $result['backgroundcolor'],
				'sellerHref'  => $this->url->link('customerpartner/profile', 'id=' . $result['customer_id'],'SSL'),
				'thumb'       => $image,
				'name'        => $result['name'],
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
				'price'       => $price,
				'special'     => $special,
				'minimum'     => $result['minimum'],
				'tax'         => $tax,
				'rating'      => $result['rating'],
				'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'],'SSL')
			);

		}

		$url = '';

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}

		$this->data['sorts'] = array();

		$this->data['sorts'][] = array(
			'text'  => $this->language->get('text_default'),
			'value' => 'c2p.product_id-ASC',
			'href'  => $this->url->link('customerpartner/sell', 'sort=c2p.product_id&order=ASC' . $url,'SSL')
		);

		$this->data['sorts'][] = array(
			'text'  => $this->language->get('text_name_asc'),
			'value' => 'pd.name-ASC',
			'href'  => $this->url->link('customerpartner/sell', 'sort=pd.name&order=ASC' . $url,'SSL')
		);

		$this->data['sorts'][] = array(
			'text'  => $this->language->get('text_name_desc'),
			'value' => 'pd.name-DESC',
			'href'  => $this->url->link('customerpartner/sell', 'sort=pd.name&order=DESC' . $url,'SSL')
		);

		$this->data['sorts'][] = array(
			'text'  => $this->language->get('text_price_asc'),
			'value' => 'p.price-ASC',
			'href'  => $this->url->link('customerpartner/sell', 'sort=p.price&order=ASC' . $url,'SSL')
		);

		$this->data['sorts'][] = array(
			'text'  => $this->language->get('text_price_desc'),
			'value' => 'p.price-DESC',
			'href'  => $this->url->link('customerpartner/sell', 'sort=p.price&order=DESC' . $url,'SSL')
		);

		if ($this->config->get('config_review_status')) {
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_rating_desc'),
				'value' => 'rating-DESC',
				'href'  => $this->url->link('customerpartner/sell', 'sort=rating&order=DESC' . $url,'SSL')
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_rating_asc'),
				'value' => 'rating-ASC',
				'href'  => $this->url->link('customerpartner/sell', 'sort=rating&order=ASC' . $url,'SSL')
			);
		}

		$this->data['sorts'][] = array(
			'text'  => $this->language->get('text_model_asc'),
			'value' => 'p.model-ASC',
			'href'  => $this->url->link('customerpartner/sell', 'sort=p.model&order=ASC' . $url,'SSL')
		);

		$this->data['sorts'][] = array(
			'text'  => $this->language->get('text_model_desc'),
			'value' => 'p.model-DESC',
			'href'  => $this->url->link('customerpartner/sell', 'sort=p.model&order=DESC' . $url,'SSL')
		);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$this->data['limits'] = array();

		$limits = array_unique(array($this->config->get('config_product_limit'), 25, 50, 75, 100));

		sort($limits);

		foreach($limits as $value) {
			$this->data['limits'][] = array(
				'text'  => $value,
				'value' => $value,
				'href'  => $this->url->link('customerpartner/sell', $url . '&limit=' . $value,'SSL')
			);
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}


		$pagination = new Pagination();
		$pagination->total = $totalLatest;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('customerpartner/sell', $url . '&page={page}','SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['results'] = sprintf($this->language->get('text_pagination'), ($totalLatest) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($totalLatest - $limit)) ? $totalLatest : ((($page - 1) * $limit) + $limit), $totalLatest, ceil($totalLatest / $limit));

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;
		$this->data['limit'] = $limit;

		if ($this->config->get('marketplace_seller_info_hide')) {

			$this->data['showpartners'] = false;
			$this->data['showpartnerdetails'] = false;
		}else{
			$this->data['showpartnerdetails'] = true;
		}

		$this->data['column_left'] = $this->load->controller('common/column_left');
		$this->data['column_right'] = $this->load->controller('common/column_right');
		$this->data['content_top'] = $this->load->controller('common/content_top');
		$this->data['content_bottom'] = $this->load->controller('common/content_bottom');
		$this->data['footer'] = $this->load->controller('common/footer');
		$this->data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/customerpartner/sell.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/customerpartner/sell.tpl', $this->data));
		} else {
			$this->response->setOutput($this->load->view('default/template/customerpartner/sell.tpl', $this->data));
		}

	}

	public function wkmpregistation(){

		$this->load->model('customerpartner/master');

		$json = array();

		if(isset($this->request->post['shop'])){
			$data = urldecode(html_entity_decode($this->request->post['shop'], ENT_QUOTES, 'UTF-8'));
			if($this->model_customerpartner_master->getShopData($data)){
				$json['error'] = true;
			}else{
				$json['success'] = true;
		    }
		}

		$this->response->setOutput(json_encode($json));
	}
	
	public function wkmpregistation2(){

		$this->load->model('customerpartner/master');

		$json = array();

		if(isset($this->request->post['nama_brand'])){
			$data = urldecode(html_entity_decode($this->request->post['nama_brand'], ENT_QUOTES, 'UTF-8'));
			if($this->model_customerpartner_master->getBrandData($data)){
				$json['error'] = true;
			}else{
				$json['success'] = true;
		    }
		}

		$this->response->setOutput(json_encode($json));
	}	
	
}
?>
