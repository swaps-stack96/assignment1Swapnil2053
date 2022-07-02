resource "azurerm_network_interface" "windows_wnic" {
  name                = "${var.vmw_name}-nic"
  resource_group_name = var.r_group
  location            = var.location
  tags                = local.common_tags

  ip_configuration {
    name                          = "${var.vmw_name}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows_pip.id
  }
}

resource "azurerm_public_ip" "windows_pip" {
  name                = "${var.vmw_name}-pip"
  resource_group_name = var.r_group
  location            = var.location
  domain_name_label   = "${var.vmw_name}-dns"
  allocation_method   = "Static"
  tags                = local.common_tags

}

resource "azurerm_windows_virtual_machine" "windows_VM" {
  name                = "${var.vmw_name}-vm"
  resource_group_name = var.r_group
  location            = var.location
  size                = var.vmw_size
  admin_username      = var.username
  admin_password      = var.password
  computer_name       = var.vmw_name
  availability_set_id = azurerm_availability_set.windows_avs.id

  tags = local.common_tags

  network_interface_ids = [
    azurerm_network_interface.windows_wnic.id
  ]


  os_disk {
    name                 = "${var.vmw_name}-os-disk"
    caching              = var.osw_disk_attr["caching"]
    storage_account_type = var.osw_disk_attr["stroage_acc_type"]
    disk_size_gb         = var.osw_disk_attr["disk_size"]
  }

  source_image_reference {
    publisher = var.OSWindowsInfo["OS_Windows_publisher"]
    offer     = var.OSWindowsInfo["OS_Windows_Offer"]
    sku       = var.OSWindowsInfo["OS_Sku"]
    version   = var.OSWindowsInfo["OS_version"]
  }

  winrm_listener {
    protocol = "Http"
  }

  boot_diagnostics {
    storage_account_uri = var.storage_ac_uri
  }

  depends_on = [azurerm_availability_set.windows_avs]

}

resource "azurerm_availability_set" "windows_avs" {
  name                         = var.windows_avs
  resource_group_name          = var.r_group
  location                     = var.location
  platform_fault_domain_count  = var.windowavs_values["fault_domain"]
  platform_update_domain_count = var.windowavs_values["update_domain"]
}

resource "azurerm_virtual_machine_extension" "windows-vmexe" {
  name                 = "${var.vmw_name}-vmexe"
  virtual_machine_id   = azurerm_windows_virtual_machine.windows_VM.id
  publisher            = var.vmwe["publisher"]
  type                 = var.vmwe["type"]
  type_handler_version = var.vmwe["type_handler_version"]
  tags                 = local.common_tags
}
