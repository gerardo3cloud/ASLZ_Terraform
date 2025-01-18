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
  }


  spoke = {
    name          = "vnet_spoke"
    rg            = "rg_spoke_gerry"
    location      = "East US"
    address_space = ["10.2.0.0/24"]
  }

  spoke2 = {
    name          = "vnet_spoke2"
    rg            = "rg_spoke2_gerry"
    location      = "East US"
    address_space = ["10.3.0.0/24"]
  }

}