variable resourcegroup {
    type = map(object({
        name = string   # name of the resource group
        location = string   # location of the resource group
    }))
}

variable tags {
    type = map(string)
}