resource "azurerm_virtual_network" "master" {
  tags                = merge(var.tags, {})
  resource_group_name = var.rg_name
  name                = var.name
  location            = var.location
  address_space       = var.address_space
}

resource "azurerm_subnet" "master" {
  for_each             = var.subnets
  name                 = each.key
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.master.name
  address_prefixes     = each.value.address_prefixes

  dynamic "delegation" {
    for_each = each.value.delegation_enable ? ["enable"] : []
      
      content { 
        name = "delegation"

    service_delegation {
      name = each.value.delegation_name
      actions = each.value.delegation_actions
    }
  } 
  }
}

