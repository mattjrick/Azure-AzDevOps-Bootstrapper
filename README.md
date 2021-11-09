# Azure-AzDevOps-Bootstrapper
This repository contains a Terraform bootstrapper module for configuring an existing Azure DevOps account with self-hosted Kubernetes build agents. 

## Prerequisites 
The following is required in order for this Terraform to work:
- An Azure Kubernetes cluster
- An Azure Container Registry
- An Azure DevOps Organisation
- Docker installed locally

## Pre-work
Follow these steps to set up your environment

### Get an Azure DevOps Token (PAT)
- Create your Azure DevOps organisation (if not already created)
- Go to the User Settings (top right hand corner)
- Select Personal Access Token
- Create a new token (Agent Pools - Read & Manage)
- Store the Personal Access Token in your tfvars or a safe place (_Do not publish this_)

### Set up your providers
- Clone the this repository locally
- Alter the following config lines in providers.tf 
'''
    storage_account_name  = <your_store_account_name>
    container_name        = <your_storage_container_name>
    key                   = <your_tfstate_file_name.tfstate>

    config_path = "~/.kube/config"
    config_context = "<your_kube_context>"
'''