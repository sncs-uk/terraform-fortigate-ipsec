/**
 * # Fortigate IPsec configuration
 *
 * This terraform module configures IPsec tunnels on a FortiGate firewall
 */
terraform {
  required_version = ">= 1.11.0"
  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
      version = ">= 1.22.0"
    }
  }
}

resource "fortios_vpnipsec_phase1interface" "phase1" {
  for_each                          = { for phase1 in var.phase1interface : phase1.name => phase1 }
  name                              = each.value.name
  type                              = each.value.type
  interface                         = each.value.interface
  ip_version                        = each.value.ip_version
  ike_version                       = each.value.ike_version
  local_gw                          = each.value.local_gw
  local_gw6                         = each.value.local_gw6
  remote_gw                         = each.value.remote_gw
  remote_gw6                        = each.value.remote_gw6
  remotegw_ddns                     = each.value.remotegw_ddns
  keylife                           = each.value.keylife
  authmethod                        = each.value.authmethod
  authmethod_remote                 = each.value.authmethod_remote
  mode                              = each.value.mode
  peertype                          = each.value.peertype
  peerid                            = each.value.peerid
  default_gw                        = each.value.default_gw
  default_gw_priority               = each.value.default_gw_priority
  usrgrp                            = each.value.usrgrp
  peer                              = each.value.peer
  peergrp                           = each.value.peergrp
  monitor                           = each.value.monitor
  monitor_min                       = each.value.monitor_min
  monitor_hold_down_type            = each.value.monitor_hold_down_type
  monitor_hold_down_delay           = each.value.monitor_hold_down_delay
  monitor_hold_down_weekday         = each.value.monitor_hold_down_weekday
  monitor_hold_down_time            = each.value.monitor_hold_down_time
  net_device                        = each.value.net_device
  tunnel_search                     = each.value.tunnel_search
  passive_mode                      = each.value.passive_mode
  exchange_interface_ip             = each.value.exchange_interface_ip
  exchange_ip_addr4                 = each.value.exchange_ip_addr4
  exchange_ip_addr6                 = each.value.exchange_ip_addr6
  aggregate_member                  = each.value.aggregate_member
  aggregate_weight                  = each.value.aggregate_weight
  packet_redistribution             = each.value.packet_redistribution
  peer_egress_shaping               = each.value.peer_egress_shaping
  peer_egress_shaping_value         = each.value.peer_egress_shaping_value
  multipath                         = each.value.multipath
  mode_cfg                          = each.value.mode_cfg
  mode_cfg_allow_client_selector    = each.value.mode_cfg_allow_client_selector
  assign_ip                         = each.value.assign_ip
  assign_ip_from                    = each.value.assign_ip_from
  ipv4_start_ip                     = each.value.ipv4_start_ip
  ipv4_end_ip                       = each.value.ipv4_end_ip
  ipv4_netmask                      = each.value.ipv4_netmask
  dhcp_ra_giaddr                    = each.value.dhcp_ra_giaddr
  dhcp6_ra_linkaddr                 = each.value.dhcp6_ra_linkaddr
  dns_mode                          = each.value.dns_mode
  ipv4_dns_server1                  = each.value.ipv4_dns_server1
  ipv4_dns_server2                  = each.value.ipv4_dns_server2
  ipv4_dns_server3                  = each.value.ipv4_dns_server3
  ipv4_wins_server1                 = each.value.ipv4_wins_server1
  ipv4_wins_server2                 = each.value.ipv4_wins_server2
  ipv4_split_include                = each.value.ipv4_split_include
  split_include_service             = each.value.split_include_service
  ipv4_name                         = each.value.ipv4_name
  ipv6_start_ip                     = each.value.ipv6_start_ip
  ipv6_end_ip                       = each.value.ipv6_end_ip
  ipv6_prefix                       = each.value.ipv6_prefix
  ipv6_dns_server1                  = each.value.ipv6_dns_server1
  ipv6_dns_server2                  = each.value.ipv6_dns_server2
  ipv6_dns_server3                  = each.value.ipv6_dns_server3
  ipv6_split_include                = each.value.ipv6_split_include
  ipv6_name                         = each.value.ipv6_name
  ip_delay_interval                 = each.value.ip_delay_interval
  unity_support                     = each.value.unity_support
  domain                            = each.value.domain
  banner                            = each.value.banner
  include_local_lan                 = each.value.include_local_lan
  ipv4_split_exclude                = each.value.ipv4_split_exclude
  ipv6_split_exclude                = each.value.ipv6_split_exclude
  save_password                     = each.value.save_password
  client_auto_negotiate             = each.value.client_auto_negotiate
  client_keep_alive                 = each.value.client_keep_alive
  proposal                          = each.value.proposal
  add_route                         = each.value.add_route
  add_gw_route                      = each.value.add_gw_route
  psksecret                         = each.value.psksecret
  psksecret_remote                  = each.value.psksecret_remote
  keepalive                         = each.value.keepalive
  distance                          = each.value.distance
  priority                          = each.value.priority
  localid                           = each.value.localid
  localid_type                      = each.value.localid_type
  auto_negotiate                    = each.value.auto_negotiate
  negotiate_timeout                 = each.value.negotiate_timeout
  fragmentation                     = each.value.fragmentation
  ip_fragmentation                  = each.value.ip_fragmentation
  dpd                               = each.value.dpd
  dpd_retrycount                    = each.value.dpd_retrycount
  dpd_retryinterval                 = each.value.dpd_retryinterval
  forticlient_enforcement           = each.value.forticlient_enforcement
  comments                          = each.value.comments
  npu_offload                       = each.value.npu_offload
  send_cert_chain                   = each.value.send_cert_chain
  dhgrp                             = each.value.dhgrp
  addke1                            = each.value.addke1
  addke2                            = each.value.addke2
  addke3                            = each.value.addke3
  addke4                            = each.value.addke4
  addke5                            = each.value.addke5
  addke6                            = each.value.addke6
  addke7                            = each.value.addke7
  suite_b                           = each.value.suite_b
  eap                               = each.value.eap
  eap_identity                      = each.value.eap_identity
  eap_exclude_peergrp               = each.value.eap_exclude_peergrp
  eap_cert_auth                     = each.value.eap_cert_auth
  acct_verify                       = each.value.acct_verify
  ppk                               = each.value.ppk
  ppk_secret                        = each.value.ppk_secret
  ppk_identity                      = each.value.ppk_identity
  wizard_type                       = each.value.wizard_type
  xauthtype                         = each.value.xauthtype
  reauth                            = each.value.reauth
  authusr                           = each.value.authusr
  authpasswd                        = each.value.authpasswd
  group_authentication              = each.value.group_authentication
  group_authentication_secret       = each.value.group_authentication_secret
  authusrgrp                        = each.value.authusrgrp
  mesh_selector_type                = each.value.mesh_selector_type
  idle_timeout                      = each.value.idle_timeout
  shared_idle_timeout               = each.value.shared_idle_timeout
  idle_timeoutinterval              = each.value.idle_timeoutinterval
  ha_sync_esp_seqno                 = each.value.ha_sync_esp_seqno
  fgsp_sync                         = each.value.fgsp_sync
  inbound_dscp_copy                 = each.value.inbound_dscp_copy
  auto_discovery_sender             = each.value.auto_discovery_sender
  auto_discovery_receiver           = each.value.auto_discovery_receiver
  auto_discovery_forwarder          = each.value.auto_discovery_forwarder
  auto_discovery_psk                = each.value.auto_discovery_psk
  auto_discovery_shortcuts          = each.value.auto_discovery_shortcuts
  auto_discovery_crossover          = each.value.auto_discovery_crossover
  auto_discovery_offer_interval     = each.value.auto_discovery_offer_interval
  auto_discovery_dialup_placeholder = each.value.auto_discovery_dialup_placeholder
  encapsulation                     = each.value.encapsulation
  encapsulation_address             = each.value.encapsulation_address
  encap_local_gw4                   = each.value.encap_local_gw4
  encap_local_gw6                   = each.value.encap_local_gw6
  encap_remote_gw4                  = each.value.encap_remote_gw4
  encap_remote_gw6                  = each.value.encap_remote_gw6
  vni                               = each.value.vni
  nattraversal                      = each.value.nattraversal
  esn                               = each.value.esn
  fragmentation_mtu                 = each.value.fragmentation_mtu
  childless_ike                     = each.value.childless_ike
  azure_ad_autoconnect              = each.value.azure_ad_autoconnect
  client_resume                     = each.value.client_resume
  client_resume_interval            = each.value.client_resume_interval
  rekey                             = each.value.rekey
  digital_signature_auth            = each.value.digital_signature_auth
  signature_hash_alg                = each.value.signature_hash_alg
  rsa_signature_format              = each.value.rsa_signature_format
  rsa_signature_hash_override       = each.value.rsa_signature_hash_override
  enforce_unique_id                 = each.value.enforce_unique_id
  cert_id_validation                = each.value.cert_id_validation
  fec_egress                        = each.value.fec_egress
  fec_separate_redundant_tunnel     = each.value.fec_separate_redundant_tunnel
  fec_send_timeout                  = each.value.fec_send_timeout
  fec_base                          = each.value.fec_base
  fec_codec_string                  = each.value.fec_codec_string
  fec_codec                         = each.value.fec_codec
  fec_redundant                     = each.value.fec_redundant
  fec_ingress                       = each.value.fec_ingress
  fec_receive_timeout               = each.value.fec_receive_timeout
  fec_health_check                  = each.value.fec_health_check
  fec_mapping_profile               = each.value.fec_mapping_profile
  network_overlay                   = each.value.network_overlay
  network_id                        = each.value.network_id
  dev_id_notification               = each.value.dev_id_notification
  dev_id                            = each.value.dev_id
  loopback_asymroute                = each.value.loopback_asymroute
  link_cost                         = each.value.link_cost
  kms                               = each.value.kms
  exchange_fgt_device_id            = each.value.exchange_fgt_device_id
  ipv6_auto_linklocal               = each.value.ipv6_auto_linklocal
  ems_sn_check                      = each.value.ems_sn_check
  remote_gw_match                   = each.value.remote_gw_match
  remote_gw_subnet                  = each.value.remote_gw_subnet
  remote_gw_start_ip                = each.value.remote_gw_start_ip
  remote_gw_end_ip                  = each.value.remote_gw_end_ip
  remote_gw_country                 = each.value.remote_gw_country
  remote_gw6_match                  = each.value.remote_gw6_match
  remote_gw6_subnet                 = each.value.remote_gw6_subnet
  remote_gw6_start_ip               = each.value.remote_gw6_start_ip
  remote_gw6_end_ip                 = each.value.remote_gw6_end_ip
  remote_gw6_country                = each.value.remote_gw6_country
  cert_peer_username_validation     = each.value.cert_peer_username_validation
  cert_peer_username_strip          = each.value.cert_peer_username_strip
  ztna_cert_scim_authorization      = each.value.ztna_cert_scim_authorization
  cert_trust_store                  = each.value.cert_trust_store
  qkd                               = each.value.qkd
  qkd_hybrid                        = each.value.qkd_hybrid
  qkd_profile                       = each.value.qkd_profile
  transport                         = each.value.transport
  fortinet_esp                      = each.value.fortinet_esp
  auto_transport_threshold          = each.value.auto_transport_threshold
  fallback_tcp_threshold            = each.value.fallback_tcp_threshold
  dynamic_sort_subtable             = each.value.dynamic_sort_subtable
  get_all_tables                    = each.value.get_all_tables
  vdomparam                         = each.value.vdomparam
  update_if_exist                   = each.value.update_if_exist

  dynamic "certificate" {
    for_each = [for certificate in each.value.certificate : certificate]
    content {
      name = certificate.value
    }
  }

  dynamic "internal_domain_list" {
    for_each = [for domain_list in each.value.internal_domain_list : domain_list]
    content {
      domain_name = internal_domain_list.value
    }
  }

  dynamic "dns_suffix_search" {
    for_each = [for suffix in each.value.dns_suffix_search : suffix]
    content {
      dns_suffix = dns_suffix_search.value
    }
  }

  dynamic "ipv4_exclude_range" {
    for_each = [for exclude_range in each.value.ipv4_exclude_range : exclude_range]
    content {
      id       = ipv4_exclude_range.value.id
      start_ip = ipv4_exclude_range.value.start_ip
      end_ip   = ipv4_exclude_range.value.end_ip
    }
  }

  dynamic "ipv6_exclude_range" {
    for_each = [for exclude_range in each.value.ipv6_exclude_range : exclude_range]
    content {
      id       = ipv6_exclude_range.value.id
      start_ip = ipv6_exclude_range.value.start_ip
      end_ip   = ipv6_exclude_range.value.end_ip
    }
  }

  dynamic "backup_gateway" {
    for_each = [for gateway in each.value.backup_gateway : gateway]
    content {
      address = backup_gateway.value
    }
  }

  dynamic "remote_gw_ztna_tags" {
    for_each = [for tag in each.value.remote_gw_ztna_tags : tag]
    content {
      name = remote_gw_ztna_tags.value
    }
  }
}

