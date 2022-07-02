terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01522053RG"
    storage_account_name = "tfstaten01522053sa"
    container_name       = "tfstatefiles"
    key                  = "tfstatekey"
  }
}
