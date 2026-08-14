# Fetch Azure Client & Tenant Config
data "azurerm_client_config" "current" {}

# 1. Resource Group Module
module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# 2. Virtual Network & Subnets Module
module "vnet" {
  source                = "./modules/vnet"
  resource_group_name   = module.resource_group.name
  location              = module.resource_group.location
  vnet_name             = var.vnet_name
  address_space         = var.vnet_address_space
  subnets               = var.subnets
  bastion_subnet_prefix = var.bastion_subnet_prefix
  tags                  = var.tags
}

# 3. Azure Key Vault & Secrets Module
module "key_vault" {
  source              = "./modules/key_vault"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  key_vault_name      = var.key_vault_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id
  tags                = var.tags

  secrets = {
    "vm-admin-username" = var.admin_username
    "vm-admin-password" = var.admin_password
  }
}

# 4. Virtual Machines Module (1 VM in each of the 3 subnets using Key Vault secrets)
module "vm" {
  source              = "./modules/vm"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  admin_username      = module.key_vault.secret_values["vm-admin-username"]
  admin_password      = module.key_vault.secret_values["vm-admin-password"]
  ssh_public_key      = var.ssh_public_key
  tags                = var.tags

  vm_configs = {
    vm_subnet_1 = {
      name      = "vm-subnet-1"
      subnet_id = module.vnet.subnet_ids["subnet_1"]
      vm_size   = "Standard_B1s"
    }
    vm_subnet_2 = {
      name      = "vm-subnet-2"
      subnet_id = module.vnet.subnet_ids["subnet_2"]
      vm_size   = "Standard_B1s"
    }
    vm_subnet_3 = {
      name      = "vm-subnet-3"
      subnet_id = module.vnet.subnet_ids["subnet_3"]
      vm_size   = "Standard_B1s"
    }
  }
}

# 5. Azure Bastion Host Module
module "bastion" {
  source              = "./modules/bastion"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  bastion_name        = var.bastion_name
  bastion_subnet_id   = module.vnet.bastion_subnet_id
  tags                = var.tags
}

# 6. Load Balancer Module
module "load_balancer" {
  source              = "./modules/load_balancer"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  lb_name             = var.lb_name
  nic_ids             = module.vm.nic_ids
  tags                = var.tags
}