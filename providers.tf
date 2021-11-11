terraform {
  backend "azurerm" {
      resource_group_name   = "tfstate"
      storage_account_name  = "tfstate12345"
      container_name        = "tfstate"
      key                   = "example.tfstate"
  }
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = "2.8.0"
    }
    azuredevops = {
      source = "microsoft/azuredevops"
      version = "0.1.7"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.6.1"
    }
  }
}

provider "kubernetes" {
    config_path = "~/.kube/config"
    config_context = "my-kube-cluster"
}

provider "azurerm" {
  features {}
}

provider "azuread" {
}