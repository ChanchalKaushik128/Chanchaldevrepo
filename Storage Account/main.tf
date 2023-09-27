resource "azurerm_storage_account" "STA" {
    for_each = var.azurerm_storage_account
  name                     = each.value.stname
  resource_group_name      = each.value.name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}