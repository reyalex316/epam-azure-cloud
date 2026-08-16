locals {
  rg_name        = format("%s-rg", var.name_prefix)
  aca_name       = format("%s-ca", var.name_prefix)
  aca_env_name   = format("%s-cae", var.name_prefix)
  acr_name       = format("%scr", replace(var.name_prefix, "-", ""))
  aks_name       = format("%s-aks", var.name_prefix)
  keyvault_name  = format("%s-kv", var.name_prefix)
  redis_aci_name = format("%s-redis-ci", var.name_prefix)
  sa_name        = format("%ssa", replace(var.name_prefix, "-", ""))
}