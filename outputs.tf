#r_group
output "r_group" {
  value = module.r_group.r_group.name
}

#network
output "v_net" {
  value = module.network.v_net.name
}

output "subnet" {
  value = module.network.subnet.name
}

#common
output "log_analytics_ws" {
  value = module.common.log_analytics_ws.name
}

output "recovery_services_valut" {
  value = module.common.recovery_services_valut.name
}

output "storage_ac" {
  value = module.common.storage_ac.name
}

#linux
output "linux_VM_ops" {
  value = module.vmlinux.linux_VM_ops
}

output "linux_public_ip_address" {
  value = module.vmlinux.linux_public_ip_address
}

output "linux_private_ip_address" {
  value = module.vmlinux.linux_private_ip_address
}

output "linux_dns" {
  value = module.vmlinux.linux_dns
}

#output vmwindows

output "windows_vm_op" {
  value = module.vmwindows.windows_vm_op
}

output "windows_public_ip" {
  value = module.vmwindows.windows_public_ip
}

output "windows_private_ip" {
  value = module.vmwindows.windows_private_ip
}

output "windows_dns" {
  value = module.vmwindows.windows_dns
}

#module loadbal_ops
output "loadbal_op" {
  value = module.loadbalancer.loadbal_op.name
}

#module database
output "dbname" {
  value = module.database.dbname.name
}
