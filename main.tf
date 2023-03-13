provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "./modules/resource_group"

  location           = "canadaeast"
  networking_rg_name = "networking-rg"
  linux_rg_name      = "linux-rg"
  windows_rg_name    = "windows-rg"
}

# declare the network module
module "network" {
  source = "./modules/network"
  location = var.location
}





module "linux_virtual_machines" {
  source = "./modules/linux"

  vm_count        = var.vm_count
  vm_size         = var.vm_size
  admin_username  = var.admin_username
  admin_password  = var.admin_password
  subnet_id 	= module.network.subnet1_id
}




module "windows_virtual_machines" {
  source = "./modules/windows"
  vm_count        = var.vm_count
  vm_size         = var.vm_size
  admin_username  = var.admin_username
  admin_password  = var.admin_password
  subnet2_id       = module.network.subnet2_id
}

