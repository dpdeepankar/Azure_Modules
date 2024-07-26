resource "azurerm_disk_encryption_set" "this" {
  for_each = var.disk_encryption_set

  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  location                  = each.value.location
  key_vault_key_id          = each.value.key_vault_key_id
  auto_key_rotation_enabled = true
  identity {
    type = coalesce(each.value.identity_type, "SystemAssigned, UserAssigned")
    identity_ids = [each.value.user_assigned_identity_id]
  }
  tags = var.tags
}