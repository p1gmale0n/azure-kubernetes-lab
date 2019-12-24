output "client_key" {
  value = module.aks.client_key
  description = "Base64 encoded private key used by clients to authenticate to the Kubernetes cluster."
}

output "client_certificate" {
  value = module.aks.client_certificate
  description = "Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster."
}

output "cluster_ca_certificate" {
  value = module.aks.cluster_ca_certificate
  description = "Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster."
}

output "host" {
  value = module.aks.host
  description = "The Kubernetes cluster server host."
}

output "username" {
  value = module.aks.username
  description = "A username used to authenticate to the Kubernetes cluster."
}

output "password" {
  value = module.aks.password
  description = "A password or token used to authenticate to the Kubernetes cluster."
}

output "node_resource_group" {
  value = module.aks.node_resource_group
  description = "The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster."
}

output "location" {
  value = module.aks.location
  description = "The location where the Managed Kubernetes Cluster was created."
}
