# Azure-AzDevOps-Bootstrapper
This repository contains Terraform code which:
- Creates (self-hosted) Kubernetes build agents. 
- Creates a new project within your Azure DevOps organisation
- Creates a service connection to your in-scope Azure subscription (az account show) with Contributor privileges

## Prerequisites 
The following is required in order for this Terraform to work:
- An Azure Kubernetes cluster
- An Azure Container Registry
- An Azure DevOps Organisation
- Docker installed locally

## Pre-work
Follow these steps to set up your environment

### Clone this repository
- From the repository, click + in the global sidebar and select Clone this repository under Get to work.
- Copy the clone command (either the SSH format or the HTTPS). If you are using the SSH protocol, ensure your public key is in Bitbucket and loaded on the local system to which you are cloning.
- From a terminal window, change to the local directory where you want to clone your repository.

### Build the agent Docker image
- Fill in the ACR name and ACR address within the ./azdevagent/build.sh script
- Run the build.sh script

### Get an Azure DevOps Token (PAT)
- Create your Azure DevOps organisation (if not already created)
- Go to the User Settings (top right hand corner)
- Select Personal Access Token
- Create a new token (Agent Pools - Read & Manage)
- Store the Personal Access Token in your tfvars or a safe place (_Do not publish this_)

### Set up a provider backend
_If you do not already have a provider backend_
- Run the backend creation script ./Scripts/create_backend.sh _or_ ./Scripts/create_backend.ps1 

### Set up your providers
- Alter the following config lines in providers.tf
 
        storage_account_name  = <your_store_account_name>
        container_name        = <your_storage_container_name>
        key                   = <your_tfstate_file_name.tfstate>
        config_path           = "~/.kube/config"
        config_context        = "<your_kube_context>"
        
### Create your tfvars 
- Create a terraform.tfvars file in the root of the project
- Fill in the variables found below

        azure_devops_personal_access_token = 
        azure_devops_org_name = 
        azure_devops_container_agent_name = 
        agent_pool_name = 
        acr_url = 
        kube_dep_label_name = 
        azure_devops_project_name = 