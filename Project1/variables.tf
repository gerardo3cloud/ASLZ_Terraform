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
    subnets = optional(map(object({
      delegation_enable  = optional(bool, false)
      delegation_name    = optional(string, "")
      delegation_actions = optional(list(string), [])
      address_prefixes   = list(string)
    })), {})
  }))
}

variable "client_id" {
  description = "The client ID for the Service Principal."
  type       = string
}

variable "client_secret" {
  description = "The client secret for the Service Principal."
  type       = string
}

variable "tenant_id" {
  description = "The tenant ID for the Service Principal."
  type       = string
}

variable "subscription_id" {
  description = "The subscription ID for the Service Principal."
  type       = string
}