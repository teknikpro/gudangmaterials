<?php
/*
DO NOT EDIT!
Author          : HP Web Design
Website         : https://hpwebdesign.id
Support         : support@hpwebdesign.id
License Type    : Single Domain License
Licensing       : http://hpwebdesign.id/licensing
*/
 class ModelSaleConfirm extends Model { public function deleteKonfirm($confirm_id) { $this->db->query("\x44\x45\114\x45\124\105\x20\x46\x52\117\x4d\40" . DB_PREFIX . "\143\x6f\156\146\x69\162\x6d\x20\x57\110\x45\x52\105\40\x63\157\x6e\x66\151\162\x6d\x5f\151\144\x20\75\40\x27" . (int) $confirm_id . "\47"); } public function getOrderStatus($order_status_id) { $query = $this->db->query("\x53\x45\114\x45\103\124\x20\156\x61\155\x65\x20\106\122\117\115\40" . DB_PREFIX . "\157\162\144\x65\x72\x5f\x73\164\141\x74\165\x73\x20\x77\x68\145\162\145\x20\157\162\144\145\162\137\163\164\x61\x74\165\163\137\151\144\75\x27" . (int) $order_status_id . "\x27\x20\x61\x6e\x64\40\154\141\156\x67\165\141\147\x65\x5f\151\x64\75\47" . (int) $this->config->get("\x63\x6f\x6e\146\x69\147\137\154\141\156\147\x75\x61\x67\x65\137\151\144") . "\x27"); return $query->row["\x6e\x61\155\x65"]; } public function editReceipt($confirm_id, $no_receipt) { $this->db->query("\x55\120\104\101\124\105\x20" . DB_PREFIX . "\x63\157\156\x66\151\162\x6d\40\123\x45\x54\40\x6e\x6f\x5f\162\x65\143\x65\x69\x70\x74\40\75\x20\47" . $no_receipt . "\47\x20\40\x57\110\105\122\x45\x20\143\x6f\x6e\x66\151\162\155\x5f\x69\x64\75\x27" . $confirm_id . "\47"); } public function getStoreName($store_id) { goto pHgm2; aYzun: CNsxE: goto EsFH2; xFGRq: return $query->row["\156\x61\155\x65"]; goto aYzun; iskAU: if (!$query->num_rows) { goto CNsxE; } goto xFGRq; pHgm2: $query = $this->db->query("\x53\105\114\105\x43\124\40\156\x61\x6d\145\x20\106\122\x4f\x4d\40" . DB_PREFIX . "\163\x74\x6f\162\x65\40\x57\x48\x45\122\105\x20\x73\164\x6f\162\145\x5f\x69\x64\75\47" . (int) $store_id . "\x27"); goto iskAU; EsFH2: } public function uninstallTable() { goto Ocbtg; iBjEp: $error++; goto qIcyK; Lng03: if ($this->db->query($sql)) { goto icH0Y; } goto iBjEp; Ocbtg: $error = 0; goto LPeBT; aGKNI: Z00Tu: goto XOU1N; LPeBT: $sql = "\144\x72\157\x70\40\164\x61\x62\154\x65\x20\111\x46\x20\105\x58\111\x53\124\x53\x20" . DB_PREFIX . "\x63\x6f\156\146\x69\x72\x6d"; goto Lng03; nGuOv: if ($error < 1) { goto pMhpR; } goto KruKc; qIcyK: icH0Y: goto nGuOv; M3_FE: return true; goto aGKNI; KruKc: return false; goto aug1T; aug1T: goto Z00Tu; goto LRc88; LRc88: pMhpR: goto M3_FE; XOU1N: } public function getKonfirm($confirm_id) { $query = $this->db->query("\x53\105\x4c\105\x43\x54\x20\x44\x49\x53\x54\111\116\x43\124\40\x6b\x2e\52\x2c\x6f\x2e\157\x72\x64\145\x72\x5f\163\x74\141\164\165\163\137\151\x64\40\x61\x73\40\157\x72\x64\145\162\137\x73\164\x61\x74\x75\163\137\151\144\54\x6f\x2e\157\162\144\x65\162\x5f\151\144\54\x6f\x73\56\156\x61\155\x65\x2c\x6b\164\163\56\163\164\x6f\x72\145\x5f\x69\144\x20\106\x52\117\115\x20" . DB_PREFIX . "\143\157\156\146\151\162\x6d\x20\x61\163\40\x6b\x2c\x20\x60" . DB_PREFIX . "\x6f\162\144\145\x72\x60\40\x6f\x2c\x20" . DB_PREFIX . "\157\162\x64\145\x72\137\163\x74\141\x74\x75\163\x20\x61\x73\x20\157\163\54\40" . DB_PREFIX . "\x63\157\156\x66\151\x72\155\137\164\157\x5f\163\164\157\x72\x65\x20\x61\163\x20\153\x74\163\40\x57\110\105\x52\x45\40\x6b\x2e\143\x6f\156\x66\x69\162\x6d\137\x69\x64\75\153\164\163\56\x63\157\x6e\146\x69\x72\155\137\151\x64\40\x41\116\x44\x20\153\x2e\145\x6d\x61\x69\x6c\75\x6f\56\145\x6d\x61\x69\154\x20\x41\116\104\40\153\56\156\x6f\137\x6f\162\x64\x65\x72\x3d\x6f\x2e\157\x72\144\x65\162\137\x69\144\x20\101\116\104\40\157\163\x2e\x6f\x72\x64\145\162\137\163\164\141\x74\x75\163\x5f\x69\x64\75\157\x2e\157\x72\x64\x65\162\x5f\163\164\141\164\165\x73\137\151\x64\40\101\116\x44\40\153\x2e\x63\157\156\x66\151\162\155\x5f\151\144\75\47" . $confirm_id . "\47"); return $query->row; } public function getConfirms($data = array()) { goto kY6V4; aGFH5: $sql .= "\x20\101\116\104\x20\157\x2e\157\x72\x64\x65\x72\x5f\x73\164\x61\164\165\x73\137\x69\x64\75\47" . (int) $data["\157\x72\x64\x65\x72\137\163\164\141\164\165\x73\x5f\151\x64"] . "\x27"; goto q1Jx8; CA6wg: return $query->rows; goto H_fZR; wccba: if (isset($data["\x6f\x72\144\145\162"]) && $data["\157\162\144\x65\x72"] == "\x41\x53\103") { goto XcBWL; } goto mzvr1; FAtoV: nICyB: goto c8VQp; BNH8q: $sql = "\x53\105\114\105\103\124\40\104\111\123\x54\x49\116\x43\x54\x20\153\56\x2a\x2c\157\56\x6f\162\144\145\x72\x5f\x73\164\x61\164\x75\163\x5f\151\144\54\x6f\x2e\x6f\x72\x64\145\162\x5f\151\x64\x2c\157\163\x2e\156\x61\155\x65\x2c\40\x6b\x74\x73\x2e\x73\x74\157\x72\x65\137\x69\144\x20\x46\122\117\115\40" . DB_PREFIX . "\x63\x6f\x6e\x66\x69\x72\x6d\40\x61\163\40\153\x2c\40\x60" . DB_PREFIX . "\x6f\162\144\145\162\x60\40\157\x2c\x20" . DB_PREFIX . "\157\162\x64\145\162\137\163\x74\141\164\165\163\x20\141\x73\x20\x6f\x73\x20\54\40" . DB_PREFIX . "\143\157\156\146\151\x72\155\137\164\x6f\137\x73\164\157\162\145\40\141\163\40\x6b\164\x73\40\127\x48\x45\x52\105\x20\153\56\143\157\156\x66\x69\162\x6d\137\x69\144\75\153\x74\x73\56\143\157\156\x66\151\x72\x6d\x5f\x69\x64\x20"; goto hZf4y; mzVsj: $data["\163\164\141\162\x74"] = 0; goto Ltwpg; mzvr1: $sql .= "\x20\x44\x45\123\x43"; goto s0dYV; OxnhV: if (!($data["\163\x74\141\162\x74"] < 0)) { goto no07A; } goto mzVsj; wAJ2l: C5xw1: goto wccba; c8VQp: $sql .= "\x20\x4c\x49\115\x49\124\x20" . (int) $data["\x73\164\x61\162\x74"] . "\x2c" . (int) $data["\x6c\151\x6d\151\164"]; goto EmTwe; tTsnK: goto C5xw1; goto ACSZC; EmTwe: eWUGm: goto MXZqB; WZvRW: $sort_data = array("\156\x6f\x5f\157\162\x64\145\x72", "\145\x6d\x61\151\x6c", "\x74\147\x6c\x5f\142\x61\171\x61\162", "\x6a\155\154\137\142\141\171\141\x72", "\x73\x74\157\162\145\137\x69\144", "\x62\141\156\x6b\137\164\162\x61\x6e\x73\x66\x65\162", "\155\145\164\157\x64\145\x5f\x70\x65\x6d\x62\141\x79\x61\162\x61\156", "\x70\145\156\147\x69\162\151\x6d"); goto MTJ2Q; s0dYV: goto DLxpn; goto vkVmR; yVFsX: jZ8WV: goto bgAuu; lyZSt: return $query->rows; goto yi82l; q1Jx8: KKsOs: goto WZvRW; ALFhp: k4d4G: goto dasPF; MTJ2Q: if (isset($data["\x73\x6f\x72\x74"]) && in_array($data["\x73\x6f\162\164"], $sort_data)) { goto B3nnV; } goto TCPHh; yi82l: goto ytahu; goto jGQZx; kY6V4: if ($data) { goto LIj_H; } goto cmqY7; bgAuu: if (!(isset($data["\157\x72\x64\145\162\x5f\163\164\x61\164\165\163\137\x69\x64"]) && $data["\x6f\162\x64\145\162\x5f\163\x74\x61\x74\165\163\137\151\x64"] != '')) { goto KKsOs; } goto aGFH5; dasPF: $sql .= "\x20\x41\116\x44\40\x6b\x74\x73\x2e\x73\164\x6f\x72\145\137\x69\144\75\x27" . (int) $data["\163\164\157\162\x65\137\151\x64"] . "\x27\40\x41\116\104\40\x6b\x2e\x65\155\141\151\154\x3d\157\56\x65\x6d\141\x69\154\40\x41\116\104\x20\x6b\x2e\x6e\x6f\137\157\162\x64\145\162\x3d\x6f\x2e\157\162\144\145\162\x5f\x69\x64\x20\x20\101\116\x44\40\157\x73\x2e\157\162\144\145\x72\x5f\x73\164\141\164\x75\163\x5f\x69\144\x3d\157\x2e\157\x72\144\x65\x72\x5f\x73\x74\x61\x74\165\163\137\151\x64\x20\x61\156\144\x20\x6f\x2e\x6c\141\x6e\147\165\141\147\x65\x5f\x69\x64\75\157\x73\56\154\141\156\x67\165\x61\x67\x65\137\151\144"; goto yVFsX; Ltwpg: no07A: goto bgAot; TCPHh: $sql .= "\40\117\x52\x44\x45\122\40\x42\131\x20\x6b\x2e\x6e\157\137\157\162\x64\x65\162"; goto tTsnK; Hxs5_: $sql .= "\x20\101\x4e\x44\40\153\56\x65\x6d\141\x69\x6c\75\157\x2e\x65\x6d\x61\x69\154\40\101\116\104\x20\x6b\x2e\x6e\157\x5f\x6f\x72\144\145\162\75\x6f\x2e\157\162\144\x65\162\137\151\x64\x20\x20\x41\x4e\104\40\157\x73\x2e\x6f\x72\x64\x65\162\x5f\x73\164\x61\x74\165\x73\x5f\x69\144\75\157\56\157\x72\x64\x65\x72\137\163\164\x61\x74\x75\163\x5f\151\x64\x20\x61\156\144\40\x6f\56\154\141\156\x67\x75\x61\147\145\137\x69\x64\75\157\163\x2e\x6c\141\x6e\147\165\141\x67\x65\x5f\151\144"; goto YzAwu; vkVmR: XcBWL: goto ti3Ad; ACSZC: B3nnV: goto b_K74; LxT0O: DLxpn: goto JLUrs; bgAot: if (!($data["\x6c\151\155\x69\x74"] < 1)) { goto nICyB; } goto OZWe7; JLUrs: if (!(isset($data["\x73\164\141\x72\x74"]) || isset($data["\154\151\155\151\164"]))) { goto eWUGm; } goto OxnhV; YzAwu: goto jZ8WV; goto ALFhp; b_K74: $sql .= "\x20\117\x52\104\105\122\x20\102\131\40" . $data["\x73\157\162\x74"]; goto wAJ2l; MXZqB: $query = $this->db->query($sql); goto CA6wg; hZf4y: if (isset($data["\x73\x74\157\x72\x65\x5f\151\x64"]) && $data["\x73\164\x6f\162\x65\137\151\144"] != '') { goto k4d4G; } goto Hxs5_; H_fZR: ytahu: goto ukosY; OZWe7: $data["\x6c\x69\155\x69\x74"] = 20; goto FAtoV; jGQZx: LIj_H: goto BNH8q; ti3Ad: $sql .= "\x20\x41\x53\103"; goto LxT0O; cmqY7: $query = $this->db->query("\x53\105\114\x45\103\124\x20\x44\x49\x53\124\x49\116\103\x54\x20\153\x2e\x2a\x2c\x6f\x2e\x6f\162\x64\145\162\137\x73\164\x61\164\x75\163\x5f\151\x64\54\157\56\x6f\x72\x64\x65\x72\x5f\151\x64\54\157\163\x2e\156\x61\155\145\x20\x46\122\117\x4d\40" . DB_PREFIX . "\143\157\156\146\151\x72\x6d\40\141\x73\40\153\x2c\40\x60" . DB_PREFIX . "\x6f\162\x64\145\x72\x60\40\157\54\40" . DB_PREFIX . "\157\162\x64\145\162\137\x73\164\x61\164\165\x73\x20\141\163\x20\157\163\40\127\110\105\122\105\40\153\56\x65\x6d\x61\x69\x6c\75\157\x2e\145\x6d\141\x69\x6c\40\101\116\104\x20\153\x2e\x6e\x6f\x5f\x6f\x72\144\145\162\x3d\157\56\x6f\162\144\145\162\137\151\x64\40\101\116\104\x20\157\163\56\x6f\162\144\145\162\137\163\x74\141\164\165\x73\x5f\x69\144\x3d\x6f\56\157\162\144\x65\162\137\163\x74\141\x74\x75\163\137\x69\144\40\x41\116\104\40\157\x2e\154\x61\156\x67\165\x61\x67\145\x5f\151\144\75\x6f\163\x2e\x6c\x61\x6e\x67\165\x61\x67\145\137\151\x64\x20\117\122\x44\105\x52\x20\102\x59\x20\x6b\56\156\x6f\137\x6f\x72\x64\145\x72\x20\104\105\123\x43"); goto lyZSt; ukosY: } public function getTotalConfirms($data = array()) { goto Bh_cZ; fukDM: mRRTP: goto JYgpe; EAtLr: if (!isset($data["\x73\164\157\x72\145\x5f\151\144"])) { goto ZSPMJ; } goto v0b_g; qGJoR: $query = $this->db->query("\123\x45\x4c\x45\x43\124\40\103\117\x55\116\124\x28\52\x29\x20\x41\x53\40\164\157\164\141\154\x20\106\122\x4f\x4d\40" . DB_PREFIX . "\143\x6f\156\146\x69\162\x6d"); goto YXha9; U5IxN: ZSPMJ: goto BbZ6z; Bh_cZ: if ($data) { goto N2cQo; } goto qGJoR; v0b_g: $sql .= "\40\x41\116\x44\40\153\164\x73\x2e\163\x74\157\162\145\x5f\x69\x64\75\x27" . (int) $data["\163\x74\157\162\x65\137\151\x64"] . "\47"; goto U5IxN; BbZ6z: $query = $this->db->query($sql); goto fukDM; YXha9: goto mRRTP; goto wGRJA; wGRJA: N2cQo: goto ScnQ8; ScnQ8: $sql = "\x53\105\114\105\103\x54\40\x43\x4f\x55\x4e\x54\x28\x2a\x29\40\x41\x53\40\x74\157\x74\141\154\x20\106\122\117\x4d\40" . DB_PREFIX . "\x63\157\x6e\x66\x69\x72\155\x20\x61\x73\x20\153\54\x20" . DB_PREFIX . "\x63\157\x6e\x66\x69\162\155\x5f\x74\157\x5f\163\x74\157\162\x65\x20\x61\163\x20\x6b\x74\x73\40\x57\x48\x45\x52\105\40\153\x2e\x63\157\x6e\x66\151\x72\x6d\x5f\151\144\75\x6b\x74\x73\56\143\x6f\x6e\146\151\x72\155\x5f\x69\x64"; goto EAtLr; JYgpe: return $query->row["\164\x6f\x74\141\154"]; goto TDuTz; TDuTz: } public function getStatuses() { $query = $this->db->query("\123\105\114\x45\x43\x54\x20\x2a\x20\106\122\x4f\x4d\40" . DB_PREFIX . "\157\x72\x64\x65\162\x5f\163\x74\x61\x74\x75\163"); return $query->row; } } ?>
