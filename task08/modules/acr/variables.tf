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

variable "git_repo_url" {
  type        = string
  description = "URL of the Git repository"
}

variable "git_pat" {
  type        = string
  sensitive   = true
  description = "Personal Access Token for the Git repository"
}

variable "tags" {
  type        = map(string)
  description = "Tags for ACR resources"
}