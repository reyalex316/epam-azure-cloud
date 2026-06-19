variable "asp_name" {
  type        = string
  description = "Name of the App Service Plan"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group where the ASP is deployed"
}

variable "location" {
  type        = string
  description = "Location of the App Service Plan"
}

variable "sku_name" {
  type        = string
  description = "SKU of the App Service Plan"
}

variable "worker_count" {
  type        = number
  description = "Number of workers/instances for the ASP"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the ASP"
}