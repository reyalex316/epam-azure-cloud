import {
  to = azurerm_resource_group.main
  id = "/subscriptions/afca76e1-8370-4362-a06b-13672e9a2e52/resourceGroups/cmtr-ph0p7o3b-mod7-rg"
}

import {
  to = azurerm_storage_account.main
  id = "/subscriptions/afca76e1-8370-4362-a06b-13672e9a2e52/resourceGroups/cmtr-ph0p7o3b-mod7-rg/providers/Microsoft.Storage/storageAccounts/cmtrph0p7o3bmod7sa"
}

resource "azurerm_resource_group" "main" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_storage_account" "main" {
  name                             = local.storage_account_name
  resource_group_name              = azurerm_resource_group.main.name
  location                         = azurerm_resource_group.main.location
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
  tags                             = var.tags
}

module "cdn" {
  source = "./modules/cdn"

  resource_group_name  = azurerm_resource_group.main.name
  fd_profile_name      = local.fd_profile_name
  fd_endpoint_name     = local.fd_endpoint_name
  fd_origin_group_name = local.fd_origin_group_name
  fd_origin_name       = local.fd_origin_name
  fd_route_name        = local.fd_route_name
  fd_sku               = var.fd_sku
  storage_blob_host    = azurerm_storage_account.main.primary_blob_host
  tags                 = var.tags
}