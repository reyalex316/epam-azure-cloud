name_prefix                = "cmtr-ph0p7o3b-mod8"
location                   = "eastus"
app_image_name             = "cmtr-ph0p7o3b-mod8-app"
git_repo_url               = "https://github.com/reyalex316/epam-azure-cloud"
acr_sku                    = "Basic"
redis_capacity             = 2
redis_sku                  = "Basic"
redis_family               = "C"
kv_sku                     = "standard"
redis_secret_key_name      = "redis-primary-key"
redis_secret_hostname_name = "redis-hostname"
aci_sku                    = "Standard"
aks_node_pool_name         = "system"
aks_node_count             = 1
aks_node_size              = "Standard_D2ads_v6"
aks_os_disk_type           = "Ephemeral"

tags = {
  Creator = "alejandro_villarreal@epam.com"
}