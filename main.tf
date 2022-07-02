#module rgroup
module "r_group" {
  source   = "./modules/rgroup"
  r_group  = "2053-assignment1-RG"
  location = "East Asia"
}

#module network
module "network" {
  source   = "./modules/network"
  r_group  = module.r_group.r_group.name
  location = module.r_group.r_group.location
}

#module common
module "common" {
  source   = "./modules/common"
  r_group  = module.r_group.r_group.name
  location = module.r_group.r_group.location
  depends_on = [
    module.r_group
  ]
}

#module vmlinux
module "vmlinux" {
  source   = "./modules/vmlinux"
  r_group  = module.r_group.r_group.name
  location = module.r_group.r_group.location
  nb_count = 2
  depends_on = [
    module.network
  ]
  vm_name        = "u-vm-2053"
  subnet_id      = module.network.subnet.id
  storage_ac_uri = module.common.storage_ac.primary_blob_endpoint
}

#module vmwindows 
module "vmwindows" {
  source   = "./modules/vmwindows"
  r_group  = module.r_group.r_group.name
  location = module.r_group.r_group.location
  depends_on = [
    module.network
  ]
  vmw_name       = "w-vm-2053"
  subnet_id      = module.network.subnet.id
  storage_ac_uri = module.common.storage_ac.primary_blob_endpoint
}


#module datadisk
module "datadisk" {
  source   = "./modules/datadisk"
  r_group  = module.r_group.r_group.name
  location = module.r_group.r_group.location
  depends_on = [
    module.vmlinux,
    module.vmwindows
  ]
  vmw_name = module.vmwindows.windows_vm_op
  vmw_id   = module.vmwindows.windows_VM.id
  lvm_id   = module.vmlinux.linux_id

}

#module loadbal
module "loadbalancer" {
  source    = "./modules/loadbalancer"
  r_group   = module.r_group.r_group.name
  location  = module.r_group.r_group.location
  lvmnicids = module.vmlinux.linux_nwic_id
  depends_on = [
    module.vmlinux
  ]
}

#module loadbal
module "database" {
  source   = "./modules/database"
  r_group  = module.r_group.r_group.name
  location = module.r_group.r_group.location
  server   = "postdbserver2053"
  depends_on = [
    module.r_group
  ]
}
