variable "tags" {
  description = "Default tags to apply to all resources."
  type        = map(any)
}

variable "rgs" {
  description = "creates multiple resource groups"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "vnets" {
  description = "creates multiple virtual networks"
  type = map(object({
    name          = string
    location      = string
    rg            = string
    address_space = list(string)
  }))
}