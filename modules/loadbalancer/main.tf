resource "azurerm_public_ip" "loadbalancer_pip" {
  name                = var.loadbal_publicip
  resource_group_name = var.r_group
  location            = var.location
  allocation_method   = "Static"
  tags                = local.common_tags
}

resource "azurerm_lb" "loadfrontlb" {
  name                = var.loadfrontlb
  resource_group_name = var.r_group
  location            = var.location

  frontend_ip_configuration {
    name                 = "PublicIP"
    public_ip_address_id = azurerm_public_ip.loadbalancer_pip.id
  }
}


resource "azurerm_lb_backend_address_pool" "lb_backendpool" {
  loadbalancer_id = azurerm_lb.loadfrontlb.id
  name            = var.loadBackEndAddressPool
}

resource "azurerm_network_interface_backend_address_pool_association" "lb_vm_association" {
  count                   = var.nb_count
  network_interface_id    = var.lvmnicids[count.index]
  ip_configuration_name   = "${var.linux_name}-ipconfig-${format("%1d", count.index + 1)}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backendpool.id
}

