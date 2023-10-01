resource "azurerm_resource_group" "RG" {
for_each = var.azurerm_resource_group
  name     = each.value.rgname
    location = each.value.location
}