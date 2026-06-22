locals {
  rg_name              = format("%s-rg", var.name_prefix)
  storage_account_name = replace(var.name_prefix, "-", "")
  fd_profile_name      = format("%s-fd-profile", var.name_prefix)
  fd_endpoint_name     = format("%s-fd-endpoint", var.name_prefix)
  fd_origin_group_name = format("%s-fd-origin-group", var.name_prefix)
  fd_origin_name       = format("%s-fd-origin", var.name_prefix)
  fd_route_name        = "default"
}