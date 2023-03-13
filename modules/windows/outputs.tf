output "windows_vm_public_ip_addresses" {
  value = azurerm_public_ip.windows_public_ip.*.ip_address
}

output "windows_vm_names" {
  value = [for i in range(var.vm_count) : "${var.vm_name_prefix}-${i+1}"]
}

output "windows_vm_availability_set_id" {
  value = azurerm_availability_set.windows.id
}

output "windows_vm_subnet_id" {
  value = var.subnet2_id
}
