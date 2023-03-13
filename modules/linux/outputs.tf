output "azurerm_availability_set_id" {
  value = azurerm_availability_set.linux.id
}

output "vm_ids" {
  value = [azurerm_virtual_machine.linux.*.id]
}

output "vm_private_ips" {
  value = [azurerm_network_interface.linux_nic.*.private_ip_address]
}

output "vm_public_ips" {
  value = [azurerm_public_ip.linux_public_ip.*.ip_address]
}
output "vm_hostnames" {
  value = azurerm_virtual_machine.linux.*.name
}

output "vm_fqdns" {
  value = azurerm_public_ip.linux_public_ip.*.fqdn
}