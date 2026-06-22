variable "name_prefix" {
  type        = string
  description = "Prefix used to build all resource names"
}

variable "location" {
  type        = string
  description = "Azure region for all resources"
}

variable "rg_id" {
  type        = string
  description = "Resource ID of the pre-existing Resource Group to import"
}

variable "storage_account_id" {
  type        = string
  description = "Resource ID of the pre-existing Storage Account to import"
}

variable "fd_sku" {
  type        = string
  description = "SKU for the Front Door profile"
}

variable "blob_filename" {
  type        = string
  description = "Name of the blob file in the Storage Account"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all resources"
}