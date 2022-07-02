output "windows_vm_op" {
  value = azurerm_windows_virtual_machine.windows_VM.name
}

output "windows_dns" {
  value = azurerm_public_ip.windows_pip.domain_name_label
}

output "windows_VM" {
  value = azurerm_windows_virtual_machine.windows_VM
}

output "windows_private_ip" {
  value = azurerm_windows_virtual_machine.windows_VM.private_ip_address
}

output "windows_public_ip" {
  value = azurerm_windows_virtual_machine.windows_VM.public_ip_address
}

