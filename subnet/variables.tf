variable subnets {
    type = map(object({
        name = string
        resource_group_name = string
        virtual_network_name = string
        address_prefixes = list(string)
        private_endpoint_network_policies = optional(string)
        private_link_service_network_policies_enabled = optional(bool)
        service_endpoints = optional(list(string))
        delegation = optional(map(object({
            name = string
        })))
    }))
}