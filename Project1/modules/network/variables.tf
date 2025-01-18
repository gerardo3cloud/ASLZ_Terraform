variable "name" {
  description = "name of the virtual network"
  type        = string
}

variable "location" {
  description = "location of the virtual network"
  type        = string
}

variable "rg_name" {
  description = "resource group of the virtual network"
  type        = string
}

variable "address_space" {
  description = "address space of the virtual network"
  type        = list(string)
}

variable "tags" {
  description = "Default tags to apply to all resources."
  type        = map(any)
}