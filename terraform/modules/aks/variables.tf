variable "aks_name" {
  description = "(Required) Specifies the name of the AKS cluster."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) Specifies the name of the resource group."
  type        = string
}

variable "location" {
  description = "(Required) Specifies the location where the AKS cluster will be deployed."
  type        = string
}

variable "subnet_id" {
  description = "Specifies subnet id"
  type        = string
}




