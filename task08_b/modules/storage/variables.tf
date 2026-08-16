variable "sa_name" {
  type        = string
  description = "Name of the Storage Account"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for Storage Account"
}

variable "location" {
  type        = string
  description = "Location for Storage Account"
}

variable "container_name" {
  type        = string
  description = "Name of the blob container"
}

variable "app_source_dir" {
  type        = string
  description = "Path to the application source directory to archive"
}

variable "tags" {
  type        = map(string)
  description = "Tags for Storage Account"
}