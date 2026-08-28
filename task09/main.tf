data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "aks" {
  name                 = var.aks_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}

module "afw" {
  source = "./modules/afw"

  name_prefix              = var.name_prefix
  location                 = var.location
  resource_group_name      = var.resource_group_name
  vnet_name                = var.vnet_name
  vnet_id                  = data.azurerm_virtual_network.main.id
  aks_subnet_id            = data.azurerm_subnet.aks.id
  aks_loadbalancer_ip      = var.aks_loadbalancer_ip
  aks_cluster_name         = var.aks_cluster_name
  fw_subnet_address_prefix = var.fw_subnet_address_prefix
  fw_pip_name              = var.fw_pip_name
  fw_sku_name              = var.fw_sku_name
  fw_sku_tier              = var.fw_sku_tier
  tags                     = var.tags
}