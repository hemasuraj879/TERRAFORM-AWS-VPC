# VPC LEVEL VARIABLES
variable "vpc_cidr" {
  
}

variable "enable_dns_support" {
  default = true
}

variable "enable_dns_hostnames" {
  default = true
}

variable "common_tags" {
  default = {}
}

variable "project_name" {
  default = ""
}

variable "env" {
  default = ""
}