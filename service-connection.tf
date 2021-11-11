
data "azuread_client_config" "current" {}
data "azurerm_subscription" "current" {}

resource "azuredevops_project" "project" {
  name               = var.azure_devops_project_name
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
}

resource "azuread_application" "example" {
  display_name = "example"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "example" {
  application_id               = azuread_application.example.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}

output "azuread_service_principal" {
    value = azuread_service_principal.example.object_id
}

output "azurerm_subscription_current_subscription_id" {
    value = data.azurerm_subscription.current.subscription_id
}

output "azurerm_subscription_current_display_name" {
    value = data.azurerm_subscription.current.display_name
}

resource "azuredevops_serviceendpoint_azurerm" "endpointazure" {
  project_id                = azuredevops_project.project.my_project.id
  service_endpoint_name     = "Sample AzureRM"
  description               = "Managed by Terraform" 
  azurerm_spn_tenantid      = azuread_service_principal.example.application_tenant_id
  azurerm_subscription_id   = data.azurerm_subscription.current.subscription_id
  azurerm_subscription_name = data.azurerm_subscription.current.display_name
}