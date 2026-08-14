output "key_vault_id" {
  value       = azurerm_key_vault.kv.id
  description = "Azure Key Vault ID"
}

output "key_vault_uri" {
  value       = azurerm_key_vault.kv.vault_uri
  description = "Azure Key Vault URI"
}

output "secret_values" {
  value       = { for k, s in azurerm_key_vault_secret.secrets : k => s.value }
  sensitive   = true
  description = "Map of secret names to secret values stored in Key Vault"
}

output "secret_ids" {
  value       = { for k, s in azurerm_key_vault_secret.secrets : k => s.id }
  description = "Map of secret names to secret IDs"
}
