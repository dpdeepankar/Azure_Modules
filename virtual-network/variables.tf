variable "virtual_network" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    address_space = list(string)
    dns_servers = optional(list(string))
    ddos_protection_plan_id = optional(string)
  }))
}

variable "tags" {
  type = map(string)
}