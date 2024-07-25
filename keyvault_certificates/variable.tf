variable "kv-cert" {
  type = map(object({
    name = string
    key_vault_id = string
  }))
}