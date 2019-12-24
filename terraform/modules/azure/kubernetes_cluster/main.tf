resource "azuread_application" "this" {
  name                       = var.name_prefix
  available_to_other_tenants = false
}

resource "azuread_service_principal" "this" {
  application_id = azuread_application.this.application_id
}

resource "random_password" "this" {
  length  = 32
  special = false
}

resource "azuread_service_principal_password" "this" {
  service_principal_id = azuread_service_principal.this.id
  value                = random_password.this.result
  end_date             = "2299-12-31T00:00:00Z"
}

resource "null_resource" "azuread_service_principal_password" {
  triggers = {
    password = random_password.this.result
  }
  depends_on = [ azuread_service_principal_password.this ]
}

module "aks" {
  source  = "Azure/aks/azurerm"
  version = "2.0.0"

  prefix   = var.name_prefix
  location = var.location

  kubernetes_version = var.kubernetes_version != "" ? var.kubernetes_version : null
  CLIENT_ID          = azuread_service_principal.this.application_id
  CLIENT_SECRET      = null_resource.azuread_service_principal_password.triggers.password

  agents_count = var.agents_count
  agents_size  = var.agents_size

  log_analytics_workspace_sku = var.log_analytics_workspace_sku
  log_retention_in_days       = var.log_retention_in_days
  admin_username              = var.admin_username
  public_ssh_key              = var.public_ssh_key
}
