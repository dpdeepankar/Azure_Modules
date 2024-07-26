output "key_vault_id" {
  value = [
    for k,v in var.keyvault : azurerm_key_vault.this[k].id
  ]
}

output "key_vault_name" {
  value = [
    for k,v in var.keyvault : azurerm_key_vault.this[k].name
  ]
}