variable "vpc_cidr" {
    default = "10.0.0.0/16"
    type = string
}

variable "enable_dns_hostnames" {
    default = "true"
    type = bool
}

variable "common_tags" {
    type = map 
    default = {} # it is default
}

variable "vpc_tags" {
    type = map 
    default = {}
}

variable "project_name" {
    type = string
}

variable "environment" {
    default = {}
}

variable "igw_tags" {
    type = map
    default = {}
}



variable "public_subnets_cidr" {
  type = list
  validation {
    condition = length(var.public_subnets_cidr) == 2
    error_message = "Please give 2 public valid subnet CIDR"
  }
}

variable "public_subnets_tags" {
  default = {}
}

variable "private_subnets_cidr" {
  type = list
  validation {
    condition = length(var.private_subnets_cidr) == 2
    error_message = "Please give 2 private valid subnet CIDR"
  }
}

variable "private_subnets_tags" {
  default = {}
}

variable "database_subnets_cidr" {
  type = list
  validation {
    condition = length(var.database_subnets_cidr) == 2
    error_message = "Please give 2 database valid subnet CIDR"
  }
}

variable "database_subnets_tags" {
  default = {}
}

variable "nat_gateway_tags" {
  default = {}
}

variable "public_route_table_tags" {
  default = {}
}

variable "private_route_table_tags" {
  default = {}
}

variable "database_route_table_tags" {
  default = {}
}

variable "is_peering_required" {
  type = bool
  default = false
}

variable "acceptor_vpc_id" {
  type = string
  default = ""
}
 variable "vpc_peering_tags" {
  default = {}
 }