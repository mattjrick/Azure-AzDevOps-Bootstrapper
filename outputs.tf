output "service_principal_id" {
    value = azuredevops_serviceendpoint_azurerm.endpointazure.id
}

output "service_principal_project_id" {
    value = azuredevops_serviceendpoint_azurerm.endpointazure.project_id  
}

output "service_principal_service_endpoint_name" {
    value = azuredevops_serviceendpoint_azurerm.endpointazure.service_endpoint_name  
}