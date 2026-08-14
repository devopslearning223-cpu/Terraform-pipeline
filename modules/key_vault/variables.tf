variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "location" {
  type        = string
  description = "Azure Region"
}

variable "key_vault_name" {
  type        = string
  description = "Globally unique name for the Azure Key Vault"
}

variable "tenant_id" {
  type        = string
  description = "Azure AD Tenant ID"
}

variable "object_id" {
  type        = string
  description = "Object ID of the user or service principal creating secrets"
}

variable "secrets" {
  type        = map(string)
  default     = {}
  description = "Map of secret_name => secret_value to create in Key Vault"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource tags"
}
