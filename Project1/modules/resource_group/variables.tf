variable "tags" {
  description = "Default tags to apply to all resources."
  type        = map(any)
}

variable "rg_name" {
  description = "description of the resource group"
  type        = string
}

variable "location" {
  description = "location of the resource group"
  type        = string
}