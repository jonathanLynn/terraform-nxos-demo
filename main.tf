terraform {
  required_providers {
    nxos = {
      source = "CiscoDevNet/nxos"
      version = "0.5.1"
    }
  }
}

provider "nxos" {
  username = "admin"
  password = "Admin_1234!"
  url      = "https://sbx-nxos-mgmt.cisco.com"
}


#This Builds out the IPv4 VRF Tenant ready for all L3 Interfaces
    resource "nxos_ipv4_vrf" "VRF1" {
    name = "VRF1"
    }
    
    resource "nxos_vrf" "VRF1" {
    name        = "VRF1"
    description = "My VRF1 Description"
    encap       = "unknown"

    depends_on = [nxos_ipv4_vrf.VRF1]
    }

#Interface Configuration
    resource "nxos_svi_interface" "vlan300" {
    interface_id = "vlan300"
    admin_state  = "up"
    bandwidth    = 1000
    delay        = 10
    description  = "My Description"
    medium       = "bcast"
    mtu          = 9216
    }

#Interface IPv4 Configuration
    resource "nxos_ipv4_interface" "vlan300" {
    vrf          = "VRF1"
    interface_id = "vlan300"
    drop_glean   = "disabled"
    forward      = "enabled"
    unnumbered   = "unspecified"
    urpf         = "disabled"
    }

    resource "nxos_ipv4_interface_address" "vlan300" {
    vrf          = "VRF1"
    interface_id = "vlan300"
    address      = "10.100.11.1/24"
    type         = "primary"
    }

#Interface to VRF Mapping
    resource "nxos_svi_interface_vrf" "vlan300" {
    interface_id = "vlan300"
    vrf_dn       = "sys/inst-VRF1"
    }

#Create Vlan500
    resource "nxos_bridge_domain" "VLAN500" {
    fabric_encap = "vlan-500"
    access_encap = "unknown"
    name         = "VLAN500"
}

#Create Vlan501
    resource "nxos_bridge_domain" "VLAN501" {
    fabric_encap = "vlan-501"
    access_encap = "unknown"
    name         = "VLAN501"
}

resource "nxos_physical_interface" "Interface_Eth1_15" {
  interface_id             = "eth1/15"
  fec_mode                 = "auto"
  access_vlan              = "unknown"
  admin_state              = "up"
  auto_negotiation         = "on"
  #bandwidth                = 1000
  #delay                    = 10
  description              = "My Description"
  duplex                   = "auto"
  layer                    = "Layer2"
  link_logging             = "enable"
  #link_debounce_down       = 200
  #link_debounce_up         = 0
  medium                   = "broadcast"
  mode                     = "trunk"
  mtu                      = 1500
  #native_vlan              = "1"
  speed                    = "auto"
  speed_group              = "auto"
  trunk_vlans              = "500-501,503-505"
  #uni_directional_ethernet = "disable"
  user_configured_flags    = "admin_layer,admin_mtu,admin_state"
}

resource "nxos_physical_interface" "Interface_Eth1_16" {
  interface_id             = "eth1/16"
  fec_mode                 = "auto"
  access_vlan              = "unknown"
  admin_state              = "up"
  auto_negotiation         = "on"
  #bandwidth                = 1000
  #delay                    = 10
  description              = "My Description"
  duplex                   = "auto"
  layer                    = "Layer2"
  link_logging             = "enable"
  #link_debounce_down       = 200
  #link_debounce_up         = 0
  medium                   = "broadcast"
  mode                     = "trunk"
  mtu                      = 1500
  #native_vlan              = "1"
  speed                    = "auto"
  speed_group              = "auto"
  trunk_vlans              = "500-501,503-505"
  #uni_directional_ethernet = "disable"
  user_configured_flags    = "admin_layer,admin_mtu,admin_state"
}

#Create a Port-Channel
    resource "nxos_port_channel_interface" "Port-Channel1" {
    interface_id          = "po1"
    port_channel_mode     = "active"
    #minimum_links         = 2
    #maximum_links         = 10
    #suspend_individual    = "disable"
    #access_vlan           = "vlan-1"
    admin_state           = "up"
    auto_negotiation      = "on"
    bandwidth             = 0
    delay                 = 1
    description           = "My Description"
    duplex                = "auto"
    layer                 = "Layer2"
    link_logging          = "enable"
    medium                = "broadcast"
    mode                  = "trunk"
    mtu                   = 1500
    #native_vlan           = "1"
    speed                 = "auto"
    trunk_vlans           = "500-501,503-505"
    user_configured_flags = "admin_layer,admin_mtu,admin_state"
}

#vPC Configuration
    resource "nxos_vpc_instance" "example" {
    admin_state = "enabled"
    }

    resource "nxos_vpc_domain" "example" {
    admin_state                    = "enabled"
    domain_id                      = 100
    auto_recovery                  = "enabled"
    auto_recovery_interval         = 480
    delay_restore_orphan_port      = 10
    delay_restore_svi              = 20
    delay_restore_vpc              = 60
    dscp                           = 0
    fast_convergence               = "enabled"
    graceful_consistency_check     = "disabled"
    l3_peer_router                 = "enabled"
    l3_peer_router_syslog          = "enabled"
    l3_peer_router_syslog_interval = 3000
    peer_gateway                   = "enabled"
    peer_ip                        = "1.2.3.4"
    peer_switch                    = "enabled"
    role_priority                  = 100
    sys_mac                        = "01:01:01:01:01:01"
    system_priority                = 100
    track                          = 10
    virtual_ip                     = "1.1.1.1"
    }

#Add vPC Tag to Port-Channel
    resource "nxos_vpc_interface" "VPC1" {
    vpc_interface_id          = 1
    port_channel_interface_dn = "sys/intf/aggr-[po1]"
    }

#Add Interface to Port-Channel
resource "nxos_port_channel_interface_member" "Po1_Eth1_15" {
  interface_id = "po1"
  interface_dn = "sys/intf/phys-[eth1/15]"
  #force        = false
}

#Add Interface to Port-Channel
resource "nxos_port_channel_interface_member" "Po1_Eth1_16" {
  interface_id = "po1"
  interface_dn = "sys/intf/phys-[eth1/16]"
  #force        = false
}

#Add Static Route
    resource "nxos_ipv4_static_route" "StaticRoute1" {
    vrf_name = "VRF1"
    prefix   = "2.2.2.2/32"
    next_hops = [{
        interface_id = "unspecified"
        address      = "1.2.3.4"
        vrf_name     = "VRF1"
        description  = "Route1"
        object       = 10
        preference   = 10
        tag          = 10
    }]
    }