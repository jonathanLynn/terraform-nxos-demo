#VRF Variables
variable "vrfs" {
  type = list(object({
    name = string
  }))

  default = [
    {
      name = "VRF1"
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
    # Add more interface-to-IP mappings as needed
  ]
}
