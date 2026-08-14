output "vm_ids" {
  value       = { for k, vm in azurerm_linux_virtual_machine.vm : k => vm.id }
  description = "Map of VM names/keys to VM IDs"
}

output "nic_ids" {
  value       = { for k, nic in azurerm_network_interface.nic : k => nic.id }
  description = "Map of VM names/keys to Network Interface IDs"
}

output "private_ip_addresses" {
  value       = { for k, nic in azurerm_network_interface.nic : k => nic.private_ip_address }
  description = "Map of VM names/keys to Private IP addresses"
}
