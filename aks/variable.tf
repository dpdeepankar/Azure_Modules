variable "aks_cluster" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    default_node_pool_name = string
    default_node_pool_vm_size = string
    oidc_issuer_enabled = bool
    workload_identity_enabled = bool
    private_cluster_enabled = bool
    kubernetes_version = string
  }))
}