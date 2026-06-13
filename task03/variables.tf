variable "prefix" {
  type        = string
  description = "Prefix used for project"
}

variable "suffix_rg" {
  type        = string
  description = "Suffix used for Resource Group"
}

variable "suffix_vnet" {
  type        = string
  description = "Suffix used for Virtual Nets"
}

variable "suffix_storage" {
  type        = string
  description = "Suffix used for Storage"
}

variable "subnet_name" {
  type        = list(string)
  description = "Name of the subnets"
}

variable "project_code" {
  type        = string
  description = "Unique project code"
}

variable "project_code_short" {
  type        = string
  description = "Short version of project code"
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
