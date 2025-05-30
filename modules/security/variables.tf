variable "vpc_id" {
  description = "VPC ID to attach the SG"
  type        = string
}

variable "project_name" {
  description = "For tagging"
  type        = string
}

variable "allowed_ssh_cidrs" {
  description = "CIDR blocks allowed to SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
