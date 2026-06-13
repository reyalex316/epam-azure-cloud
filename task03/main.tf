resource "azurerm_resource_group" "rg_name" {
  name     = "${var.prefix}-${var.project_code}-${var.suffix_rg}"
  location = var.location
  tags     = { Creator = "${var.tag}" }
}

resource "azurerm_storage_account" "storage_name" {
  name                     = "${var.prefix}${var.project_code_short}${var.suffix_storage}"
  resource_group_name      = azurerm_resource_group.rg_name.name
  location                 = azurerm_resource_group.rg_name.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags                     = { Creator = "${var.tag}" }
}

resource "azurerm_virtual_network" "vnet_name" {
  name                = "${var.prefix}-${var.project_code}-${var.suffix_vnet}"
  location            = azurerm_resource_group.rg_name.location
  resource_group_name = azurerm_resource_group.rg_name.name
  address_space       = var.vnet_address_space
  tags                = { Creator = "${var.tag}" }
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet_name[0]
  resource_group_name  = azurerm_resource_group.rg_name.name
  virtual_network_name = azurerm_virtual_network.vnet_name.name
  address_prefixes     = var.subnet1_address_prefix
}

resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet_name[1]
  resource_group_name  = azurerm_resource_group.rg_name.name
  virtual_network_name = azurerm_virtual_network.vnet_name.name
  address_prefixes     = var.subnet2_address_prefix
}

provider "azurerm" {
  features {}
}
 