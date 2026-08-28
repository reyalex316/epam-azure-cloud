variable "name_prefix" {
  type        = string
  description = "Naming prefix for all resources"
}

variable "location" {
  type        = string
  description = "Azure region for all resources"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the existing resource group"
}

variable "vnet_name" {
  type        = string
  description = "Name of the existing virtual network"
}

variable "aks_subnet_name" {
  type        = string
  description = "Name of the existing AKS subnet"
}

variable "aks_loadbalancer_ip" {
  type        = string
  description = "Public IP address of the AKS load balancer"
}

variable "fw_subnet_address_prefix" {
  type        = string
  description = "Address prefix for the Azure Firewall subnet"
}

variable "fw_pip_name" {
  type        = string
  description = "Name of the firewall public IP"
}

variable "fw_sku_name" {
  type        = string
  description = "SKU name for Azure Firewall"
}

variable "fw_sku_tier" {
  type        = string
  description = "SKU tier for Azure Firewall"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources"
}

variable "aks_cluster_name" {
  type        = string
  description = "Name of the existing AKS cluster"
}