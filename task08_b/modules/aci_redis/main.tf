resource "random_password" "redis" {
  length           = 16
  special          = true
  override_special = "!#%&*()-_=+[]{}:?"
}

resource "azurerm_container_group" "redis" {
  name                = var.redis_aci_name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = "Public"
  dns_name_label      = var.redis_aci_name
  os_type             = "Linux"
  sku                 = var.sku
  tags                = var.tags

  container {
    name   = "redis"
    image  = "mcr.microsoft.com/oss/bitnami/redis:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 6379
      protocol = "TCP"
    }

    commands = ["redis-server", "--protected-mode", "no", "--requirepass", random_password.redis.result]
  }
}

resource "azurerm_key_vault_secret" "redis_hostname" {
  name         = var.redis_secret_hostname_name
  value        = azurerm_container_group.redis.fqdn
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "redis_password" {
  name         = var.redis_secret_password_name
  value        = random_password.redis.result
  key_vault_id = var.key_vault_id
}