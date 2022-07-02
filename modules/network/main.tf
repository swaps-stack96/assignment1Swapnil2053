resource "azurerm_virtual_network" "v_net" {
  name                = var.v_net
  location            = var.location
  resource_group_name = var.r_group
  address_space       = var.v_netspace
  tags                = local.common_tags
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet
  resource_group_name  = var.r_group
  virtual_network_name = azurerm_virtual_network.v_net.name
  address_prefixes     = var.subnet_space
}


