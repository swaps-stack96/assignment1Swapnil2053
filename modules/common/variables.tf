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

variable "log_analytics_ws" {
  type = map(string)
  default = {
    name              = "2053-log-analytics-ws"
    sku               = "PerGB2018"
    retention_in_days = 30
  }
}

variable "recovery_services_vault" {
  type = map(string)
  default = {
    name = "vault-2053"
    sku  = "Standard"
  }
}

variable "storage_ac" {
  type = map(string)
  default = {
    "name"                   = "2053storageac"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

