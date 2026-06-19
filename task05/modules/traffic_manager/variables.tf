variable "tm_name" {
  type        = string
  description = "Name of the Traffic Manager profile"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group where the TM profile is deployed"
}

variable "routing_method" {
  type        = string
  description = "Traffic Manager routing method"
}

variable "endpoints" {
  type        = map(string)
  description = "Map of endpoint name to App Service resource ID"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the Traffic Manager profile"
}