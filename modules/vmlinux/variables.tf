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

variable "vm_name" {
  default = ""
}

variable "vm_size" {
  default = "Standard_B1ms"
}

variable "subnet_id" {
  default = ""
}

variable "username" {
  default = "swapnil-n01522053"
}

variable "password" {
  default = "Swapnil@2053"
}

variable "os_disk_attr" {
  type = map(string)
  default = {
    stroage_acc_type = "Premium_LRS"
    disk_size        = "32"
    caching          = "ReadWrite"
  }
}

variable "OSLinuxInfo" {
  type = map(string)
  default = {
    OS_Linux_publisher = "OpenLogic"
    OS_Linux_Offer     = "CentOS"
    OS_Sku             = "8_2"
    OS_version         = "latest"
  }
}

variable "linux_avs" {
  default = "2053-linux_avs"
}

variable "avs_values" {
  type = map(string)
  default = {
    fault_domain  = 2
    update_domain = 5
  }
}

variable "storage_ac_uri" {
  default = ""
}

variable "nb_count" {
  default = ""
}

variable "vme" {
  type = map(string)
  default = {
    publisher            = "Microsoft.Azure.NetworkWatcher"
    type                 = "NetworkWatcherAgentLinux"
    type_handler_version = "1.4"
  }
}
