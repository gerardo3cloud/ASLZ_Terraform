#resource "azurerm_resource_group" "master" {
#  for_each = var.rgs
#  tags     = merge(var.tags, {})
#  name     = each.value.name
#  location = each.value.location
#}

#resource "azurerm_virtual_network" "master" {
#  for_each            = var.vnets
#  tags                = merge(var.tags, {})
#resource_group_name = azurerm_resource_group.master[each.key].name
#  resource_group_name = each.value.rg
#  name                = each.value.name
#  location            = each.value.location
#  address_space       = each.value.address_space
#}

#data "azurerm_resource_group" "example" {
#for_each = 
# name = "existing"
#}


module "rgs" {
  source   = "./modules/resource_group"
  for_each = var.rgs
  tags     = var.tags
  rg_name  = each.value.name
  location = each.value.location
}

module "vnets" {
  source   = "./modules/network"
  for_each = var.vnets
  tags     = var.tags
  name     = each.value.name
  location = each.value.location
  rg_name  = each.value.rg
  #rg_name  = module.rgs[each.key].id
  address_space = each.value.address_space
  subnets       = each.value.subnets

}
