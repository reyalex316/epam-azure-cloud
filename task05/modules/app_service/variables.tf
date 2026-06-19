variable "app_name" {
  type        = string
  description = "Name of the Windows Web App"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group where the app is deployed"
}

variable "location" {
  type        = string
  description = "Location of the Web App"
}

variable "service_plan_id" {
  type        = string
  description = "ID of the App Service Plan hosting this app"
}

variable "ip_restrictions" {
  type        = list(map(string))
  description = "List of ip_restriction rules (allow-ip, allow-tm)"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the Web App"
}