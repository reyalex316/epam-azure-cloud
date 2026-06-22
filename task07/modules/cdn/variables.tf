variable "resource_group_name" {
  type        = string
  description = "Resource group where Front Door resources are deployed"
}

variable "fd_profile_name" {
  type        = string
  description = "Name of the Front Door profile"
}

variable "fd_endpoint_name" {
  type        = string
  description = "Name of the Front Door endpoint"
}

variable "fd_origin_group_name" {
  type        = string
  description = "Name of the Front Door origin group"
}

variable "fd_origin_name" {
  type        = string
  description = "Name of the Front Door origin"
}

variable "fd_route_name" {
  type        = string
  description = "Name of the Front Door route"
}

variable "fd_sku" {
  type        = string
  description = "SKU of the Front Door profile"
}

variable "storage_blob_host" {
  type        = string
  description = "Primary blob host of the Storage Account used as CDN origin"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to Front Door resources"
}