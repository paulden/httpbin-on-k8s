provider "aws" {
  region  = var.region
  profile = var.profile
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
  required_version = "= 1.0.7"
}
