data "archive_file" "app" {
  type        = "tar.gz"
  source_dir  = var.app_source_dir
  output_path = "${path.module}/app.tar.gz"
}

resource "time_static" "sas_start" {}

resource "time_offset" "sas_expiry" {
  offset_years = 1
}

resource "azurerm_storage_account" "main" {
  name                     = var.sa_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

resource "azurerm_storage_container" "main" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "app" {
  name                   = "app.tar.gz"
  storage_account_name   = azurerm_storage_account.main.name
  storage_container_name = azurerm_storage_container.main.name
  type                   = "Block"
  source                 = data.archive_file.app.output_path
}

data "azurerm_storage_account_blob_container_sas" "main" {
  connection_string = azurerm_storage_account.main.primary_connection_string
  container_name    = azurerm_storage_container.main.name
  https_only        = true
  start             = time_static.sas_start.rfc3339
  expiry            = time_offset.sas_expiry.rfc3339

  permissions {
    read   = true
    add    = false
    create = false
    write  = false
    delete = false
    list   = false
  }
}