output "key_vault_key_id" {
  value = [
    for k,v in var.keyvaultkey : azurerm_key_vault_key.kv-key[k].versionless_id
  ]
}

