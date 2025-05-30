variable "project_name" {
  description = "Project name for tagging"
  type        = string
}

variable "region" {
  description = "Region for IPAM"
  type        = string
}

variable "ipam_name" {
  description = "Name for IPAM resources"
  type        = string
}

variable "ipam_description" {
  description = "Description for IPAM"
  type        = string
  default     = "Terraform-managed IPAM"
}

variable "ipam_cidr" {
  description = "Root CIDR block to delegate"
  type        = string
}
