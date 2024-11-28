<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('analytics/' . $analytic['code']);
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['register'] = $this->url->link('account/register', '', 'SSL');
		$data['login'] = $this->url->link('account/login', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');

        $data['notification'] = '';
        $data['menusell'] = $this->url->link('customerpartner/sell', '', 'SSL');

        if ($this->config->get('marketplace_status') && $this->config->get('marketplace_separate_view')) {
          if (preg_match('/route=account\/customerpartner/',$this->request->server['QUERY_STRING'])) {
  $data['separate_view'] = $server . 'index.php?' . str_replace(array('&amp;view=separate', '&amp;view=default', '&view=separate', '&view=default'), '', $this->request->server['QUERY_STRING']) . '&view=separate';
} else {
  $data['separate_view'] = $this->url->link('account/customerpartner/dashboard', 'view=separate', true);
}

          if (isset($this->request->get['view']) && $this->request->get['view']) {
            $this->session->data['marketplace_separate_view'] = $this->request->get['view'];
          }
        }

        $this->language->load('module/marketplace');
        $data['marketplace_status'] = $this->config->get('marketplace_status');
        $data['text_sell_header']  = $this->language->get('text_sell_header');
        $data['text_separate_view'] = $this->language->get('text_separate_view');
        $data['text_my_profile'] = $this->language->get('text_my_profile');
        $data['text_ask_admin'] = $this->language->get('text_ask_admin');
        $data['text_addproduct'] = $this->language->get('text_addproduct');
        $data['text_wkshipping'] = $this->language->get('text_wkshipping');
        $data['text_productlist'] = $this->language->get('text_productlist');
        $data['text_dashboard'] = $this->language->get('text_dashboard');
        $data['text_orderhistory'] = $this->language->get('text_orderhistory');
        $data['text_becomePartner'] = $this->language->get('text_becomePartner');
        $data['text_download'] = $this->language->get('text_download');
        $data['text_transaction'] = $this->language->get('text_transaction');
        /**
         * membership code for account menu
         * @param  {[type]} $this [description]
         * @return {[type]}       [description]
         */

        if($this->config->get('wk_seller_group_status')) {
          $data['marketplace_allowed_account_menu'] = array();
          $this->load->model('account/customer_group');
          $isMember = $this->model_account_customer_group->getSellerMembershipGroup($this->customer->getId());
          if($isMember) {
            $allowedAccountMenu = $this->model_account_customer_group->getaccountMenu($isMember['gid']);
            if($allowedAccountMenu['value']) {
              $accountMenu = explode(',',$allowedAccountMenu['value']);
              foreach ($accountMenu as $key => $menu) {
                $aMenu = explode(':', $menu);
                $data['marketplace_allowed_account_menu'][$aMenu[0]] = $aMenu[1];
              }
            }
          }
        } else {
          $data['marketplace_allowed_account_menu'] = $this->config->get('marketplace_allowed_account_menu');
        }

        /**
         * membership code ends here
         */
        $data['mp_addproduct'] = $this->url->link('account/customerpartner/addproduct', '', 'SSL');
        $data['mp_productlist'] = $this->url->link('account/customerpartner/productlist', '', 'SSL');
        $data['mp_dashboard'] = $this->url->link('account/customerpartner/dashboard', '', 'SSL');
        $data['mp_add_shipping_mod'] = $this->url->link('account/customerpartner/add_shipping_mod','', 'SSL');
        $data['mp_orderhistory'] = $this->url->link('account/customerpartner/orderlist','', 'SSL');
        $data['mp_download'] = $this->url->link('account/customerpartner/download','', 'SSL');
        $data['mp_profile'] = $this->url->link('account/customerpartner/profile','','SSL');
        $data['mp_want_partner'] = $this->url->link('account/customerpartner/become_partner','','SSL');
        $data['mp_transaction'] = $this->url->link('account/customerpartner/transaction','','SSL');
        $this->load->model('account/customerpartner');
        if($this->config->get('marketplace_status')){
            $data['chkIsPartner'] = $this->model_account_customerpartner->chkIsPartner();
            $data['marketplace_seller_mode'] = isset($this->session->data['marketplace_seller_mode']) ? $this->session->data['marketplace_seller_mode'] : 1;
if ($data['chkIsPartner'] && $data['marketplace_seller_mode']) {
  $data['notification'] = $this->load->controller('account/customerpartner/notification/notifications');
}
        }
      
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = strpos($this->config->get('config_template'), 'journal2') === 0 ? array() : $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);
		} else {
			return $this->load->view('default/template/common/header.tpl', $data);
		}
	}
}
