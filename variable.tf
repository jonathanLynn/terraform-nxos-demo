#VRF Variables
variable "vrfs" {
  type = list(object({
    name = string
  }))

  default = [
    {
      name = "VRF1"
    },
    {
      name = "VRF2"
    },
    {
      name = "VRF3"
    },
    # Add more VRFs as needed
  ]
}

#Create the VRFs
variable "define-vrfs" {
  type = list(object({
    name = string
    description = string
    encap = string
  }))

  default = [
    {
      name        = "VRF1"
      description = "My VRF1 Description"
      encap       = "unknown"
    },
    {
      name        = "VRF2"
      description = "VRF2 - Accouting"
      encap       = "unknown"
    },
    {
      name        = "VRF3"
      description = "VRF3 - Human Resources"
      encap       = "unknown"
    },
    # Add more VRFs as needed
  ]
}


#Static Routes for VRF1
variable "static_routes" {
  type = list(object({
    vrf_name     = string
    prefix       = string
    next_hop_interface = string
    next_hop_address   = string
    next_hop_vrf       = string
  }))
  
  default = [
    {
      vrf_name          = "VRF1"
      prefix            = "2.2.2.3/32"
      next_hop_interface = "unspecified"
      next_hop_address  = "1.2.3.4"
      next_hop_vrf      = "VRF1"
    },
    {
      vrf_name          = "VRF1"
      prefix            = "2.2.2.4/32"
      next_hop_interface = "unspecified"
      next_hop_address  = "10.10.10.10"
      next_hop_vrf      = "VRF1"
    },
    {
      vrf_name          = "VRF1"
      prefix            = "2.2.2.5/32"
      next_hop_interface = "unspecified"
      next_hop_address  = "10.10.10.10"
      next_hop_vrf      = "VRF1"
    },
    {
      vrf_name          = "VRF1"
      prefix            = "2.2.2.6/32"
      next_hop_interface = "unspecified"
      next_hop_address  = "10.10.10.10"
      next_hop_vrf      = "VRF1"
    },
    {
      vrf_name          = "VRF2"
      prefix            = "2.2.2.8/32"
      next_hop_interface = "unspecified"
      next_hop_address  = "10.10.10.10"
      next_hop_vrf      = "VRF2"
    },
    {
      vrf_name          = "VRF3"
      prefix            = "2.2.2.7/32"
      next_hop_interface = "unspecified"
      next_hop_address  = "10.10.10.10"
      next_hop_vrf      = "VRF3"
    },
    # Add more route entries here as needed
  ]
}

#SVI Interfaces
variable "svi_interfaces" {
  type = list(object({
    interface_id = string
    admin_state  = string
    description  = string
  }))

  default = [
    {
      interface_id = "vlan400"
      admin_state  = "up"
      description  = "My Description"
    },
    {
      interface_id = "vlan401"
      admin_state  = "up"
      description  = "My Description"
    },
    {
      interface_id = "vlan402"
      admin_state  = "up"
      description  = "My Description"
    },
    {
      interface_id = "vlan403"
      admin_state  = "up"
      description  = "My Description"
    },
    {
      interface_id = "vlan404"
      admin_state  = "up"
      description  = "My Description"
    },
    {
      interface_id = "vlan405"
      admin_state  = "up"
      description  = "My Description"
    },
    {
      interface_id = "vlan300"
      admin_state  = "up"
      description  = "Accouting TEAM A"
    },
    {
      interface_id = "vlan301"
      admin_state  = "up"
      description  = "Accouting TEAM B"
    },
        {
      interface_id = "vlan310"
      admin_state  = "up"
      description  = "Human Resources TEAM A"
    },
    {
      interface_id = "vlan311"
      admin_state  = "up"
      description  = "Human Resources TEAM B"
    },
    # Add more VLAN interfaces as needed
  ]
}

variable "svi_interface_vrfs" {
  type = list(object({
    interface_id = string
    vrf_dn       = string
  }))

  default = [
    {
      interface_id = "vlan400"
      vrf_dn       = "sys/inst-VRF1"
    },
    {
      interface_id = "vlan401"
      vrf_dn       = "sys/inst-VRF1"
    },
    {
      interface_id = "vlan402"
      vrf_dn       = "sys/inst-VRF1"
    },
    {
      interface_id = "vlan403"
      vrf_dn       = "sys/inst-VRF1"
    },
    {
      interface_id = "vlan404"
      vrf_dn       = "sys/inst-VRF1"
    },
    {
      interface_id = "vlan405"
      vrf_dn       = "sys/inst-VRF1"
    },
    {
      interface_id = "vlan300"
      vrf_dn       = "sys/inst-VRF2"
    },
    {
      interface_id = "vlan301"
      vrf_dn       = "sys/inst-VRF2"
    },
    {
      interface_id = "vlan310"
      vrf_dn       = "sys/inst-VRF3"
    },
    {
      interface_id = "vlan311"
      vrf_dn       = "sys/inst-VRF3"
    },
    # Add more interface-to-VRF mappings as needed
  ]
}

variable "ipv4_interfaces" {
  type = list(object({
    interface_id = string
    vrf          = string
  }))

  default = [
    {
      interface_id = "vlan400"
      vrf          = "VRF1"
    },
    {
      interface_id = "vlan401"
      vrf          = "VRF1"
    },
    {
      interface_id = "vlan402"
      vrf          = "VRF1"
    },
    {
      interface_id = "vlan403"
      vrf          = "VRF1"
    },
    {
      interface_id = "vlan404"
      vrf          = "VRF1"
    },
    {
      interface_id = "vlan405"
      vrf          = "VRF1"
    },
    {
      interface_id = "vlan300"
      vrf          = "VRF2"
    },
    {
      interface_id = "vlan301"
      vrf          = "VRF2"
    },
    {
      interface_id = "vlan310"
      vrf          = "VRF3"
    },
    {
      interface_id = "vlan311"
      vrf          = "VRF3"
    },
    # Add more interface-to-VRF mappings as needed
  ]
}

variable "ipv4_interface_addresses" {
  type = list(object({
    interface_id = string
    vrf          = string
    address      = string
  }))

  default = [
    {
      interface_id = "vlan400"
      vrf          = "VRF1"
      address      = "10.100.11.1/24"
    },
    {
      interface_id = "vlan401"
      vrf          = "VRF1"
      address      = "10.100.12.1/24"
    },
    {
      interface_id = "vlan402"
      vrf          = "VRF1"
      address      = "10.100.13.1/24"
    },
    {
      interface_id = "vlan403"
      vrf          = "VRF1"
      address      = "10.100.14.1/24"
    },
    {
      interface_id = "vlan404"
      vrf          = "VRF1"
      address      = "10.100.15.1/24"
    },
    {
      interface_id = "vlan405"
      vrf          = "VRF1"
      address      = "10.100.16.1/24"
    },
    {
      interface_id = "vlan300"
      vrf          = "VRF2"
      address      = "10.15.1.1/24"
    },
    {
      interface_id = "vlan301"
      vrf          = "VRF2"
      address      = "10.15.2.1/24"
    },
    {
      interface_id = "vlan310"
      vrf          = "VRF3"
      address      = "10.16.1.1/24"
    },
    {
      interface_id = "vlan311"
      vrf          = "VRF3"
      address      = "10.16.2.1/24"
    },
    # Add more interface-to-IP mappings as needed
  ]
}
