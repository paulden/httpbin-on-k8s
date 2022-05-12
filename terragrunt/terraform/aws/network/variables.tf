variable "region" {
  type        = string
  default     = "eu-west-2"
  description = "AWS region where instance should be deployed"
}

variable "profile" {
  type        = string
  default     = "default"
  description = "AWS profile to use to deploy instance"
}

variable "name" {
  type        = string
  default     = "terraform"
  description = "Tag to apply to created resources"
}

variable "network" {
  type        = string
  default     = "10.0.0.0/8"
  description = "VPC network"
}

variable "cidr_blocks" {
  type        = list(string)
  default     = []
  description = "List of CIDR blocks to use for each subnet"
}
