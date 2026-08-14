output "name" {
  value       = azurerm_resource_group.rg.name
  description = "Resource Group Name"
}

output "location" {
  value       = azurerm_resource_group.rg.location
  description = "Resource Group Location"
}

output "id" {
  value       = azurerm_resource_group.rg.id
  description = "Resource Group ID"
}
