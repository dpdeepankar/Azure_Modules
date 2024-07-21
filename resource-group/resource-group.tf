resource "azurerm_resource_group" "rg" {
  for_each = var.resourcegroup  # iterating through the variable and enabling to create multiple resource group

  name = each.value.name  # Name of the resource group, changing this forces a new resource
  location = each.value.location  # Location of the resource group, changing this forces a new resource
  tags = coalesce(var.tags,{})
}