variable "tags" {
  type = map(string)
}

variable "privatednszone" {
  type = map(object({
    name = string
    resource_group_name = string
  }))
}