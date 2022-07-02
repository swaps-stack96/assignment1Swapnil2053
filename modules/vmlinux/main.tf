resource "azurerm_network_interface" "linux_nwic" {
  count               = var.nb_count
  name                = "${var.vm_name}-nic-${format("%1d", count.index + 1)}"
  resource_group_name = var.r_group
  location            = var.location
  tags                = local.common_tags

  ip_configuration {
    name                          = "${var.vm_name}-ipconfig-${format("%1d", count.index + 1)}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.linux_pip[*].id, count.index + 1)
  }
}

resource "azurerm_public_ip" "linux_pip" {
  count               = var.nb_count
  name                = "${var.vm_name}-pip-${format("%1d", count.index + 1)}"
  resource_group_name = var.r_group
  location            = var.location
  domain_name_label   = "${var.vm_name}-dns-${format("%1d", count.index + 1)}"
  allocation_method   = "Static"
  tags                = local.common_tags
}

resource "azurerm_linux_virtual_machine" "linux_VM" {
  count               = var.nb_count
  name                = "${var.vm_name}-vm-${format("%1d", count.index + 1)}"
  resource_group_name = var.r_group
  location            = var.location
  size                = var.vm_size
  admin_username      = var.username
  computer_name       = "${var.vm_name}-comp-${format("%1d", count.index + 1)}"
  tags                = local.common_tags
  availability_set_id = azurerm_availability_set.linux_avs.id
  network_interface_ids = [
    element(azurerm_network_interface.linux_nwic[*].id, count.index + 1)
  ]

  admin_password                  = var.password
  disable_password_authentication = false

  os_disk {
    name                 = "${var.vm_name}-os-disk-${format("%1d", count.index + 1)}"
    caching              = var.os_disk_attr["caching"]
    storage_account_type = var.os_disk_attr["stroage_acc_type"]
    disk_size_gb         = var.os_disk_attr["disk_size"]
  }

  source_image_reference {
    publisher = var.OSLinuxInfo["OS_Linux_publisher"]
    offer     = var.OSLinuxInfo["OS_Linux_Offer"]
    sku       = var.OSLinuxInfo["OS_Sku"]
    version   = var.OSLinuxInfo["OS_version"]
  }

  boot_diagnostics {
    storage_account_uri = var.storage_ac_uri
  }

  depends_on = [
    azurerm_availability_set.linux_avs
  ]
}

resource "azurerm_availability_set" "linux_avs" {
  name                         = var.linux_avs
  resource_group_name          = var.r_group
  location                     = var.location
  platform_fault_domain_count  = var.avs_values["fault_domain"]
  platform_update_domain_count = var.avs_values["update_domain"]
  tags                         = local.common_tags
}

resource "azurerm_virtual_machine_extension" "linux_vme" {
  count                = var.nb_count
  name                 = "${var.vm_name}-vme-${format("%1d", count.index + 1)}"
  virtual_machine_id   = azurerm_linux_virtual_machine.linux_VM[count.index].id
  publisher            = var.vme["publisher"]
  type                 = var.vme["type"]
  type_handler_version = var.vme["type_handler_version"]
  depends_on = [
    null_resource.linux_provisioner
  ]
  tags = local.common_tags
}


