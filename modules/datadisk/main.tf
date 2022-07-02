resource "azurerm_managed_disk" "datadisk_linux" {
  count                = var.nb_count
  name                 = "${var.datadisklinux}-dd-${format("%1d", count.index + 1)}"
  resource_group_name  = var.r_group
  location             = var.location
  storage_account_type = var.stroage_acc_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
  tags                 = local.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "datadiskattach_linux" {
  count              = var.nb_count
  managed_disk_id    = element(azurerm_managed_disk.datadisk_linux[*].id, count.index + 1)
  virtual_machine_id = var.lvm_id[count.index]
  lun                = var.lun
  caching            = var.datadisk_caching
  depends_on = [
    azurerm_managed_disk.datadisk_linux
  ]
}

resource "azurerm_managed_disk" "datadisk_windows" {
  name                 = "${var.vmw_name}-datadiskw"
  resource_group_name  = var.r_group
  location             = var.location
  storage_account_type = var.stroage_acc_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
  tags                 = local.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "datadiskattach_windows" {
  managed_disk_id    = azurerm_managed_disk.datadisk_windows.id
  virtual_machine_id = var.vmw_id
  lun                = var.lun
  caching            = var.datadisk_caching
  depends_on = [
    azurerm_managed_disk.datadisk_windows
  ]
}
