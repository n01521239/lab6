# Create availability set
resource "azurerm_availability_set" "linux" {
  name                = var.availability_set_name
  location            = var.location
  resource_group_name = var.linux_rg_name
  platform_fault_domain_count = 2
  platform_update_domain_count = 5
}

# Create virtual machines
resource "azurerm_network_interface" "linux_nic" {
  count               = var.vm_count
  name                = "${var.vm_name_prefix}-${count.index+1}-nic"
  location            = var.location
  resource_group_name = var.linux_rg_name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "linux_public_ip" {
  count               = var.vm_count
  name                = "${var.vm_name_prefix}-${count.index+1}-public-ip"
  location            = var.location
  resource_group_name = var.linux_rg_name
  allocation_method   = "Dynamic"
}

resource "azurerm_virtual_machine" "linux" {
  count               = var.vm_count
  name                = "${var.vm_name_prefix}-${count.index+1}"
  location            = var.location
  resource_group_name = var.linux_rg_name
  network_interface_ids = [
    azurerm_network_interface.linux_nic[count.index].id
  ]
  vm_size             = var.vm_size
  availability_set_id = azurerm_availability_set.linux.id

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
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

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
