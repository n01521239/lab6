resource "azurerm_resource_group" "networking" {
  name     = var.networking_rg_name
  location = var.location
}

resource "azurerm_resource_group" "linux" {
  name     = var.linux_rg_name
  location = var.location
}

resource "azurerm_resource_group" "windows" {
  name     = var.windows_rg_name
  location = var.location
}
