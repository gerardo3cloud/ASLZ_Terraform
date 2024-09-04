resource "azurerm_resource_group" "resource-group_hub_gerry" {
  tags     = merge(var.tags, {})
  name     = "rg_hub_gerry"
  location = "East US"
}

resource "azurerm_resource_group" "resource-group_spoke_gerry" {
  tags     = merge(var.tags, {})
  name     = "rg_spoke_gerry"
  location = "East US"
}

resource "azurerm_virtual_network" "virtual_network_hub" {
  tags                = merge(var.tags, {})
  resource_group_name = azurerm_resource_group.resource-group_hub_gerry.name
  name                = "vnet_hub"
  location            = "East US"

  address_space = [
    "10.0.0.0/16",
  ]
}

resource "azurerm_virtual_network" "virtual_network_spoke" {
  tags                = merge(var.tags, {})
  resource_group_name = azurerm_resource_group.resource-group_spoke_gerry.name
  name                = "vnet_spoke"
  location            = "East US"

  address_space = [
    "10.1.0.0/16",
  ]
}

resource "azurerm_virtual_network_peering" "vnet_peering" {
  virtual_network_name      = azurerm_virtual_network.virtual_network_hub.name
  resource_group_name       = azurerm_resource_group.resource-group_hub_gerry.name
  remote_virtual_network_id = azurerm_virtual_network.virtual_network_spoke.id
  name                      = "peerhubtospoke"
}

resource "azurerm_subnet" "snet_firewall" {
  virtual_network_name = azurerm_virtual_network.virtual_network_hub.name
  resource_group_name  = azurerm_resource_group.resource-group_hub_gerry.name
  name                 = "AzureFirewallSubnet"

  address_prefixes = [
    "10.0.0.0/24",
  ]
}

resource "azurerm_subnet" "snet_jumphost" {
  virtual_network_name = azurerm_virtual_network.virtual_network_hub.name
  resource_group_name  = azurerm_resource_group.resource-group_hub_gerry.name
  name                 = "Subnet_Jumphost"

  address_prefixes = [
    "10.0.1.0/28",
  ]
}

resource "azurerm_subnet" "subnet_vpn" {
  virtual_network_name = azurerm_virtual_network.virtual_network_hub.name
  resource_group_name  = azurerm_resource_group.resource-group_hub_gerry.name
  name                 = "GatewaySubnet"

  address_prefixes = [
    "10.0.2.0/27",
  ]
}

resource "azurerm_subnet" "subnet_pe" {
  virtual_network_name = azurerm_virtual_network.virtual_network_spoke.name
  resource_group_name  = azurerm_resource_group.resource-group_spoke_gerry.name
  name                 = "Subnetpe"

  address_prefixes = [
    "10.1.0.0/28",
  ]
}

resource "azurerm_subnet" "subnet_cluster" {
  virtual_network_name = azurerm_virtual_network.virtual_network_spoke.name
  resource_group_name  = azurerm_resource_group.resource-group_spoke_gerry.name
  name                 = "SubnetCluster"

  address_prefixes = [
    "10.1.1.0/24",
  ]
}

resource "azurerm_subnet" "subnet_AG" {
  virtual_network_name = azurerm_virtual_network.virtual_network_spoke.name
  resource_group_name  = azurerm_resource_group.resource-group_spoke_gerry.name
  name                 = "SubnetApplicationGateway"

  address_prefixes = [
    "10.1.2.0/27",
  ]
}

resource "azurerm_subnet" "subnet_database" {
  virtual_network_name = azurerm_virtual_network.virtual_network_spoke.name
  resource_group_name  = azurerm_resource_group.resource-group_spoke_gerry.name
  name                 = "SubnetDatabase"

  address_prefixes = [
    "10.1.3.0/24",
  ]
}

