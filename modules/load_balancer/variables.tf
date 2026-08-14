variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "location" {
  type        = string
  description = "Azure Region"
}

variable "lb_name" {
  type        = string
  default     = "azure-load-balancer"
  description = "Load Balancer Name"
}

variable "nic_ids" {
  type        = map(string)
  default     = {}
  description = "Map of key -> Network Interface ID to associate with Load Balancer Backend Pool"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource tags"
}
