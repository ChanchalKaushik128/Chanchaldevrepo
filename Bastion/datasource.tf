data "azurerm_subnet" "subnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "CHANCHALVENT1"
  resource_group_name  = "CKRG"
}

data "azurerm_public_ip" "pip" {
  name                = "ckpip"
  resource_group_name = "CKRG"
}