resource "azurerm_subnet" "snet" {
  for_each = var.subnets

  name = each.value.name  # name of the subnet, changing this forces a new resource
  virtual_network_name = each.value.virtual_network_name  # name of the virtual network that the subnet belongs to. Changing this forces a new resource.
  address_prefixes = each.value.address_prefixes  # address space of the subnet. 
  resource_group_name = each.value.resource_group_name # name of the resource group.
  service_endpoints = coalesce(each.value.service_endpoints,[])
  private_endpoint_network_policies = coalesce(each.value.private_endpoint_network_policies, "Disabled")
  private_link_service_network_policies_enabled = coalesce(each.value.private_link_service_network_policies_enabled, "true")

  dynamic "delegation" {
    for_each = each.value.delegation != null ? [1] : []
    content {
      name = each.key
      service_delegation {
        name = each.value.name
      }
    }
    
  }

}