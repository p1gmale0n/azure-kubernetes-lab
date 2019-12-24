variable "name_prefix" {
  description = "The prefix for the resources created in the specified Azure Resource Group."
}

variable "location" {
  default     = "eastus"
  description = "The location for the AKS deployment."
}

variable "admin_username" {
  default     = "azureuser"
  description = "The username of the local administrator to be created on the Kubernetes cluster."
}

variable "agents_size" {
  default     = "Standard_F2"
  description = "The default virtual machine size for the Kubernetes agents."
}

variable "log_analytics_workspace_sku" {
  description = "The SKU (pricing level) of the Log Analytics workspace. For new subscriptions the SKU should be set to PerGB2018."
  default     = "PerGB2018"
}

variable "log_retention_in_days" {
  description = "The retention period for the logs in days."
  default     = 30
}

variable "agents_count" {
  description = "The number of Agents that should exist in the Agent Pool."
  default     = 2
}

variable "kubernetes_version" {
  description = "Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade)."
  default = ""
}

variable "public_ssh_key" {
  description = "A custom ssh key to control access to the AKS cluster.  If no public ssh key is set through variables, a newly generated public key will be used and the private key will be saved in a private_ssh_key file."
  default     = ""
}