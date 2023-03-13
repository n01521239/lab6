resource "azurerm_availability_set" "windows" {
  name                = var.availability_set_name
  location            = var.location
  resource_group_name = var.windows_rg_name
  platform_fault_domain_count = 2
  platform_update_domain_count = 5
}

resource "azurerm_network_interface" "windows_nic" {
  count               = var.vm_count
  name                = "${var.vm_name_prefix}-${count.index+1}-nic"
  location            = var.location
  resource_group_name = var.windows_rg_name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet2_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "windows_public_ip" {
  count               = var.vm_count
  name                = "${var.vm_name_prefix}-${count.index+1}-public-ip"
  location            = var.location
  resource_group_name = var.windows_rg_name
  allocation_method   = "Dynamic"
}

resource "azurerm_virtual_machine" "windows" {
  count               = var.vm_count
  name                = "${var.vm_name_prefix}-${count.index+1}"
  location            = var.location
  resource_group_name = var.windows_rg_name
  network_interface_ids = [
    azurerm_network_interface.windows_nic[count.index].id
  ]
  vm_size             = var.vm_size
  availability_set_id = azurerm_availability_set.windows.id

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.vm_name_prefix}-${count.index+1}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  os_profile {
    computer_name  = "${var.vm_name_prefix}-${count.index+1}"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    enable_automatic_upgrades = true
  }
}
