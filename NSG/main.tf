

resource "azurerm_network_security_group" "NSG" {
for_each = var.azurerm_network_security_group
  name                = each.value.nsgname
  location            =  each.value.location
  resource_group_name = each.value.rgname

  security_rule {
    name                     = "CK123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

security_rule {
    name                       = "test123"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = {
    environment = "Production"
  }
}