module "resource_group" {
  source   = "./modules/resource_group"
  for_each = var.resource_groups

  rg_name     = each.value.name
  rg_location = each.value.location
  rg_tag      = var.tags
}

module "app_service_plan" {
  source   = "./modules/app_service_plan"
  for_each = var.app_service_plans

  asp_name            = each.value.name
  resource_group_name = module.resource_group[each.value.rg_key].rg_name
  location            = module.resource_group[each.value.rg_key].rg_location
  sku_name            = each.value.sku_name
  worker_count        = each.value.worker_count
  tags                = var.tags
}

module "app_service" {
  source   = "./modules/app_service"
  for_each = var.app_services

  app_name            = each.value.name
  resource_group_name = module.resource_group[each.value.rg_key].rg_name
  location            = module.resource_group[each.value.rg_key].rg_location
  service_plan_id     = module.app_service_plan[each.value.asp_key].asp_id
  tags                = var.tags

  ip_restrictions = [
    {
      name       = var.allow_ip_rule_name
      action     = "Allow"
      priority   = "100"
      ip_address = "${var.verification_agent_ip}/32"
    },
    {
      name        = var.allow_tm_rule_name
      action      = "Allow"
      priority    = "200"
      service_tag = "AzureTrafficManager"
    }
  ]
}

module "traffic_manager" {
  source = "./modules/traffic_manager"

  tm_name             = var.traffic_manager.name
  resource_group_name = module.resource_group[var.traffic_manager.rg_key].rg_name
  routing_method      = var.traffic_manager.routing_method
  tags                = var.tags

  endpoints = {
    for key, app in var.app_services : key => module.app_service[key].app_id
  }
}

provider "azurerm" {
  features {}
}
 