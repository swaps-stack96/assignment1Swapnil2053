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

variable "v_net" {
  default = "2053-vnet"
}

variable "subnet" {
  default = "2053-subnet"
}

variable "v_netspace" {
  default = ["10.0.0.0/16"]
}

variable "subnet_space" {
  default = ["10.0.1.0/24"]
}
