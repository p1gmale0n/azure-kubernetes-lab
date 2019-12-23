data "azurerm_resource_group" "exist" {
  count = var.create_resource_group ? 0 : 1
  name  = var.resource_group_name

  depends_on = [var.resource_group_name]
}

locals {
  location = var.create_resource_group ? var.location : data.azurerm_resource_group.exist[0].location
}

resource "azurerm_resource_group" "this" {
  count    = var.create_resource_group ? 1 : 0
  name     = var.resource_group_name
  location = var.location
}

resource "random_id" "log_analytics_workspace_name_suffix" {
  byte_length = 8
}

resource "azurerm_log_analytics_workspace" "this" {
  # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
  name                = "${var.log_analytics_workspace_name}-${random_id.log_analytics_workspace_name_suffix.dec}"
  location            = local.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
}

resource "azurerm_log_analytics_solution" "this" {
  solution_name         = "ContainerInsights"
  location              = local.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.this.id
  workspace_name        = azurerm_log_analytics_workspace.this.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

resource "azurerm_kubernetes_cluster" "this" {
  name                = var.cluster_name
  location            = local.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  default_node_pool {
    name       = "agentpool"
    node_count = var.agent_count
    vm_size    = "Standard_DS1_v2"
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  addon_profile {
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id
    }
  }

  tags = {
    Environment = "Development"
  }
}
