
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "public_cidr_blocks" {
  description = "List of CIDR blocks for public subnets"
  type        = string
  default     = "10.1.2.0/24"
}


variable "default_tags" {
  description = "Default tags for all resources"
  type        = map(string)
  default     = {}
}

variable "env" {
  description = "dev"
  type        = string
  default     = "dev"
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = ""
}
