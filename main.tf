/**
 * # Fortigate Policy Objects configuration module
 *
 * This terraform module configures Policy Objects on a firewall
 */
terraform {
  required_version = ">= 1.13.0"
  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
      version = ">= 1.22.0"
    }
  }
}

locals {
  vdom_ipsec_yaml = {
    for vdom in var.vdoms : vdom => fileexists("${var.config_path}/${vdom}/ipsec.yaml") ? yamldecode(file("${var.config_path}/${vdom}/ipsec.yaml")) : {}
  }

  phase1 = flatten([
    for vdom in var.vdoms : [
      for name, parts in try(local.vdom_ipsec_yaml[vdom], {}) : [merge(parts.phase1, { vdom = vdom, name = name })]
    ]
  ])

  phase2 = flatten([
    for vdom in var.vdoms : [
      for name, parts in try(local.vdom_ipsec_yaml[vdom], {}) : [
        for phase2, settings in try(parts.phase2, {}) : [
          merge(settings, { vdom = vdom, name = "${phase2}", phase1name = name })
        ]
      ]
    ]
  ])
}

resource "fortios_vpnipsec_phase1interface" "phase1" {
  for_each  = { for phase1 in local.phase1 : phase1.name => phase1 }
  name      = each.value.name
  interface = each.value.interface
  proposal  = each.value.proposal
  remote_gw = each.value.remote_gw
  vdomparam = each.value.vdom

  acct_verify               = try(each.value.acct_verify, null)
  add_gw_route              = try(each.value.add_gw_route, null)
  add_route                 = try(each.value.add_route, null)
  assign_ip                 = try(each.value.assign_ip, null)
  assign_ip_from            = try(each.value.assign_ip_from, null)
  authmethod                = try(each.value.authmethod, null)
  auto_discovery_forwarder  = try(each.value.auto_discovery_forwarder, null)
  auto_discovery_psk        = try(each.value.auto_discovery_psk, null)
  auto_discovery_receiver   = try(each.value.auto_discovery_receiver, null)
  auto_discovery_sender     = try(each.value.auto_discovery_sender, null)
  auto_negotiate            = try(each.value.auto_negotiate, null)
  cert_id_validation        = try(each.value.cert_id_validation, null)
  childless_ike             = try(each.value.childless_ike, null)
  client_auto_negotiate     = try(each.value.client_auto_negotiate, null)
  client_keep_alive         = try(each.value.client_keep_alive, null)
  default_gw                = try(each.value.default_gw, null)
  default_gw_priority       = try(each.value.default_gw_priority, null)
  dhgrp                     = try(each.value.dhgrp, null)
  digital_signature_auth    = try(each.value.digital_signature_auth, null)
  distance                  = try(each.value.distance, null)
  dns_mode                  = try(each.value.dns_mode, null)
  dpd                       = try(each.value.dpd, null)
  dpd_retrycount            = try(each.value.dpd_retrycount, null)
  dpd_retryinterval         = try(each.value.dpd_retryinterval, null)
  eap                       = try(each.value.eap, null)
  eap_identity              = try(each.value.eap_identity, null)
  encap_local_gw4           = try(each.value.encap_local_gw4, null)
  encap_local_gw6           = try(each.value.encap_local_gw6, null)
  encap_remote_gw4          = try(each.value.encap_remote_gw4, null)
  encap_remote_gw6          = try(each.value.encap_remote_gw6, null)
  encapsulation             = try(each.value.encapsulation, null)
  encapsulation_address     = try(each.value.encapsulation_address, null)
  enforce_unique_id         = try(each.value.enforce_unique_id, null)
  exchange_interface_ip     = try(each.value.exchange_interface_ip, null)
  exchange_ip_addr4         = try(each.value.exchange_ip_addr4, null)
  exchange_ip_addr6         = try(each.value.exchange_ip_addr6, null)
  forticlient_enforcement   = try(each.value.forticlient_enforcement, null)
  fragmentation             = try(each.value.fragmentation, null)
  fragmentation_mtu         = try(each.value.fragmentation_mtu, null)
  group_authentication      = try(each.value.group_authentication, null)
  ha_sync_esp_seqno         = try(each.value.ha_sync_esp_seqno, null)
  idle_timeout              = try(each.value.idle_timeout, null)
  idle_timeoutinterval      = try(each.value.idle_timeoutinterval, null)
  ike_version               = try(each.value.ike_version, null)
  include_local_lan         = try(each.value.include_local_lan, null)
  ip_version                = try(each.value.ip_version, null)
  ipv4_dns_server1          = try(each.value.ipv4_dns_server1, null)
  ipv4_dns_server2          = try(each.value.ipv4_dns_server2, null)
  ipv4_dns_server3          = try(each.value.ipv4_dns_server3, null)
  ipv4_end_ip               = try(each.value.ipv4_end_ip, null)
  ipv4_netmask              = try(each.value.ipv4_netmask, null)
  ipv4_start_ip             = try(each.value.ipv4_start_ip, null)
  ipv4_wins_server1         = try(each.value.ipv4_wins_server1, null)
  ipv4_wins_server2         = try(each.value.ipv4_wins_server2, null)
  ipv6_dns_server1          = try(each.value.ipv6_dns_server1, null)
  ipv6_dns_server2          = try(each.value.ipv6_dns_server2, null)
  ipv6_dns_server3          = try(each.value.ipv6_dns_server3, null)
  ipv6_end_ip               = try(each.value.ipv6_end_ip, null)
  ipv6_prefix               = try(each.value.ipv6_prefix, null)
  ipv6_start_ip             = try(each.value.ipv6_start_ip, null)
  keepalive                 = try(each.value.keepalive, null)
  keylife                   = try(each.value.keylife, null)
  local_gw                  = try(each.value.local_gw, null)
  local_gw6                 = try(each.value.local_gw6, null)
  localid_type              = try(each.value.localid_type, null)
  mesh_selector_type        = try(each.value.mesh_selector_type, null)
  mode                      = try(each.value.mode, null)
  mode_cfg                  = try(each.value.mode_cfg, null)
  monitor_hold_down_delay   = try(each.value.monitor_hold_down_delay, null)
  monitor_hold_down_time    = try(each.value.monitor_hold_down_time, null)
  monitor_hold_down_type    = try(each.value.monitor_hold_down_type, null)
  monitor_hold_down_weekday = try(each.value.monitor_hold_down_weekday, null)
  nattraversal              = try(each.value.nattraversal, null)
  negotiate_timeout         = try(each.value.negotiate_timeout, null)
  net_device                = try(each.value.net_device, null)
  passive_mode              = try(each.value.passive_mode, null)
  peertype                  = try(each.value.peertype, null)
  ppk                       = try(each.value.ppk, null)
  priority                  = try(each.value.priority, null)
  psksecret                 = try(each.value.psksecret, null)
  reauth                    = try(each.value.reauth, null)
  rekey                     = try(each.value.rekey, null)
  remote_gw6                = try(each.value.remote_gw6, null)
  rsa_signature_format      = try(each.value.rsa_signature_format, null)
  save_password             = try(each.value.save_password, null)
  send_cert_chain           = try(each.value.send_cert_chain, null)
  signature_hash_alg        = try(each.value.signature_hash_alg, null)
  suite_b                   = try(each.value.suite_b, null)
  tunnel_search             = try(each.value.tunnel_search, null)
  type                      = try(each.value.type, null)
  unity_support             = try(each.value.unity_support, null)
  wizard_type               = try(each.value.wizard_type, null)
  xauthtype                 = try(each.value.xauthtype, null)
}

