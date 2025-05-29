variable "project_name" {
  description = "Project name for tagging"
  type        = string
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "sdn_dcgw_subnet_cidr" {
  description = "CIDR block for the SDN-DCGW interconnect subnet"
  type        = string
}

variable "az" {
  description = "Availability Zone for subnets"
  type        = string
}


