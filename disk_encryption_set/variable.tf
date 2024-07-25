variable "disk_encryption_set" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    identity_type       = optional(string)
    key_vault           = string
    key_vault_key       = string
    user_assigned_identity = string
  }))
}

variable "tags" {
  type = map(string)
}