resource "fortios_vpnipsec_phase2interface" "phase2" {
  for_each   = { for phase2 in local.phase2 : phase2.name => phase2 }
  depends_on = [fortios_vpnipsec_phase1interface.phase1]
  name       = each.value.name
  phase1name = each.value.phase1name
  proposal   = each.value.proposal
  vdomparam  = each.value.vdom

  add_route                = try(each.value.add_route, null)
  auto_discovery_forwarder = try(each.value.auto_discovery_forwarder, null)
  auto_discovery_sender    = try(each.value.auto_discovery_sender, null)
  auto_negotiate           = try(each.value.auto_negotiate, null)
  dhcp_ipsec               = try(each.value.dhcp_ipsec, null)
  dhgrp                    = try(each.value.dhgrp, null)
  dst_addr_type            = try(each.value.dst_addr_type, null)
  dst_end_ip6              = try(each.value.dst_end_ip6, null)
  dst_port                 = try(each.value.dst_port, null)
  dst_subnet               = try(each.value.dst_subnet, null)
  encapsulation            = try(each.value.encapsulation, null)
  keepalive                = try(each.value.keepalive, null)
  keylife_type             = try(each.value.keylife_type, null)
  keylifekbs               = try(each.value.keylifekbs, null)
  keylifeseconds           = try(each.value.keylifeseconds, null)
  l2tp                     = try(each.value.l2tp, null)
  pfs                      = try(each.value.pfs, null)
  protocol                 = try(each.value.protocol, null)
  replay                   = try(each.value.replay, null)
  route_overlap            = try(each.value.route_overlap, null)
  single_source            = try(each.value.single_source, null)
  src_addr_type            = try(each.value.src_addr_type, null)
  src_end_ip6              = try(each.value.src_end_ip6, null)
  src_port                 = try(each.value.src_port, null)
  src_subnet               = try(each.value.src_subnet, null)
}
