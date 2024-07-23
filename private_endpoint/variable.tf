variable "tags" {
  type = map(string)

}

variable "private_endpoint" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    subnet_id = string
    private_service_connection = {
        name = string
        private_connection_resource_id = string
        subresource_names = list(string)
    }
  }))
}