provider "azurerm" {
  version = "=1.39.0"
}

module "kubernetes_cluster" {
  source        = "./modules/azure/kubernetes_cluster"
  name_prefix = "aks-lab"
}
