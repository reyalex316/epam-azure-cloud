variable "name_prefix" {
  type        = string
  description = "Prefix used to build resource names"
}

variable "location" {
  type        = string
  description = "Azure region for all resources"
}

variable "key_vault_name" {
  type        = string
  description = "Name of the existing Key Vault"
}

variable "key_vault_rg_name" {
  type        = string
  description = "Resource Group of the existing Key Vault"
}

variable "sql_admin_username" {
  type        = string
  description = "SQL admin username"
}

variable "sql_sku" {
  type        = string
  description = "SKU/service tier of the SQL Database"
}

variable "kv_secret_username_name" {
  type        = string
  description = "Name of the Key Vault secret storing the SQL admin username"
}

variable "kv_secret_password_name" {
  type        = string
  description = "Name of the Key Vault secret storing the SQL admin password"
}

variable "firewall_rule_name" {
  type        = string
  description = "Name of the firewall rule allowing the verification IP"
}

variable "allowed_ip_address" {
  type        = string
  description = "IP address allowed to connect to the SQL Server"
}

variable "asp_sku" {
  type        = string
  description = "SKU of the App Service Plan"
}

variable "dotnet_version" {
  type        = string
  description = "Dotnet version for the Web App"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources"
}