output "vnetid" {
 description = "vnet id passing values"
 value = azurerm_virtual_network.master.id
}

output "virtualnetworkssubnetids" {
    value = {
        for key,value in azurerm_subnet.master : 
        value.name => value.id
        }
}