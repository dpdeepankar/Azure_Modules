variable "tags" {
  type = map(string)
}

variable "registry" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    sku = optional(string)
    public_network_access_enabled = optional(bool)
    zone_redundancy_enabled = optional(bool)
    georeplications = optional(object({
        target_location = string
        target_zone_redundancy_enabled = string
    }))
  }))
}