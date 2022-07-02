resource "azurerm_log_analytics_workspace" "log_analytics_ws" {
  name                = var.log_analytics_ws["name"]
  resource_group_name = var.r_group
  location            = var.location
  sku                 = var.log_analytics_ws["sku"]
  retention_in_days   = var.log_analytics_ws["retention_in_days"]
  tags                = local.common_tags
}

resource "azurerm_recovery_services_vault" "recovery_services_vault" {
  name                = var.recovery_services_vault["name"]
  resource_group_name = var.r_group
  location            = var.location
  sku                 = var.recovery_services_vault["sku"]
  soft_delete_enabled = true
  tags                = local.common_tags
}

resource "azurerm_storage_account" "storage_ac" {
  name                     = var.storage_ac["name"]
  resource_group_name      = var.r_group
  location                 = var.location
  account_tier             = var.storage_ac["account_tier"]
  account_replication_type = var.storage_ac["account_replication_type"]
  tags                     = local.common_tags
}


