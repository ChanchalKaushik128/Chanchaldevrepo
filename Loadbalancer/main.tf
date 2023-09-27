resource "azurerm_lb" "Loadbalancer" {
  for_each = var.azurerm_lb
  name                = each.value.lbname
  location            =each.value.location
  resource_group_name = each.value.rgname
  sku                 = "Standard"


  frontend_ip_configuration {
    name                 = each.value.frontendipname
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
    
  }
}
resource "azurerm_lb_backend_address_pool" "backendaddresspool" {
  for_each = var.azurerm_lb
  loadbalancer_id = azurerm_lb.Loadbalancer[each.key].id
  name            = each.value.backendpoolname
}

resource "azurerm_lb_backend_address_pool_address" "backendaddresspool_address" {
  for_each                = var.azurerm_lb
  name                    = each.value.backendaddresspoolname
  backend_address_pool_id = azurerm_lb_backend_address_pool.backendaddresspool[each.key].id
  virtual_network_id      = data.azurerm_virtual_network.vnet[each.key].id
  ip_address              = data.azurerm_virtual_machine.vm[each.key].private_ip_address
}
resource "azurerm_lb_backend_address_pool_address" "backendaddresspool_address2" {
  for_each                = var.azurerm_lb
  name                    = each.value.backendaddresspoolname2
  backend_address_pool_id = azurerm_lb_backend_address_pool.backendaddresspool[each.key].id
  virtual_network_id      = data.azurerm_virtual_network.vnet[each.key].id
  ip_address              = data.azurerm_virtual_machine.vm2[each.key].private_ip_address
}
resource "azurerm_lb_probe" "lbhealthprobe" {
  for_each = var.azurerm_lb
  loadbalancer_id = azurerm_lb.Loadbalancer[each.key].id
  name            = "http-running-probe"
  port            = 80
}

resource "azurerm_lb_rule" "lbrule" {
  for_each = var.azurerm_lb
  loadbalancer_id                = azurerm_lb.Loadbalancer[each.key].id
  name                           = each.value.lbrule
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = each.value.frontendipname
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backendaddresspool[each.key].id]
  probe_id                       = azurerm_lb_probe.lbhealthprobe[each.key].id
}