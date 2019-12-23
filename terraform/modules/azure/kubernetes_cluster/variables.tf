variable "client_id" {}
variable "client_secret" {}

variable "agent_count" {
  default = 3
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
  default = "aks"
}

variable cluster_name {
  default = "aks"
}

variable resource_group_name {
  default = "azure-aks-resource-group"
}

variable "create_resource_group" {
  type    = bool
  default = true
}


variable location {
  default = "germanywestcentral"
}

variable log_analytics_workspace_name {
  default = "aksLogAnalyticsWorkspaceName"
}

variable "module_depends" {
  type    = list
  default = null
  description = "Indicates the resource this resource depends on."
}