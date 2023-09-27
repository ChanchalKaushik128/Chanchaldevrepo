data "azurerm_public_ip" "pip" { 
  for_each = var.azurerm_lb
  name                = each.value.pipname
  resource_group_name = each.value.rgname
}
data "azurerm_virtual_network" "vnet" {
  for_each = var.azurerm_lb
  name                = each.value.vnetname
  resource_group_name = each.value.rgname
}

data "azurerm_virtual_machine" "vm" {
    for_each = var.azurerm_lb
  name                = each.value.vmname1
  resource_group_name = each.value.rgname
}
data "azurerm_virtual_machine" "vm2" {
    for_each = var.azurerm_lb
  name                = each.value.vmname2
  resource_group_name = each.value.rgname
}