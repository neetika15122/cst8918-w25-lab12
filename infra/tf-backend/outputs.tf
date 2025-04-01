output "resource_group_name" {
  value = azurerm_resource_group.tf_backend_rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.tf_backend_sa.name
}

output "container_name" {
  value = azurerm_storage_container.tf_backend_container.name
}

output "arm_access_key" {
  value     = azurerm_storage_account.tf_backend_sa.primary_access_key
  sensitive = true
}
