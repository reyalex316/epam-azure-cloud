variable "acr_login_server" {
  type        = string
  description = "Login server of the ACR"
}

variable "app_image_name" {
  type        = string
  description = "Name of the Docker image"
}

variable "kv_name" {
  type        = string
  description = "Name of the Key Vault"
}

variable "aks_kv_access_identity_id" {
  type        = string
  description = "Client ID of the AKS Key Vault secrets provider identity"
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID"
}

variable "redis_url_secret_name" {
  type        = string
  description = "Name of the KV secret for Redis hostname"
}

variable "redis_password_secret_name" {
  type        = string
  description = "Name of the KV secret for Redis password"
}

variable "k8s_manifests_path" {
  type        = string
  description = "Path to the k8s manifests directory"
}