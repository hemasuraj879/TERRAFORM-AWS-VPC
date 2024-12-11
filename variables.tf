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

# public subnet
variable "public_cidr" {
  
}

variable "availability_zone" {
  default = []
}

variable "map_public_ip_on_launch" {
  default = false
}

# private subnet
variable "private_cidr" {
  
}

variable "peering_reqq" {
  default = false
}



