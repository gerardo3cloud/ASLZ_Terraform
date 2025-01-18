resource "azurerm_resource_group" "master" {
  tags     = merge(var.tags, {})
  name     = var.rg_name
  location = var.location
}