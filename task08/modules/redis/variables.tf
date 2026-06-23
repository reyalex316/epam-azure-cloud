variable "redis_name" {
  type        = string
  description = "Name of the Redis Cache instance"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for Redis"
}

variable "location" {
  type        = string
  description = "Location for Redis"
}

variable "capacity" {
  type        = number
  description = "Capacity of Redis Cache"
}

variable "sku" {
  type        = string
  description = "SKU of Redis Cache"
}

variable "family" {
  type        = string
  description = "SKU family of Redis Cache"
}

variable "key_vault_id" {
  type        = string
  description = "ID of the Key Vault to store Redis secrets"
}

variable "redis_secret_key_name" {
  type        = string
  description = "Name of the Key Vault secret for Redis primary key"
}

variable "redis_secret_hostname_name" {
  type        = string
  description = "Name of the Key Vault secret for Redis hostname"
}

variable "tags" {
  type        = map(string)
  description = "Tags for Redis resources"
}