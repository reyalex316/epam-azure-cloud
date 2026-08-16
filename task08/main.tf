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

module "redis" {
  source                     = "./modules/redis"
  redis_name                 = local.redis_name
  resource_group_name        = azurerm_resource_group.main.name
  location                   = azurerm_resource_group.main.location
  capacity                   = var.redis_capacity
  sku                        = var.redis_sku
  family                     = var.redis_family
  key_vault_id               = module.keyvault.key_vault_id
  redis_secret_key_name      = var.redis_secret_key_name
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
  git_repo_url        = var.git_repo_url
  git_pat             = var.git_pat
  tags                = var.tags
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

module "aci" {
  source              = "./modules/aci"
  aci_name            = local.aci_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = var.aci_sku
  acr_login_server    = module.acr.login_server
  acr_admin_username  = module.acr.admin_username
  acr_admin_password  = module.acr.admin_password
  app_image_name      = var.app_image_name
  redis_hostname      = module.redis.hostname
  redis_primary_key   = module.redis.primary_access_key
  dns_name_label      = local.aci_name
  tags                = var.tags

  depends_on = [module.acr, module.redis]
}

resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile("${path.module}/k8s-manifests/secret-provider.yaml.tftpl", {
    aks_kv_access_identity_id  = module.aks.kv_access_identity_id
    kv_name                    = local.keyvault_name
    redis_url_secret_name      = var.redis_secret_hostname_name
    redis_password_secret_name = var.redis_secret_key_name
    tenant_id                  = data.azurerm_client_config.current.tenant_id
  })

  depends_on = [module.aks]
}

resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile("${path.module}/k8s-manifests/deployment.yaml.tftpl", {
    acr_login_server = module.acr.login_server
    app_image_name   = var.app_image_name
    image_tag        = "latest"
  })

  wait_for {
    field {
      key   = "status.availableReplicas"
      value = "1"
    }
  }

  depends_on = [kubectl_manifest.secret_provider, module.aks, module.acr]
}

resource "kubectl_manifest" "service" {
  yaml_body = file("${path.module}/k8s-manifests/service.yaml")

  wait_for {
    field {
      key        = "status.loadBalancer.ingress.[0].ip"
      value      = "^(\\d+(\\.|$)){4}"
      value_type = "regex"
    }
  }

  depends_on = [kubectl_manifest.deployment]
}

data "kubernetes_service" "app" {
  metadata {
    name = "redis-flask-app-service"
  }

  depends_on = [kubectl_manifest.service]
}