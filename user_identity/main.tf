resource "azurerm_user_assigned_identity" "this" {
  for_each = var.useridentity

  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  tags = var.tags
}