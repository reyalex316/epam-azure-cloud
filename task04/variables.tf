variable "rg_name" {
  type        = string
  description = "Name of the resource group"
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The Address space for Virtual Network"
}

variable "subnet_address_prefix" {
  type        = list(string)
  description = "The prefix for the Subnet"
}

variable "nsg_name_http" {
  type        = string
  description = "Name of the NSG rule for HTTP"
}

variable "nsg_name_ssh" {
  type        = string
  description = "Name of the NSG rule for SSH"
}

variable "nic_name" {
  type        = string
  description = "Name of the network interface"
}

variable "public_ip_name" {
  type        = string
  description = "Name of the Public IP"
}

variable "dns_label" {
  type        = string
  description = "Name of the DNS label"
}

variable "nic_ip_config" {
  type        = string
  description = "Name of the IP Configuration on the NIC"
}

variable "os_disk_name" {
  type        = string
  description = "Name of the VM OS Disk"
}

variable "vm_admin" {
  type        = string
  description = "Name of the VM Admin account"
}

variable "vm_password" {
  type        = string
  sensitive   = true
  description = "Password for the VM Admin account"
}

variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine"
}

variable "nsg_name" {
  type        = string
  description = "Name of the network security group"
}

variable "location" {
  type        = string
  description = "Azure region to all resources"
}

variable "tag" {
  type        = string
  description = "The tag to be assigned to all resources"
}