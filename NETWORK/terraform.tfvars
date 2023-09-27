azurerm_virtual_network = {
  vnet1 = {
    vnetname      = "CHANCHALVENT1"
    rgname        = "CKRG"
    location      = "West Europe"
    address_space = ["10.0.0.0/16"]

  },
  vnet2 = {
    vnetname      = "CHANCHALVENT2"
    rgname        = "CKRG1"
    location      = "SOUTH INDIA"
    address_space = ["10.1.0.0/16"]

  }
}



