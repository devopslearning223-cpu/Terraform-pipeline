output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "Virtual Network ID"
}

output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "Virtual Network Name"
}

output "subnet_ids" {
  value       = { for k, s in azurerm_subnet.subnets : k => s.id }
  description = "Map of key to subnet IDs"
}

output "bastion_subnet_id" {
  value       = azurerm_subnet.bastion_subnet.id
  description = "Azure Bastion Subnet ID"
}
