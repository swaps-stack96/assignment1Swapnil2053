resource "azurerm_resource_group" "r_group" {
  name     = var.r_group
  location = var.location
  tags     = local.common_tags
}
