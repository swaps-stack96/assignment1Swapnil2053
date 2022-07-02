output "datadisk_linux" {
  value = [azurerm_managed_disk.datadisk_linux[*]]
}

output "datadiskattach_linux" {
  value = [azurerm_virtual_machine_data_disk_attachment.datadiskattach_linux[*]]
}

output "datadisk_windows" {
  value = azurerm_managed_disk.datadisk_windows
}

output "datadiskattach_windows" {
  value = azurerm_virtual_machine_data_disk_attachment.datadiskattach_windows
}
