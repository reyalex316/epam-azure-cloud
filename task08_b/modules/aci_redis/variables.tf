variable "redis_aci_name" {
  type        = string
  description = "Name of the Redis ACI container group"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for Redis ACI"
}

variable "location" {
  type        = string
  description = "Location for Redis ACI"
}

variable "sku" {
  type        = string
  description = "SKU of the ACI container group"
}

variable "key_vault_id" {
  type        = string
  description = "ID of the Key Vault to store Redis secrets"
}

variable "redis_secret_password_name" {
  type        = string
  description = "Name of the KV secret for Redis password"
}

variable "redis_secret_hostname_name" {
  type        = string
  description = "Name of the KV secret for Redis hostname"
}

variable "tags" {
  type        = map(string)
  description = "Tags for Redis ACI resources"
}