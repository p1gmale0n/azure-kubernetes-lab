provider "azurerm" {
  version = "=1.39.0"
}

module "resource_group" {
  source   = "./modules/azure/resource_group"
  name     = "azure-k8s-lab-rg"
  location = "westeurope"
  tags = {
    env = "azure-k8s-lab"
  }
}

module "kubernetes_sp" {
  source = "./modules/azure/ad_service_principal"
  name = "kubernetes_sp"
}


module "kubernetes_cluster" {
  source        = "./modules/azure/kubernetes_cluster"
  client_id     = module.kubernetes_sp.id
  client_secret = module.kubernetes_sp.password

  create_resource_group = false
  resource_group_name   = module.resource_group.name
}
