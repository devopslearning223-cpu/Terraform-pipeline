variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure Region"
}

variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "address_space" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "VNet address space"
}

variable "subnets" {
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))
  description = "Map of user subnets"
}

variable "bastion_subnet_prefix" {
  type        = list(string)
  default     = ["10.0.4.0/26"]
  description = "Address prefix for AzureBastionSubnet"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource tags"
}
