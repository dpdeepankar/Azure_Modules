resource "azurerm_private_dns_zone" "this" {
  for_each = var.privatednszone

  name = each.value.name
  resource_group_name = each.value.resource_group_name
  tags = var.tags
  
}