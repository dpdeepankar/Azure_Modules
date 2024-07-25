variable "useridentity" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
  }))
}

variable "tags" {
    type = map(string)
}