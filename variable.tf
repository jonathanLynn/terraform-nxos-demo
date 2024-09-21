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

