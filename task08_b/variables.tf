variable "name_prefix" {
  type        = string
  description = "Prefix used to build all resource names"
}

variable "location" {
  type        = string
  description = "Azure region for all resources"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources"
}

variable "git_pat" {
  type        = string
  sensitive   = true
  description = "Personal Access Token for the Git repository"
}

variable "acr_sku" {
  type        = string
  description = "SKU of the Azure Container Registry"
}

variable "app_image_name" {
  type        = string
  description = "Name of the Docker image to build and deploy"
}

variable "kv_sku" {
  type        = string
  description = "SKU of the Key Vault"
}

variable "redis_secret_password_name" {
  type        = string
  description = "Name of the Key Vault secret for Redis password"
}

variable "redis_secret_hostname_name" {
  type        = string
  description = "Name of the Key Vault secret for Redis hostname"
}

variable "aci_sku" {
  type        = string
  description = "SKU of the Redis ACI"
}

variable "sa_container_name" {
  type        = string
  description = "Name of the Storage Account container"
}

variable "aks_node_pool_name" {
  type        = string
  description = "Name of the AKS default node pool"
}

variable "aks_node_count" {
  type        = number
  description = "Number of nodes in the AKS default node pool"
}

variable "aks_node_size" {
  type        = string
  description = "VM size of the AKS node pool"
}

variable "aks_os_disk_type" {
  type        = string
  description = "OS disk type for AKS node pool"
}