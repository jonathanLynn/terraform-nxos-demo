variable "vrf_name" {
  type        = string
  description = "VRF name for the static route"
  default     = "VRF1"
}

variable "route_prefix" {
  type        = string
  description = "Route prefix for the static route"
  default     = "2.2.2.3/32"
}

variable "next_hop_address" {
  type        = string
  description = "Next hop address"
  default     = "1.2.3.4"
}

variable "next_hop_description" {
  type        = string
  description = "Description of the next hop"
  default     = "Route3"
}

variable "object" {
  type        = number
  description = "Object value for the static route"
  default     = 10
}

variable "preference" {
  type        = number
  description = "Preference value for the static route"
  default     = 10
}

variable "tag" {
  type        = number
  description = "Tag value for the static route"
  default     = 10
}

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
      description       = "Route1"
      object            = 10
      preference        = 10
      tag               = 10
    },
        {
      vrf_name          = "VRF1"
      prefix            = "2.2.2.4/32"
      next_hop_interface = "unspecified"
      next_hop_address  = "1.2.3.4"
      next_hop_vrf      = "VRF1"
      description       = "Route1"
      object            = 10
      preference        = 10
      tag               = 10
    },
        {
      vrf_name          = "VRF1"
      prefix            = "2.2.2.5/32"
      next_hop_interface = "unspecified"
      next_hop_address  = "1.2.3.4"
      next_hop_vrf      = "VRF1"
      description       = "Route1"
      object            = 10
      preference        = 10
      tag               = 10
    },
    # Add more route entries here as needed
  ]
}

