locals {
  rg_name       = format("%s-rg", var.name_prefix)
  aci_name      = format("%s-ci", var.name_prefix)
  acr_name      = format("%scr", replace(var.name_prefix, "-", ""))
  aks_name      = format("%s-aks", var.name_prefix)
  keyvault_name = format("%s-kv", var.name_prefix)
  redis_name    = format("%s-redis", var.name_prefix)
}