variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "location" {
  type        = string
  description = "Azure Region"
}

variable "vm_configs" {
  type = map(object({
    name      = string
    subnet_id = string
    vm_size   = string
  }))
  description = "Map of VM configurations"
}

variable "admin_username" {
  type        = string
  default     = "azureuser"
  description = "Admin username for VMs"
}

variable "admin_password" {
  type        = string
  default     = "P@ssw0rd12345!"
  sensitive   = true
  description = "Admin password for VMs"
}

variable "ssh_public_key" {
  type        = string
  default     = null
  description = "SSH public key string (optional). If set, password authentication will be disabled."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource tags"
}
