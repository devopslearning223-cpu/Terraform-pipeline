variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "location" {
  type        = string
  description = "Azure Region"
}

variable "bastion_name" {
  type        = string
  default     = "azure-bastion"
  description = "Azure Bastion host name"
}

variable "bastion_subnet_id" {
  type        = string
  description = "Azure Bastion Subnet ID"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource tags"
}
