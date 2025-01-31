variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_cidr_blocks" {
  description = "List of CIDR blocks for public subnets"
  type        = string
}

variable "default_tags" {
  description = "Default tags for all resources"
  type        = map(string)
  default     = {}
}

variable "env" {
  description = "dev"
  type        = string
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}

