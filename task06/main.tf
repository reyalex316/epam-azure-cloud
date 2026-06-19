data "azurerm_key_vault" "existing" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_rg_name
}

resource "azurerm_resource_group" "main" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

module "sql" {
  source                  = "./modules/sql"
  resource_group_name     = azurerm_resource_group.main.name
  location                = azurerm_resource_group.main.location
  sql_server_name         = local.sql_server_name
  sql_db_name             = local.sql_db_name
  sql_sku                 = var.sql_sku
  admin_username          = var.sql_admin_username
  key_vault_id            = data.azurerm_key_vault.existing.id
  kv_secret_username_name = var.kv_secret_username_name
  kv_secret_password_name = var.kv_secret_password_name
  firewall_rule_name      = var.firewall_rule_name
  allowed_ip_address      = var.allowed_ip_address
  tags                    = var.tags
}

module "webapp" {
  source                = "./modules/webapp"
  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  asp_name              = local.asp_name
  asp_sku               = var.asp_sku
  app_name              = local.app_name
  dotnet_version        = var.dotnet_version
  sql_connection_string = module.sql.sql_connection_string
  tags                  = var.tags
}