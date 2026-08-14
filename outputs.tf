output "resource_group_name" {
  value       = module.resource_group.name
  description = "Created Azure Resource Group Name"
}

output "vnet_name" {
  value       = module.vnet.vnet_name
  description = "Created Virtual Network Name"
}

output "subnet_ids" {
  value       = module.vnet.subnet_ids
  description = "Created Workload Subnet IDs"
}

output "bastion_subnet_id" {
  value       = module.vnet.bastion_subnet_id
  description = "Created AzureBastionSubnet ID"
}

output "vm_private_ips" {
  value       = module.vm.private_ip_addresses
  description = "Private IP addresses of VMs in each subnet"
}

output "bastion_public_ip" {
  value       = module.bastion.bastion_public_ip
  description = "Public IP address of Azure Bastion Host"
}

output "load_balancer_public_ip" {
  value       = module.load_balancer.lb_public_ip
  description = "Public IP address of Load Balancer"
}

output "key_vault_uri" {
  value       = module.key_vault.key_vault_uri
  description = "URI of Azure Key Vault"
}
