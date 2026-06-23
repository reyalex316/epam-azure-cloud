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
  description = "Personal Access Token for the Git repository containing the application source code"
}

variable "git_repo_url" {
  type        = string
  description = "URL of the Git repository containing the application source code"
}

variable "app_image_name" {
  type        = string
  description = "Name of the Docker image to build and deploy"
}

variable "acr_sku" {
  type        = string
  description = "SKU of the Azure Container Registry"
}

variable "redis_capacity" {
  type        = number
  description = "Capacity of the Redis Cache instance"
}

variable "redis_sku" {
  type        = string
  description = "SKU of the Redis Cache instance"
}

variable "redis_family" {
  type        = string
  description = "SKU family of the Redis Cache instance"
}

variable "kv_sku" {
  type        = string
  description = "SKU of the Key Vault"
}

variable "redis_secret_key_name" {
  type        = string
  description = "Name of the Key Vault secret storing the Redis primary key"
}

variable "redis_secret_hostname_name" {
  type        = string
  description = "Name of the Key Vault secret storing the Redis hostname"
}

variable "aci_sku" {
  type        = string
  description = "SKU of the Azure Container Instance"
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
  description = "VM size of the AKS default node pool nodes"
}

variable "aks_os_disk_type" {
  type        = string
  description = "OS disk type for AKS node pool"
}