
resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.networking_rg_name
}

resource "azurerm_subnet" "subnet1" {
  name                  = var.subnet1_name
  resource_group_name   = var.networking_rg_name
  virtual_network_name  = azurerm_virtual_network.main.name
  address_prefixes      = [var.subnet1_cidr]
}

resource "azurerm_subnet" "subnet2" {
  name                  = var.subnet2_name
  resource_group_name   = var.networking_rg_name
  virtual_network_name  = azurerm_virtual_network.main.name
  address_prefixes      = [var.subnet2_cidr]
}

resource "azurerm_network_security_group" "nsg1" {
  name                = var.nsg1_name
  location            = var.location
  resource_group_name = var.networking_rg_name

  security_rule {
    name                       = "allow_ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.allow_ssh_from_ip
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_group" "nsg2" {
  name                = var.nsg2_name
  location            = var.location
  resource_group_name = var.networking_rg_name

  security_rule {
    name                       = "allow_rdp"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = var.allow_rdp_from_ip
    destination_address_prefix = "*"
  }
}

