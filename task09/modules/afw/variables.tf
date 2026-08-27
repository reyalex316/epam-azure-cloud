variable "name_prefix" {
  type        = string
  description = "Naming prefix for all resources"
}

variable "location" {
  type        = string
  description = "Azure region for firewall resources"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group where firewall is deployed"
}

variable "vnet_name" {
  type        = string
  description = "Name of the existing virtual network"
}

variable "vnet_id" {
  type        = string
  description = "ID of the existing virtual network"
}

variable "aks_subnet_id" {
  type        = string
  description = "ID of the AKS subnet for route table association"
}

variable "aks_loadbalancer_ip" {
  type        = string
  description = "Public IP of the AKS load balancer for NAT rules"
}

variable "fw_subnet_address_prefix" {
  type        = string
  description = "Address prefix for the Azure Firewall subnet"
}

variable "fw_pip_name" {
  type        = string
  description = "Name of the firewall public IP resource"
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
  description = "Tags for all firewall resources"
}