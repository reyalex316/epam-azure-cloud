variable "aca_name" {
  type        = string
  description = "Name of the Azure Container App"
}

variable "aca_env_name" {
  type        = string
  description = "Name of the Azure Container App Environment"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for ACA"
}

variable "location" {
  type        = string
  description = "Location for ACA"
}

variable "acr_id" {
  type        = string
  description = "ID of the ACR for AcrPull role"
}

variable "acr_login_server" {
  type        = string
  description = "Login server of the ACR"
}

variable "app_image_name" {
  type        = string
  description = "Name of the Docker image"
}

variable "key_vault_id" {
  type        = string
  description = "ID of the Key Vault"
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID"
}

variable "redis_hostname_secret_id" {
  type        = string
  description = "Key Vault secret ID for Redis hostname"
}

variable "redis_password_secret_id" {
  type        = string
  description = "Key Vault secret ID for Redis password"
}

variable "tags" {
  type        = map(string)
  description = "Tags for ACA resources"
}