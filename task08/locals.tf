locals {
  rg_name       = format("%s-rg", var.name_prefix)
  aci_name      = format("%s-ci", var.name_prefix)
  acr_name      = format("%scr", replace(var.name_prefix, "-", ""))
  aks_name      = format("%s-aks", var.name_prefix)
  keyvault_name = format("%s-kv", var.name_prefix)
  redis_name    = format("cmtr-ph0p7o3b-%s-mod8-redis", var.unique_id)
}