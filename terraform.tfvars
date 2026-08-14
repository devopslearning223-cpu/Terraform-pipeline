resource_group_name = "rg-aitesting-dev-01"
location            = "eastus"
vnet_name           = "vnet-aitesting-01"
vnet_address_space  = ["10.0.0.0/16"]

subnets = {
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

bastion_subnet_prefix = ["10.0.4.0/26"]
bastion_name          = "bastion-aitesting-01"
lb_name               = "lb-aitesting-01"
key_vault_name        = "kv-aitest-dev-01"
admin_username        = "azureuser"
admin_password        = "P@ssw0rd12345!"

tags = {
  Environment = "Dev"
  Project     = "AITesting-Infrastructure"
  Owner       = "Kuldip"
  ManagedBy   = "Terraform"
}
