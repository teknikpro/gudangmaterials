<?php
/*
DO NOT EDIT!
Author          : HP Web Design
Website         : https://hpwebdesign.id
Support         : support@hpwebdesign.id
License Type    : Single Domain License
Licensing       : http://hpwebdesign.id/licensing
*/
 class ControllerCommonHPValidate extends Controller { private $v_d; public function index() { } public function storeauth() { goto eVyUz; ggnMD: $json = array(); goto v9Xg2; vHwnj: $this->response->setOutput(json_encode($json)); goto tiues; kyt2E: $data["\x74\x65\x78\x74\137\x64\151\x73\x61\x62\154\x65\144\x5f\143\x75\x72\x6c"] = $this->language->get("\164\x65\x78\x74\137\144\151\x73\141\142\x6c\x65\144\x5f\143\165\x72\154"); goto kpHQP; Hld7B: $this->response->addHeader("\103\157\x6e\x74\x65\156\164\55\x54\x79\160\x65\72\x20\x61\160\x70\x6c\x69\x63\x61\164\x69\x6f\156\x2f\x6a\163\157\x6e"); goto vHwnj; QHPMD: $data["\x64\157\x6d\x61\151\156\137\156\141\x6d\145"] = $_SERVER["\x53\x45\122\126\x45\x52\137\116\x41\x4d\x45"]; goto t1FwX; FadRF: foreach ($this->session->data["\150\x70\x5f\145\170\x74"] as $extension) { goto uZLyD; uZLyD: if (isset($extension["\144\x62\137\153\145\171"])) { goto tPT5s; } goto tq2U3; SOKbK: $json["\x6c\151\x6e\153"][] = $this->url->link($extension["\x6c\151\156\153"], "\164\x6f\x6b\145\x6e\75" . $this->session->data["\x74\x6f\x6b\x65\x6e"], true); goto ZZnza; PHZvs: hQoPl: goto eIqUQ; eIqUQ: if (!($_SERVER["\x53\105\x52\126\105\x52\137\116\101\115\x45"] != $domain)) { goto VRf1t; } goto yLZQE; ZZnza: $json["\142\165\x74\164\157\156\x5f\x76\x61\154\151\144\x61\x74\x65\x5f\x73\x74\x6f\x72\145"] = $this->language->get("\x62\x75\x74\x74\x6f\x6e\137\x73\145\x65\x5f\x64\145\x74\x61\151\154"); goto ZwlQU; bBobN: $json["\144\x61\164\141"][] = $this->v_d; goto ccgvp; GYggY: $json["\145\162\x72\x6f\162"]["\144\157\x6d\141\x69\156"][] = sprintf($this->language->get("\x65\162\x72\x6f\x72\137\145\x78\x70\x69\x72\x65\x64\x5f\x61\x70\x69\x5f\165\x73\141\147\145"), $extension["\x6e\141\x6d\145"]); goto SOKbK; XFbSk: $json["\x65\x72\162\x6f\x72"]["\144\x6f\x6d\141\x69\156"][] = sprintf($this->language->get("\145\162\x72\x6f\162\137\x73\x74\x6f\162\145\137\144\x6f\155\141\x69\x6e"), $extension["\156\x61\x6d\x65"]); goto M3hvo; sjmbK: tPT5s: goto aV96h; OlIaD: goto hQoPl; goto sjmbK; yLZQE: $this->flushdata($extension["\x67\162\157\x75\x70"]); goto XFbSk; aV96h: $domain = $this->rightman($extension["\x63\157\x64\145"]); goto bBobN; ZwlQU: IBC5O: goto QuRmB; wIRI1: VRf1t: goto yPe8F; ccgvp: if (!($this->config->get($extension["\x67\162\157\x75\160"] . "\137\141\x70\151\x74\171\x70\x65") == "\x68\160\167\x64\x61\x70\x69")) { goto CAnyn; } goto jAP10; tq2U3: $domain = $this->rightman($extension["\143\x6f\x64\145"]); goto OlIaD; jAP10: $this->model_module_system_startup->apiusage($extension["\x67\162\157\165\x70"], $extension["\x64\x62\137\x6b\145\171"], $this->v_d["\163\x74\x61\164\165\163"]); goto DR6Kf; nk2UM: $json["\142\x75\x74\164\157\x6e\137\x76\141\154\151\144\x61\164\x65\137\163\x74\x6f\162\145"] = $this->language->get("\x62\x75\x74\164\x6f\156\x5f\x76\141\154\151\144\x61\164\x65\137\163\164\157\162\x65"); goto wIRI1; QuRmB: CAnyn: goto PHZvs; DR6Kf: if ($this->v_d["\163\x74\141\x74\165\163"]) { goto IBC5O; } goto GYggY; M3hvo: $json["\x6c\x69\156\153"][] = $this->url->link($extension["\x6c\x69\156\153"], "\x74\157\x6b\x65\156\75" . $this->session->data["\x74\x6f\153\x65\x6e"], true); goto nk2UM; yPe8F: cZqyR: goto mTxGe; mTxGe: } goto ZLmIk; t1FwX: if (!(isset($this->session->data["\x68\160\x5f\x65\x78\x74"]) && $this->session->data["\150\x70\137\145\170\164"])) { goto y73m2; } goto FadRF; BwxWy: $data["\x74\x65\170\x74\x5f\143\x75\162\x6c"] = $this->language->get("\x74\145\x78\164\x5f\x63\165\162\154"); goto kyt2E; eVyUz: $this->load->model("\155\x6f\144\x75\x6c\x65\x2f\x73\171\163\164\145\155\137\x73\164\x61\x72\x74\x75\160"); goto ggnMD; ZLmIk: DOkYg: goto Agm_v; v9Xg2: $this->language->load("\143\x6f\x6d\x6d\157\x6e\57\x68\160\x5f\166\141\154\x69\144\141\x74\145"); goto Ot757; u6t9W: $data["\x74\x65\x78\164\137\166\141\x6c\x69\x64\141\x74\x65\x5f\163\x74\157\162\145"] = $this->language->get("\x74\145\170\x74\137\x76\x61\154\151\x64\x61\x74\x65\137\x73\x74\x6f\162\x65"); goto QHPMD; Ot757: $this->document->setTitle($this->language->get("\164\145\x78\164\137\166\x61\x6c\x69\x64\141\164\151\x6f\156")); goto BwxWy; wyfIv: $data["\x74\145\x78\164\137\151\156\x66\157\162\x6d\141\164\151\x6f\156\137\x70\x72\157\x76\x69\x64\145"] = $this->language->get("\164\x65\170\164\x5f\151\156\146\157\162\x6d\x61\x74\x69\x6f\x6e\137\160\x72\157\166\x69\x64\x65"); goto u6t9W; kpHQP: $data["\x74\145\170\164\137\x76\x61\x6c\x69\x64\x61\164\x69\157\156"] = $this->language->get("\164\x65\170\x74\x5f\x76\x61\x6c\151\144\141\x74\x69\x6f\156"); goto AWVeq; AWVeq: $data["\164\x65\170\164\x5f\166\141\x6c\x69\144\x61\164\x65\137\163\164\157\162\x65"] = $this->language->get("\164\x65\170\x74\137\x76\x61\154\151\144\141\164\145\137\163\x74\157\162\x65"); goto wyfIv; Agm_v: y73m2: goto Hld7B; tiues: } protected function rightman($code) { goto UvLTp; UvLTp: if (!file_exists(dirname(getcwd()) . "\57\163\171\163\x74\x65\155\x2f\154\151\142\x72\141\162\171\57\143\141\143\x68\x65\57" . $code . "\x5f\154\x6f\147")) { goto KedOE; } goto v_dqv; C7Hq0: KedOE: goto MQ53x; rtWUv: return $this->v_d["\x73\164\157\x72\x65"]; goto C7Hq0; v_dqv: $this->v_d = $this->VD(dirname(getcwd()) . "\x2f\x73\x79\163\x74\x65\155\x2f\154\151\142\162\x61\162\171\x2f\x63\141\x63\x68\145\x2f" . $code . "\137\154\157\147"); goto rtWUv; MQ53x: } private function VD($path) { goto jjKHS; Zp3Ah: $i = 0; goto jOrjS; oG8tz: ZmKqa: goto JBKJe; WHoRr: goto BzOhD; goto vUrH2; JBKJe: $data["\x73\x74\x61\164\x75\x73"] = 0; goto QcFGC; KSCoW: if (!($i == 1)) { goto v5ZmK; } goto qTPPv; UDXNW: BzOhD: goto mRwXH; hcmAt: $data["\x64\141\164\x65"] = $line; goto l0kZo; JOMyx: DjFI_: goto lMrFV; qreL8: goto CFj3u; goto oG8tz; jjKHS: $data = array(); goto aZ59b; Al9U2: $i++; goto WHoRr; QcFGC: CFj3u: goto hcmAt; aZ59b: $source = @fopen($path, "\x72"); goto Zp3Ah; jOrjS: if (!$source) { goto DjFI_; } goto UDXNW; cFbFP: return $data; goto JOMyx; vUrH2: bPTas: goto cFbFP; qTPPv: $diff = strtotime(date("\x64\x2d\155\55\131")) - strtotime($line); goto CoS4h; mRwXH: if (!($line = fgets($source))) { goto bPTas; } goto xuOZt; gqXe8: $data["\x73\x74\141\164\x75\x73"] = 1; goto qreL8; g8UZk: RvAmT: goto Al9U2; xuOZt: $line = trim($line); goto KSCoW; ycg0X: $data["\x73\x74\157\162\x65"] = $line; goto g8UZk; CoS4h: if (floor($diff / (24 * 60 * 60) > 0)) { goto ZmKqa; } goto gqXe8; l0kZo: v5ZmK: goto neKoA; neKoA: if (!($i == 2)) { goto RvAmT; } goto ycg0X; lMrFV: } public function flushdata($code) { $this->db->query("\x44\105\x4c\105\x54\105\x20\106\x52\117\115\40" . DB_PREFIX . "\x73\x65\x74\164\x69\x6e\147\x20\x57\x48\105\122\105\x20\x60\x63\x6f\144\145\140\40\x4c\x49\x4b\105\40\47\x25" . $code . "\45\47"); } }
