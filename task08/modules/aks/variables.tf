variable "aks_name" {
  type        = string
  description = "Name of the AKS cluster"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for AKS"
}

variable "location" {
  type        = string
  description = "Location for AKS"
}

variable "node_pool_name" {
  type        = string
  description = "Name of the default node pool"
}

variable "node_count" {
  type        = number
  description = "Number of nodes in the default node pool"
}

variable "node_size" {
  type        = string
  description = "VM size of the default node pool nodes"
}

variable "os_disk_type" {
  type        = string
  description = "OS disk type for the node pool"
}

variable "acr_id" {
  type        = string
  description = "ID of the ACR for role assignment"
}

variable "key_vault_id" {
  type        = string
  description = "ID of the Key Vault for access policy"
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID for Key Vault access policy"
}

variable "tags" {
  type        = map(string)
  description = "Tags for AKS resources"
}