output "id" {
  description = "The resource group ID."
  value       = azurerm_resource_group.this.id
}

output "name" {
  description = "The resource group Name."
  value       = var.name
}
