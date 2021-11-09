terraform {
  backend "azurerm" {
      resource_group_name   = "tfstate"
      storage_account_name  = "tfstate11420"
      container_name        = "tfstate"
      key                   = "example.tfstate"
  }
  required_providers {
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
    config_context = "mattrs-aks-cluster"
}