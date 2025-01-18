resource "azurerm_virtual_network" "master" {
  tags                = merge(var.tags, {})
  resource_group_name = var.rg_name
  name                = var.name
  location            = var.location
  address_space       = var.address_space
}