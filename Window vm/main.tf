data "azurerm_subnet" "subnet" {
  for_each             = var.azurerm_window_virtual_machine
  name                 = each.value.subname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.rgname
}
data "azurerm_key_vault" "ckvault" {
  for_each            = var.azurerm_window_virtual_machine
  name                = each.value.kvname
  resource_group_name = each.value.rgname
}
data "azurerm_key_vault_secret" "secret1" {
  for_each     = var.azurerm_window_virtual_machine
  name         = each.value.kvusername
  key_vault_id = data.azurerm_key_vault.ckvault[each.key].id
}
data "azurerm_key_vault_secret" "secret2" {
  for_each     = var.azurerm_window_virtual_machine
  name         = each.value.kvpass
  key_vault_id = data.azurerm_key_vault.ckvault[each.key].id
}

resource "azurerm_public_ip" "pip" {
  for_each            = var.azurerm_window_virtual_machine
  name                = each.value.pipname
  location            = each.value.location
  resource_group_name = each.value.rgname
  allocation_method   = "Static" # You can also use "Static" if needed
}

resource "azurerm_network_interface" "NIC" {
for_each            = var.azurerm_window_virtual_machine
  name                = each.value.nicname
  location            = each.value.location
  resource_group_name = each.value.rgname
  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    
    private_ip_address_allocation = "static"
    public_ip_address_id          = azurerm_public_ip.pip[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  for_each            = var.azurerm_window_virtual_machine
  name                = each.value.vmname
  resource_group_name = each.value.rgname
  location            = each.value.location
  size                = each.value.sizetype
  admin_username      = data.azurerm_key_vault_secret.secret1[each.key].value
  admin_password      = data.azurerm_key_vault_secret.secret2[each.key].value
  network_interface_ids = [
    azurerm_network_interface.NIC[each.key].id
  ]
  disable_password_authentication = "false"


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}