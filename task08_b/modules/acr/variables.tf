variable "acr_name" {
  type        = string
  description = "Name of the Azure Container Registry"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for ACR"
}

variable "location" {
  type        = string
  description = "Location for ACR"
}

variable "sku" {
  type        = string
  description = "SKU of the ACR"
}

variable "app_image_name" {
  type        = string
  description = "Name of the Docker image to build"
}

variable "blob_url" {
  type        = string
  description = "URL of the application archive blob"
}

variable "sas_token" {
  type        = string
  sensitive   = true
  description = "SAS token for blob container access"
}

variable "tags" {
  type        = map(string)
  description = "Tags for ACR resources"
}