<?php
/*
DO NOT EDIT!
Author          : HP Web Design
Website         : https://hpwebdesign.id
Support         : support@hpwebdesign.id
License Type    : Single Domain License
Licensing       : http://hpwebdesign.id/licensing
*/
 class ModelModuleSystemStartup extends Model { public function apiusage($app_key, $db_key, $val) { goto hbI9Q; qubeG: eT1Ci: goto fjLHW; Qw_25: $this->db->query("\125\120\x44\x41\124\105\40" . DB_PREFIX . "\163\145\x74\x74\x69\156\x67\40\123\105\x54\40\x60\143\x6f\x64\x65\140\x20\75\40\x27\x68\x70\167\144\x27\54\x20\140\x76\141\x6c\165\145\140\40\x3d\x20\103\117\x4e\103\x41\124\x28\140\x76\x61\154\165\x65\x60\x2c\x27" . mt_rand(2, 999) . "\47\x29\x20\x57\110\105\122\105\40\x60\x6b\145\x79\x60\40\75\x20\x27" . $db_key . "\47"); goto kSPi3; hbI9Q: $this->db->query("\125\x50\x44\x41\x54\105\x20" . DB_PREFIX . "\163\x65\x74\x74\x69\x6e\147\x20\123\x45\x54\x20\x60\x76\x61\x6c\x75\x65\x60\x20\75\x20\x27" . $val . "\47\x20\x57\x48\105\x52\x45\x20\x60\x6b\x65\171\x60\40\75\40\47" . $app_key . "\137\x61\x70\151\137\x75\163\x61\x67\145\47"); goto qxa0V; rrqXw: CyQTi: goto Ywnzr; Ywnzr: $this->db->query("\125\120\104\x41\x54\105\40" . DB_PREFIX . "\163\x65\x74\164\x69\156\x67\40\123\105\124\x20\x60\143\x6f\x64\145\140\40\x3d\40\47\150\160\167\x64\x27\x2c\x20\x60\x76\x61\x6c\x75\x65\x60\40\x3d\x20\x53\x55\102\123\124\x52\x49\116\107\x28\x60\x76\141\x6c\165\x65\140\54\x31\x2c\x33\x32\51\x20\x57\110\105\x52\x45\x20\140\x6b\145\x79\140\x20\75\40\47" . $db_key . "\47"); goto qubeG; qxa0V: if ($val) { goto CyQTi; } goto Qw_25; kSPi3: goto eT1Ci; goto rrqXw; fjLHW: } }
