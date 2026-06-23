variable "aci_name" {
  type        = string
  description = "Name of the Azure Container Instance"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for ACI"
}

variable "location" {
  type        = string
  description = "Location for ACI"
}

variable "sku" {
  type        = string
  description = "SKU of the ACI"
}

variable "acr_login_server" {
  type        = string
  description = "Login server of the ACR"
}

variable "acr_admin_username" {
  type        = string
  description = "Admin username of the ACR"
}

variable "acr_admin_password" {
  type        = string
  sensitive   = true
  description = "Admin password of the ACR"
}

variable "app_image_name" {
  type        = string
  description = "Name of the Docker image"
}

variable "redis_hostname" {
  type        = string
  description = "Hostname of the Redis Cache"
}

variable "redis_primary_key" {
  type        = string
  sensitive   = true
  description = "Primary access key of the Redis Cache"
}

variable "dns_name_label" {
  type        = string
  description = "DNS name label for the container group"
}

variable "tags" {
  type        = map(string)
  description = "Tags for ACI resources"
}