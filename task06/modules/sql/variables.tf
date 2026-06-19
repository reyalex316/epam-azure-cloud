variable "resource_group_name" {
  type        = string
  description = "Resource Group where SQL resources are deployed"
}

variable "location" {
  type        = string
  description = "Location of the SQL resources"
}

variable "sql_server_name" {
  type        = string
  description = "Name of the SQL Server"
}

variable "sql_db_name" {
  type        = string
  description = "Name of the SQL Database"
}

variable "sql_sku" {
  type        = string
  description = "SKU/service tier of the SQL Database"
}

variable "admin_username" {
  type        = string
  description = "SQL admin username"
}

variable "key_vault_id" {
  type        = string
  description = "ID of the existing Key Vault to store secrets in"
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

variable "tags" {
  type        = map(string)
  description = "Tags applied to the SQL resources"
}