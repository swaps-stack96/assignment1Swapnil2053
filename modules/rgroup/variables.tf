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
  default = "2053-assignment1-RG"
}

variable "location" {
  default = "East Asia"
}
