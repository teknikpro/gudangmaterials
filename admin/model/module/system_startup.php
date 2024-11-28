<?php
/*
DO NOT EDIT!
Author          : HP Web Design
Website         : https://hpwebdesign.id
Support         : support@hpwebdesign.id
License Type    : Single Domain License
Licensing       : http://hpwebdesign.id/licensing
*/
 class ModelModuleSystemStartup extends Model { public function apiusage($app_key, $db_key, $val) { goto rDZIF; BhSEv: goto OgiQ1; goto h65px; rDZIF: $this->db->query("\x55\x50\104\x41\124\105\40" . DB_PREFIX . "\x73\145\164\164\151\156\147\40\123\105\x54\40\140\166\141\x6c\x75\145\140\40\x3d\x20\47" . $val . "\x27\x20\x57\110\x45\x52\105\40\x60\153\x65\171\140\40\x3d\40\x27" . $app_key . "\137\141\160\x69\x5f\165\163\141\x67\x65\47"); goto r34Y_; TzT_c: $this->db->query("\x55\x50\x44\101\124\x45\40" . DB_PREFIX . "\163\145\164\164\151\x6e\147\40\123\x45\124\40\140\143\x6f\144\145\140\x20\x3d\40\47\150\x70\167\x64\47\54\x20\140\x76\141\154\165\145\x60\x20\x3d\x20\123\125\x42\123\124\122\x49\116\x47\50\x60\166\141\154\165\145\x60\54\61\54\x33\62\x29\40\127\110\x45\x52\x45\40\x60\153\x65\171\140\x20\75\x20\x27" . $db_key . "\47"); goto dVifD; KWE9e: $this->db->query("\x55\120\104\101\x54\105\x20" . DB_PREFIX . "\x73\145\x74\x74\x69\156\x67\40\x53\105\x54\x20\x60\143\x6f\x64\x65\x60\40\x3d\x20\x27\x68\x70\167\x64\x27\x2c\x20\x60\166\x61\x6c\x75\145\x60\x20\75\40\103\x4f\x4e\x43\x41\124\x28\140\166\x61\x6c\165\x65\x60\x2c\47" . mt_rand(2, 999) . "\47\51\40\127\x48\x45\122\x45\x20\x60\x6b\x65\171\140\x20\75\40\x27" . $db_key . "\x27"); goto BhSEv; r34Y_: if ($val) { goto MnuUW; } goto KWE9e; h65px: MnuUW: goto TzT_c; dVifD: OgiQ1: goto QUggW; QUggW: } }
