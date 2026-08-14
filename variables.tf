variable "resource_group_name" {
  type        = string
  default     = "rg-aitesting-dev-01"
  description = "Name of the Azure Resource Group"
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "Azure Region for deployment"
}

variable "vnet_name" {
  type        = string
  default     = "vnet-aitesting-01"
  description = "Name of the Virtual Network"
}

variable "vnet_address_space" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "Address space for VNet"
}

variable "subnets" {
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))

  default = {
    subnet_1 = {
      name             = "subnet-frontend"
      address_prefixes = ["10.0.1.0/24"]
    }

    subnet_2 = {
      name             = "subnet-backend"
      address_prefixes = ["10.0.2.0/24"]
    }

    subnet_3 = {
      name             = "subnet-database"
      address_prefixes = ["10.0.3.0/24"]
    }
  }

  description = "Map of 3 workload subnets"
}

variable "bastion_subnet_prefix" {
  type        = list(string)
  default     = ["10.0.4.0/26"]
  description = "Prefix for AzureBastionSubnet"
}

variable "admin_username" {
  type        = string
  default     = "azureuser"
  description = "VM Admin Username"
}

variable "admin_password" {
  type        = string
  default     = "P@ssw0rd12345!"
  sensitive   = true
  description = "VM Admin Password"
}

variable "ssh_public_key" {
  type        = string
  default     = null
  description = "Optional SSH Public Key string"
}

variable "bastion_name" {
  type        = string
  default     = "bastion-aitesting-01"
  description = "Azure Bastion host name"
}

variable "lb_name" {
  type        = string
  default     = "lb-aitesting-01"
  description = "Load Balancer Name"
}

variable "key_vault_name" {
  type        = string
  default     = "kv-aitest-dev-01"
  description = "Globally unique Azure Key Vault Name"
}

variable "tags" {
  type = map(string)

  default = {
    Environment = "Dev"
    Project     = "AITesting-Infrastructure"
    ManagedBy   = "Terraform"
  }

  description = "Common Tags"
}