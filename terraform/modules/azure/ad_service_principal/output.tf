output "id" {
  value = azuread_service_principal.this.object_id
}

output "password" {
  value = random_uuid.this.result
}

