data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "main" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

module "keyvault" {
  source                 = "./modules/keyvault"
  keyvault_name          = local.keyvault_name
  resource_group_name    = azurerm_resource_group.main.name
  location               = azurerm_resource_group.main.location
  sku                    = var.kv_sku
  tenant_id              = data.azurerm_client_config.current.tenant_id
  current_user_object_id = data.azurerm_client_config.current.object_id
  tags                   = var.tags
}

module "storage" {
  source              = "./modules/storage"
  sa_name             = local.sa_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  container_name      = var.sa_container_name
  app_source_dir      = "${path.module}/application"
  tags                = var.tags
}

module "aci_redis" {
  source                     = "./modules/aci_redis"
  redis_aci_name             = local.redis_aci_name
  resource_group_name        = azurerm_resource_group.main.name
  location                   = azurerm_resource_group.main.location
  sku                        = var.aci_sku
  key_vault_id               = module.keyvault.key_vault_id
  redis_secret_password_name = var.redis_secret_password_name
  redis_secret_hostname_name = var.redis_secret_hostname_name
  tags                       = var.tags

  depends_on = [module.keyvault]
}

module "acr" {
  source              = "./modules/acr"
  acr_name            = local.acr_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = var.acr_sku
  app_image_name      = var.app_image_name
  blob_url            = module.storage.blob_url
  sas_token           = module.storage.sas_token
  tags                = var.tags

  depends_on = [module.storage]
}

module "aks" {
  source              = "./modules/aks"
  aks_name            = local.aks_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  node_pool_name      = var.aks_node_pool_name
  node_count          = var.aks_node_count
  node_size           = var.aks_node_size
  os_disk_type        = var.aks_os_disk_type
  acr_id              = module.acr.acr_id
  key_vault_id        = module.keyvault.key_vault_id
  tenant_id           = data.azurerm_client_config.current.tenant_id
  tags                = var.tags

  depends_on = [module.acr, module.keyvault]
}

module "aca" {
  source                   = "./modules/aca"
  aca_name                 = local.aca_name
  aca_env_name             = local.aca_env_name
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  acr_id                   = module.acr.acr_id
  acr_login_server         = module.acr.login_server
  app_image_name           = var.app_image_name
  key_vault_id             = module.keyvault.key_vault_id
  tenant_id                = data.azurerm_client_config.current.tenant_id
  redis_hostname_secret_id = "${module.keyvault.key_vault_uri}secrets/${var.redis_secret_hostname_name}"
  redis_password_secret_id = "${module.keyvault.key_vault_uri}secrets/${var.redis_secret_password_name}"
  tags                     = var.tags

  depends_on = [module.acr, module.keyvault, module.aci_redis]
}

module "k8s" {
  source                     = "./modules/k8s"
  acr_login_server           = module.acr.login_server
  app_image_name             = var.app_image_name
  kv_name                    = local.keyvault_name
  aks_kv_access_identity_id  = module.aks.kv_access_identity_id
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  redis_url_secret_name      = var.redis_secret_hostname_name
  redis_password_secret_name = var.redis_secret_password_name
  k8s_manifests_path         = "${path.module}/k8s-manifests"

  depends_on = [module.aks, module.acr, module.aci_redis]
}