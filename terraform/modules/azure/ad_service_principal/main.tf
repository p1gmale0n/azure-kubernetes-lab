resource "azuread_application" "this" {
  name = var.name
}

resource "azuread_service_principal" "this" {
  application_id               = azuread_application.this.application_id
  app_role_assignment_required = false
}

resource "random_uuid" "this" {
  keepers = {
    spid = azuread_service_principal.this.id
  }
}

resource "azuread_service_principal_password" "this" {
  service_principal_id = azuread_service_principal.this.id
  value                = random_uuid.this.result
}
