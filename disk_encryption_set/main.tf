data "azurerm_key_vault" "this" {
  for_each = var.disk_encryption_set

  name                = each.value.key_vault
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_key" "this" {
  for_each = var.disk_encryption_set

  name         = each.value.key_vault_key
  key_vault_id = data.azurerm_key_vault.this.id
}

resource "azurerm_disk_encryption_set" "this" {
  for_each = var.disk_encryption_set

  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  location                  = each.value.location
  key_vault_key_id          = data.azurerm_key_vault_key.this.versionless_id
  auto_key_rotation_enabled = true
  identity {
    type = coalesce(each.value.identity_type, "SystemAssigned, UserAssigned")
  }
  tags = var.tags
}