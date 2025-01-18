resource "azurerm_public_ip" "master" {
  name                = "pip-${var.firewallname}"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "master" {
  name                = var.firewallname
  location            = var.location
  resource_group_name = var.rg_name
  sku_name            = var.skuname
  sku_tier            = var.tier

  ip_configuration {
    name                 = var.ipconfigurationame
    subnet_id            = var.subnetid
    public_ip_address_id = azurerm_public_ip.master.id
  }
}