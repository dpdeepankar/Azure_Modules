data "azurerm_client_config" "current" {
  
}

resource "random_pet" "this" {
  length = 6
}

resource "azurerm_key_vault" "kv" {
  for_each = var.keyvault

  name = "${random_pet.this.id}-${each.value.name}-kv"  
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  sku_name = coalesce(each.value.sku,"premium")
  tenant_id = data.azurerm_client_config.current.tenant_id
  enabled_for_deployment = coalesce(each.value.enabled_for_deployment, true)
  enabled_for_disk_encryption = coalesce(each.value.enabled_for_disk_encryption, true)
  enable_rbac_authorization = coalesce(each.value.enable_rbac_authorization, false)
  purge_protection_enabled = coalesce(each.value.purge_protection_enabled, false)
  public_network_access_enabled = coalesce(each.value.public_network_access_enabled, true)
  soft_delete_retention_days = coalesce(each.value.soft_delete_retention_days,7)
  tags = var.tags

  # assigning access to key vault for Service Principal used for deployment
  access_policy = [{
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    application_id = data.azurerm_client_config.current.client_id

    certificate_permissions = ["Backup","Create","Delete","DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"]
    key_permissions = ["Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Rotate", "GetRotationPolicy", "SetRotationPolicy"]
    secret_permissions = ["Backup","Delete","Get","List","Purge","Recover","Restore","Set"]
    storage_permissions = ["Backup","Delete","DeleteSAS","Get","GetSAS","List","ListSAS","Purge","Recover","Restore","Set","Update"]
}]
}