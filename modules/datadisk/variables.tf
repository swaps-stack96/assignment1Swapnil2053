locals {
  common_tags = {
    Project        = "Automation Project – Assignment 1"
    Name           = "Swapnil.Shah"
    stuId          = "N01522053"
    ExpirationDate = "2022-06-30"
    Environment    = "Lab"
  }
}


variable "r_group" {
  default = ""
}

variable "location" {
  default = ""
}

variable "lvm_name" {
  default = ""
}

variable "datadisklinux" {
  default = "2053-datadiskl"
}

variable "lvm_id" {
  type = list(string)
}

variable "vmw_name" {
  default = ""
}

variable "vmw_id" {
  default = ""
}

variable "stroage_acc_type" {
  default = "Standard_LRS"
}


variable "create_option" {
  default = "Empty"
}

variable "disk_size_gb" {
  default = "10"
}

variable "lun" {
  default = 0
}

variable "nb_count" {
  default = 2
}

variable "datadisk_caching" {
  default = "ReadWrite"
}





