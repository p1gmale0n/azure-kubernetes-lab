variable "name" {
  type        = string
  description = "The name of the resource group. Must be unique on your Azure subscription."
  default     = "Default_Resource_Group"
}

variable "location" {
  type        = string
  description = "The location where the resource group should be created."
  default     = "germanywestcentral"
}

variable "tags" {
  type        = map
  description = "A mapping of tags to assign to the resource."
  default     = {
      Managed_by = "Terraform"
  }
}
