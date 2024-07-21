resource "azurerm_kubernetes_cluster" "aks" {
  for_each = var.aks_cluster

  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  dns_prefix = "cluster"
  #dns_prefix_private_cluster = "newlcuster"
  azure_policy_enabled = false
  #disk_encryption_set_id = each.value.disk_encryption_set_id
  kubernetes_version = each.value.kubernetes_version
  node_resource_group = "${each.value.name}-nodepool"
  private_cluster_enabled = each.value.private_cluster_enabled
  private_dns_zone_id = "System"
  oidc_issuer_enabled = each.value.oidc_issuer_enabled
  workload_identity_enabled = each.value.workload_identity_enabled
  run_command_enabled = true
  

  default_node_pool {
    name = each.value.default_node_pool_name
    vm_size = each.value.default_node_pool_vm_size
  }

  identity {
    type = "SystemAssigned"
  }
}