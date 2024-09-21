variable "static_routes" {
  type = list(object({
    vrf_name     = string
    prefix       = string
    next_hop_interface = string
    next_hop_address   = string
    next_hop_vrf       = string
    description  = string
    object       = number
    preference   = number
    tag          = number
  }))
  
  default = [
    {
      vrf_name          = "VRF1"
      prefix            = "2.2.2.3/32"
      next_hop_interface = "unspecified"
      next_hop_address  = "1.2.3.4"
      next_hop_vrf      = "VRF1"
      description       = "Route3"
      object            = 12
      preference        = 10
      tag               = 10
    },
        {
      vrf_name          = "VRF1"
      prefix            = "2.2.2.4/32"
      next_hop_interface = "unspecified"
      next_hop_address  = "10.10.10.10"
      next_hop_vrf      = "VRF1"
      description       = "Route4"
      object            = 13
      preference        = 10
      tag               = 10
    },
        {
      vrf_name          = "VRF1"
      prefix            = "2.2.2.5/32"
      next_hop_interface = "unspecified"
      next_hop_address  = "10.10.10.10"
      next_hop_vrf      = "VRF1"
      description       = "Route5"
      object            = 14
      preference        = 10
      tag               = 10
    },
    # Add more route entries here as needed
  ]
}

