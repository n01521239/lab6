output "networking_rg_name" {
  value = module.resource_group.networking_rg_name
}

output "linux_rg_name" {
  value = module.resource_group.linux_rg_name
}

output "windows_rg_name" {
  value = module.resource_group.windows_rg_name
}
output "networking_vnet_name" {
  value = module.network.vnet_name
}

output "networking_vnet_address_space" {
  value = module.network.vnet_address_space
}

output "networking_subnet1_name" {
  value = module.network.subnet1_name
}

output "networking_subnet1_address_space" {
  value = module.network.subnet1_address_space
}

output "networking_subnet2_name" {
  value = module.network.subnet2_name
}

output "networking_subnet2_address_space" {
  value = module.network.subnet2_address_space
}

output "networking_nsg1_name" {
  value = module.network.nsg1_name
}

output "networking_nsg2_name" {
  value = module.network.nsg2_name
}



output "linux_vm_hostnames" {
  value = module.linux_virtual_machines.vm_hostnames
}

output "linux_vm_fqdns" {
  value = module.linux_virtual_machines.vm_fqdns
}

output "linux_vm_private_ips" {
  value = module.linux_virtual_machines.vm_private_ips
}

output "linux_vm_public_ips" {
  value = module.linux_virtual_machines.vm_public_ips
}


output "windows_vm_public_ip_addresses" {
  value = module.windows_virtual_machines.windows_vm_public_ip_addresses
}

output "windows_vm_names" {
  value = module.windows_virtual_machines.windows_vm_names
}

output "windows_vm_availability_set_id" {
  value = module.windows_virtual_machines.windows_vm_availability_set_id
}

output "windows_vm_subnet_id" {
  value = module.windows_virtual_machines.windows_vm_subnet_id
}

