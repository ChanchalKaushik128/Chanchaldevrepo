resource "azurerm_virtual_network" "kaushik" {
  for_each            = var.azurerm_virtual_network
  name                = each.value.vnetname
  location            = each.value.location
  resource_group_name = each.value.rgname
  address_space       = each.value.address_space
}




