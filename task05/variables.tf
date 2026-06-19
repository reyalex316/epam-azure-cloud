variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
  }))
  description = "Map of resource group configurations"
}

variable "app_service_plans" {
  type = map(object({
    name         = string
    rg_key       = string
    sku_name     = string
    worker_count = number
  }))
  description = "Map of App Service Plan configurations"
}

variable "app_services" {
  type = map(object({
    name    = string
    rg_key  = string
    asp_key = string
  }))
  description = "Map of App Service configurations"
}

variable "traffic_manager" {
  type = object({
    name           = string
    rg_key         = string
    routing_method = string
  })
  description = "Traffic Manager profile configuration"
}

variable "allow_ip_rule_name" {
  type        = string
  description = "Name of the access restriction rule allowing the verification agent IP"
}

variable "allow_tm_rule_name" {
  type        = string
  description = "Name of the access restriction rule allowing Traffic Manager"
}

variable "verification_agent_ip" {
  type        = string
  description = "IP address of the verification agent allowed to access the App Services"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources"
}