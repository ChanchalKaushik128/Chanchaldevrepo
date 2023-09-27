data "azurerm_virtual_network" "vnet1" {
  name                = "CHANCHALVENT1"
  resource_group_name = "CKRG"
}
data "azurerm_virtual_network" "vnet2" {
  name                = "CHANCHALVENT2"
  resource_group_name = "CKRG1"
}

resource "azurerm_virtual_network_peering" "peering-1" {
  name                      = "peer1to2"
  resource_group_name       = "CKRG"
  virtual_network_name      = "CHANCHALVENT1"
  remote_virtual_network_id = data.azurerm_virtual_network.vnet2.id
}

resource "azurerm_virtual_network_peering" "peering-2" {
  name                      = "peer2to1"
  resource_group_name       = "CKRG1"
  virtual_network_name      = "CHANCHALVENT2"
  remote_virtual_network_id = data.azurerm_virtual_network.vnet1.id
}