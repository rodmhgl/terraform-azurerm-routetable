variable "routes" {
  type = map(object({
    name                   = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = optional(string, null)
  }))
}

variable "disable_bgp_route_propagation" {
  description = "Boolean flag which controls propagation of routes learned by BGP on that route table. Changing this forces a new resource to be created."
  type        = bool
  default     = false
}

variable "location" {
  description = "The location/region where the route table is created. Changing this forces a new resource to be created."
  type        = string
}

variable "name" {
  description = "The name of the route table. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the route table. Changing this forces a new resource to be created."
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}
