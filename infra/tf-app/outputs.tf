output "resource_group_name" {
  description = "The name of the Azure resource group for app infrastructure"
  value       = azurerm_resource_group.app_rg.name
}