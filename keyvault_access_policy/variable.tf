variable "keyvaultaccesspolicy" {
  type = map(object({
    key_vault_id = string
    tenant_id    = string
    object_id    = string

    certificate_permissions = list(string)
    key_permissions         = list(string)
    secret_permissions      = list(string)
  }))

}