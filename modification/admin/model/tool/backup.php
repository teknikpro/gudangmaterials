<?php
class ModelToolBackup extends Model {
	public function restore($sql) {
		foreach (explode(";\n", $sql) as $sql) {
			$sql = trim($sql);

            if (strpos($sql, '-- EXPORT FOR') === 0) {
                $version = (int)str_replace('-- EXPORT FOR: ', '', $sql);
                if (version_compare(VERSION, '2', '>=') && $version !== 2) {
                    die('Version mismatch: You have OpenCart 2.x but the imported file is for OpenCart 1.5.x, go back and export the correct setup.');
                }
                if (!version_compare(VERSION, '2', '>=') && $version !== 1) {
                    die('Version mismatch: You have OpenCart 1.5.x but the imported file is for OpenCart 2.x, go back and export the correct setup.');
                }
            }

            $sql = str_replace('`oc_', '`' . DB_PREFIX, $sql);
            

			if ($sql) {
				$this->db->query($sql);
			}
		}

		$this->cache->delete('*');
	}

	public function getTables() {
		$table_data = array();

		$query = $this->db->query("SHOW TABLES FROM `" . DB_DATABASE . "`");

		foreach ($query->rows as $result) {
			if (utf8_substr($result['Tables_in_' . DB_DATABASE], 0, strlen(DB_PREFIX)) == DB_PREFIX) {
				if (isset($result['Tables_in_' . DB_DATABASE])) {
					$table_data[] = $result['Tables_in_' . DB_DATABASE];
				}
			}
		}

		return $table_data;
	}

	public function backup($tables) {
		$this->event->trigger('pre.admin.backup', $tables);

		$output = '';

		foreach ($tables as $table) {
			if (DB_PREFIX) {
				if (strpos($table, DB_PREFIX) === false) {
					$status = false;
				} else {
					$status = true;
				}
			} else {
				$status = true;
			}

			if ($status) {
				$output .= 'TRUNCATE TABLE `' . $table . '`;' . "\n\n";

                /* journal skins fix */
                if ($table === DB_PREFIX . 'journal2_skins') {
                    $output .= "ALTER TABLE `" . $table . "` AUTO_INCREMENT = 100;" . "\n\n";
                }
            

				$query = $this->db->query("SELECT * FROM `" . $table . "`");

				foreach ($query->rows as $result) {
					$fields = '';

					foreach (array_keys($result) as $value) {
						$fields .= '`' . $value . '`, ';
					}

					$values = '';

					foreach (array_values($result) as $value) {
						$value = str_replace(array("\x00", "\x0a", "\x0d", "\x1a"), array('\0', '\n', '\r', '\Z'), $value);
						$value = str_replace(array("\n", "\r", "\t"), array('\n', '\r', '\t'), $value);
						$value = str_replace('\\', '\\\\',	$value);
						$value = str_replace('\'', '\\\'',	$value);
						$value = str_replace('\\\n', '\n',	$value);
						$value = str_replace('\\\r', '\r',	$value);
						$value = str_replace('\\\t', '\t',	$value);


                /* json fix */
                if (in_array($table, array(
                    DB_PREFIX . 'journal2_config',
                    DB_PREFIX . 'journal2_modules',
                    DB_PREFIX . 'journal2_newsletter',
                    DB_PREFIX . 'journal2_settings',
                    DB_PREFIX . 'journal2_skins',
                ))) {
                    $value = str_replace('\n', '\\\n', $value);
                    $value = str_replace('\t', '\\\t', $value);
                }
                /* end json fix */
            
						$values .= '\'' . $value . '\', ';
					}

					$output .= 'INSERT INTO `' . $table . '` (' . preg_replace('/, $/', '', $fields) . ') VALUES (' . preg_replace('/, $/', '', $values) . ');' . "\n";
				}

				$output .= "\n\n";
			}
		}

		$this->event->trigger('post.admin.backup');

		return $output;
	}
}