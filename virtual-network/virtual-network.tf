resource "azurerm_virtual_network" "vnet" {
  for_each = var.virtual_network  # this enables to create multiple virtual network. 

  name = each.value.name  # name of the virtual network, chaging this forces a new resource
  resource_group_name = each.value.resource_group_name  # resource group for the virtual network
  location = each.value.location  # location of the virtual network, changing this forces a new resource creation
  address_space = each.value.address_space  # address space of the virtual network, changing this will update the resource
  dns_servers = coalesce(each.value.dns_servers,[])

  encryption {
    enforcement = "AllowUnencrypted" #Specifies if the encrypted Virtual Network allows VM that does not support encryption. Possible values are DropUnencrypted and AllowUnencrypted.
  }

  # the below dynamic block will check for ddos_protection_plan id, if set then it will enable the ddos_protection block else will not.
  dynamic "ddos_protection_plan" {
    for_each = each.value.ddos_protection_plan_id != null ? [1]:[]
    content {
      id = each.value.ddos_protection_plan_id
      enable = true
    }
  }

  tags = coalesce(var.tags,{})
}