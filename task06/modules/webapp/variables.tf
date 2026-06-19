variable "resource_group_name" {
  type        = string
  description = "Resource Group where the Web App resources are deployed"
}

variable "location" {
  type        = string
  description = "Location of the Web App resources"
}

variable "asp_name" {
  type        = string
  description = "Name of the App Service Plan"
}

variable "asp_sku" {
  type        = string
  description = "SKU of the App Service Plan"
}

variable "app_name" {
  type        = string
  description = "Name of the Linux Web App"
}

variable "dotnet_version" {
  type        = string
  description = "Dotnet version for the Web App"
}

variable "sql_connection_string" {
  type        = string
  description = "Connection string to the SQL Database"
  sensitive   = true
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the Web App resources"
}