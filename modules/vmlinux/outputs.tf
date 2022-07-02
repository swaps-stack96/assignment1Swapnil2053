output "linux_VM_ops" {
  value = [azurerm_linux_virtual_machine.linux_VM[*].name]
}

output "linux_public_ip_address" {
  value = [azurerm_linux_virtual_machine.linux_VM[*].public_ip_address]
}

output "linux_private_ip_address" {
  value = [azurerm_linux_virtual_machine.linux_VM[*].private_ip_address]
}

output "linux_id" {
  value = azurerm_linux_virtual_machine.linux_VM[*].id
}

output "linux_nwic_id" {
  value = azurerm_network_interface.linux_nwic[*].id
}

output "linux_pip_id" {
  value = [azurerm_public_ip.linux_pip[*].id]
}

output "linux_dns" {
  value = [azurerm_public_ip.linux_pip[*].domain_name_label]
}

output "linux_vm" {
  value = [azurerm_linux_virtual_machine.linux_VM[*]]
}




