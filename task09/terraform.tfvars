name_prefix              = "cmtr-ph0p7o3b-mod9"
location                 = "eastus"
resource_group_name      = "cmtr-ph0p7o3b-mod9-rg"
vnet_name                = "cmtr-ph0p7o3b-mod9-vnet"
aks_subnet_name          = "aks-snet"
aks_loadbalancer_ip      = "128.203.101.233"
fw_subnet_address_prefix = "10.0.1.0/26"
fw_pip_name              = "cmtr-ph0p7o3b-mod9-pip"
fw_sku_name              = "AZFW_VNet"
fw_sku_tier              = "Standard"

tags = {
  Creator = "alejandro_villarreal@epam.com"
}