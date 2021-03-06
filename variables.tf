variable "azure_devops_personal_access_token" {
    description = "The personal access token to be used to access Azure DevOps"
    type        = string
}

variable "azure_devops_org_name" {
    description = "The organisation name for your Azure DevOps account"
    type        = string
}

variable "azure_devops_container_agent_name" {
    description = "The displayed container name for the Azure Dev Ops agent"
    type        = string
    default     = "azure-devops-agent"
}

variable "azure_devops_project_name" {
    description = "Name of the Azure DevOps project to be created"
    type        = string
}

variable "agent_pool_name" {
    description = "Name of the agent pool that you want to create"
    type        = string
    default     = "aks-agents"
}

variable "acr_url" {
    description = "URL for the ACR being used to store the Azure DevOps agent image i.e. myexampleacr.azurecr.io"
    type        = string
}

variable "kube_dep_label_name" {
    description = "Label name to be used for the kube metadata"
    type        = string
    default     = "azure-devops-agents"
}

variable "agent_replicas" {
    description = "The number of agent replicas required"
    type = number
    default = 1
}