variable "disk_encryption_set" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    identity_type       = optional(string)
    key_vault_key_id       = string
    user_assigned_identity_id = string
  }))
}

variable "tags" {
  type = map(string)
}