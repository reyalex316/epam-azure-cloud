variable "rg_name" {
  type = string
  description = "Name of the Resource Group"
}

variable "rg_location" {
  type = string
  description = "Location of the Resource Group"
}

variable "rg_tag" {
  type = map(string)
  description = "Tag of the Resource Group"
}