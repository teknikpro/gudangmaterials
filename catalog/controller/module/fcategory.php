<?php
class ControllerModuleFcategory extends Controller {
	public function index($setting) {
		$this->load->language('module/fcategory');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/category');

		$this->load->model('tool/image');

       if (!defined('JOURNAL_INSTALLED')) {
            return;
        }
        if (!$this->model_journal2_blog->isEnabled()) {
            return;
        }
		
        Journal2::startTimer(get_class($this));

        /* get module data from db */
        $switch = 0;

        if ($this->journal2->settings->get('responsive_design')) {
            $device = Journal2Utils::getDevice();
            $switch = 0;
			
           if ($device === 'phone') {
               $switch = 1;
            }

            if ($device === 'tablet') {
                if ($setting['position'] === 'column_left' && $this->journal2->settings->get('left_column_on_tablet', 'on') !== 'on') {
                    $switch = 1;
                }

                if ($setting['position'] === 'column_right' && $this->journal2->settings->get('right_column_on_tablet', 'on') !== 'on') {
                    $switch = 1;
                }
            }
        }

         $data['switch'] = $switch;


  
		 
		$data['categories'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 3;
		}

		if (!empty($setting['category'])) {
			$categories = array_slice($setting['category'], 0, (int)$setting['limit']);
			
			

			foreach ($categories as $category_id) {
				$category_info = $this->model_catalog_category->getCategory($category_id);

				if ($category_info) {
					if ($category_info['image']) {
						$image = $this->model_tool_image->resize($category_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					$data['categories'][] = array(
						'category_id'  => $category_info['category_id'],
						'thumb'       => $image,
						'name'        => $category_info['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
						'href'        => $this->url->link('product/category', 'path=' . $category_info['category_id'])
					);
				}
			}
		}

		if ($data['categories']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/fcategory.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/fcategory.tpl', $data);
			} else {
				return $this->load->view('module/fcategory.tpl', $data);
			}
		}
	}
}