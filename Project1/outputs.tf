#output "subnetids" {
#    description = "subnet ids"
#    value = module.vnets.virtualnetworkssubnetids
#} 

output "hubvnetid"{
    description = "vnet id of the hubvnetid"
    value = module.vnets["hub"].vnetid
}

output "subnetids" {
    description = "subnet ids"
    value = {
        for vnet, vnetinfo in module.vnets :
        vnet => vnetinfo.virtualnetworkssubnetids
    }  
} 