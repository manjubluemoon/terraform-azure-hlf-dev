terraform {
  required_version = ">= 0.13"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    kubectl = {
      source = "hashicorp/kubectl"
    }
    null = {
      source = "hashicorp/null"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

provider "kubectl" {
  config_path = var.kubeconfig_path
}

provider "null" {}

provider "random" {}
