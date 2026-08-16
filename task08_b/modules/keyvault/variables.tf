variable "keyvault_name" {
  type        = string
  description = "Name of the Key Vault"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for Key Vault"
}

variable "location" {
  type        = string
  description = "Location for Key Vault"
}

variable "sku" {
  type        = string
  description = "SKU of the Key Vault"
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID"
}

variable "current_user_object_id" {
  type        = string
  description = "Object ID of current user for full secret access"
}

variable "tags" {
  type        = map(string)
  description = "Tags for Key Vault"
}