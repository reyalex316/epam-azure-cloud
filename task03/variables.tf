variable "subnet_name" {
  type        = list(string)
  description = "Name of the subnets"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The Address space for Virtual Network"
}

variable "subnet1_address_prefix" {
  type        = list(string)
  description = "The prefix for the Subnet 01"
}

variable "subnet2_address_prefix" {
  type        = list(string)
  description = "The prefix for the Subnet 02"
}

variable "location" {
  type        = string
  description = "Azure region to all resources"
}

variable "tag" {
  type        = string
  description = "The tag to be assigned to all resources"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}