resource "fortios_vpnipsec_phase2interface" "phase2" {
  for_each   = { for phase2 in var.phase2interface : phase2.name => phase2 }
  depends_on = [fortios_vpnipsec_phase1interface.phase1]

  name                     = each.value.name
  phase1name               = each.value.phase1name
  dhcp_ipsec               = each.value.dhcp_ipsec
  proposal                 = each.value.proposal
  pfs                      = each.value.pfs
  ipv4_df                  = each.value.ipv4_df
  dhgrp                    = each.value.dhgrp
  addke1                   = each.value.addke1
  addke2                   = each.value.addke2
  addke3                   = each.value.addke3
  addke4                   = each.value.addke4
  addke5                   = each.value.addke5
  addke6                   = each.value.addke6
  addke7                   = each.value.addke7
  replay                   = each.value.replay
  keepalive                = each.value.keepalive
  auto_negotiate           = each.value.auto_negotiate
  add_route                = each.value.add_route
  inbound_dscp_copy        = each.value.inbound_dscp_copy
  auto_discovery_sender    = each.value.auto_discovery_sender
  auto_discovery_forwarder = each.value.auto_discovery_forwarder
  keylifeseconds           = each.value.keylifeseconds
  keylifekbs               = each.value.keylifekbs
  keylife_type             = each.value.keylife_type
  single_source            = each.value.single_source
  route_overlap            = each.value.route_overlap
  encapsulation            = each.value.encapsulation
  l2tp                     = each.value.l2tp
  comments                 = each.value.comments
  initiator_ts_narrow      = each.value.initiator_ts_narrow
  diffserv                 = each.value.diffserv
  diffservcode             = each.value.diffservcode
  protocol                 = each.value.protocol
  src_name                 = each.value.src_name
  src_name6                = each.value.src_name6
  src_addr_type            = each.value.src_addr_type
  src_start_ip             = each.value.src_start_ip
  src_start_ip6            = each.value.src_start_ip6
  src_end_ip               = each.value.src_end_ip
  src_end_ip6              = each.value.src_end_ip6
  src_subnet               = each.value.src_subnet
  src_subnet6              = each.value.src_subnet6
  src_port                 = each.value.src_port
  dst_name                 = each.value.dst_name
  dst_name6                = each.value.dst_name6
  dst_addr_type            = each.value.dst_addr_type
  dst_start_ip             = each.value.dst_start_ip
  dst_start_ip6            = each.value.dst_start_ip6
  dst_end_ip               = each.value.dst_end_ip
  dst_end_ip6              = each.value.dst_end_ip6
  dst_subnet               = each.value.dst_subnet
  dst_subnet6              = each.value.dst_subnet6
  dst_port                 = each.value.dst_port
  vdomparam                = each.value.vdomparam
  update_if_exist          = each.value.update_if_exist

}
