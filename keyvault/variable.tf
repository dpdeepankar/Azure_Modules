variable "keyvault" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    sku = string
    enabled_for_deployment = optional(bool)
    enable_rbac_authorization = optional(bool)
    enabled_for_disk_encryption = optional(bool)
    public_network_access_enabled = optional(bool)
    purge_protection_enabled = optional(bool)
    soft_delete_retention_days = optional(number)
  }))
}

variable "tags" {
  type = map(string)
}