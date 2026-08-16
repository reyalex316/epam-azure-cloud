name_prefix                = "cmtr-ph0p7o3b-mod8b"
location                   = "eastus"
acr_sku                    = "Basic"
app_image_name             = "cmtr-ph0p7o3b-mod8b-app"
kv_sku                     = "standard"
redis_secret_password_name = "redis-password"
redis_secret_hostname_name = "redis-hostname"
aci_sku                    = "Standard"
sa_container_name          = "app-content"
aks_node_pool_name         = "system"
aks_node_count             = 1
aks_node_size              = "Standard_D2ads_v6"
aks_os_disk_type           = "Ephemeral"

tags = {
  Creator = "alejandro_villarreal@epam.com"
}