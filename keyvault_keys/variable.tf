variable "keyvaultkey" {
  type = map(object({
    name = string
    key_vault_id = string
    key_type = optional(string)
    key_size = optional(number)
    curve = optional(string)
    key_opts = optional(list(string))
  }))
}