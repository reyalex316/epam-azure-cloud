terraform {
  required_version = ">= 1.5.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.110.0, < 4.0.0"
    }
    kubectl = {
      source  = "alekc/kubectl"
      version = "~> 2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

provider "kubectl" {
  host                   = try(module.aks.kube_config.host, null)
  client_certificate     = try(base64decode(module.aks.kube_config.client_certificate), null)
  client_key             = try(base64decode(module.aks.kube_config.client_key), null)
  cluster_ca_certificate = try(base64decode(module.aks.kube_config.cluster_ca_certificate), null)
  load_config_file       = false
}

provider "kubernetes" {
  host                   = try(module.aks.kube_config.host, null)
  client_certificate     = try(base64decode(module.aks.kube_config.client_certificate), null)
  client_key             = try(base64decode(module.aks.kube_config.client_key), null)
  cluster_ca_certificate = try(base64decode(module.aks.kube_config.cluster_ca_certificate), null)
}