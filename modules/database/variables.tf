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
}

variable "server" {
  default = ""
}

variable "username" {
  default = "swapnil2053"
}

variable "password" {
  default = "Swapnil@2053"
}

variable "postgresdb" {
  default = "postdb2053"
}
