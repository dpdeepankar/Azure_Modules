resource "azurerm_private_endpoint" "this" {
  for_each = var.private_endpoint

  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  subnet_id = each.value.subnet_id
  tags = var.tags

  private_service_connection {
    name = each.value.private_service_connection.name
    private_connection_resource_id = each.value.private_connection_resource_id
    subresource_names = each.value.subresource_names
    is_manual_connection = false
  }
}