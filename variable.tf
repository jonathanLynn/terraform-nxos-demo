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
