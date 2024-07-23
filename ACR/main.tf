resource "azurerm_container_registry" "this" {
  for_each = var.registry

  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  sku = coalesce(each.value.sku,"Standard")
  admin_enabled = false
  public_network_access_enabled = coalesce(each.value.public_network_access_enabled,"true")
  zone_redundancy_enabled = coalesce(each.value.zone_redundancy_enabled,"false")
  anonymous_pull_enabled = false


  dynamic "georeplications" {
    for_each = each.value.georeplications != null ? [1]:[]

    content {
      location = each.value.target_location
      regional_endpoint_enabled = false
      zone_redundancy_enabled = coalesce(each.value.target_zone_redundancy_enabled,false)
      tags = var.tags
    }
  }

}