variable "name" {
  type        = string
  description = "Name of the Azure Resource Group"
}

variable "location" {
  type        = string
  description = "Azure Region for the Resource Group"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource tags"
}
