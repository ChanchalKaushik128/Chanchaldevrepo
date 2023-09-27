resource "azurerm_storage_container" "contname" {
  for_each = var.azurerm_storage_account
  name                  = each.value.contname
  storage_account_name  = each.value.stname
  container_access_type = "private"
}