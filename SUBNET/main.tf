resource "azurerm_subnet" "subnet" {
  for_each             = var.subnet
  name                 = each.value.subname
  address_prefixes       = each.value.poolname
  resource_group_name  = each.value.rgname
  virtual_network_name = each.value.vnetname
  
}