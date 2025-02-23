# All variables as it would be defined in the .tfvars file.

tags = {
  archuuid = "00cc9898-37f0-4cc5-856b-a629f2294918"
  env      = "Test"
}

rgs = {
  hub = {
    name     = "rg_hub_gerry"
    location = "East US"
  }
  spoke = {
    name     = "rg_spoke_gerry"
    location = "East US"
  }
  spoke2 = {
    name     = "rg_spoke2_gerry"
    location = "East US"
  }

}

vnets = {
  hub = {
    name          = "vnet_hub"
    rg            = "rg_hub_gerry"
    location      = "East US"
    address_space = ["10.1.0.0/24"]

    subnets = {
      azurefirewallsubnet = {
        address_prefixes = ["10.1.0.0/29"]
      },
      jumphostsubnet = {
        address_prefixes = ["10.1.0.8/29"]
      },
      gatewaysubnet = {
        address_prefixes = ["10.1.0.16/29"]
      }
    }
  }

  spoke = {
    name          = "vnet_spoke"
    rg            = "rg_spoke_gerry"
    location      = "East US"
    address_space = ["10.2.0.0/24"]

    subnets = {
      snet-mysql = {
        address_prefixes  = ["10.2.0.0/29"]
        delegation_enable = true
        delegation_name   = "Microsoft.DBforMySQL/flexibleServers"
        delegation_action = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
      },
      keyvaultsubnet = {
        address_prefixes = ["10.2.0.8/29"]
      },
      aksclustersubnet = {
        address_prefixes = ["10.2.0.16/28"]
      },
      appgatewaysubnet = {
        address_prefixes = ["10.2.0.32/28"]
      }
    }
  }

  spoke2 = {
    name          = "vnet_spoke2"
    rg            = "rg_spoke2_gerry"
    location      = "East US"
    address_space = ["10.3.0.0/24"]
  }

}



