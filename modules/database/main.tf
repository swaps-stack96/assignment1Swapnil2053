resource "azurerm_postgresql_server" "postdbserver" {
  name                         = var.server
  resource_group_name          = var.r_group
  location                     = var.location
  sku_name                     = "B_Gen5_2"
  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = var.username
  administrator_login_password = var.password
  version                      = "9.5"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "postdb" {
  name                = var.postgresdb
  resource_group_name = var.r_group
  server_name         = azurerm_postgresql_server.postdbserver.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
