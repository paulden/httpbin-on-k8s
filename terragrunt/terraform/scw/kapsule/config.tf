provider "scaleway" {
  zone    = var.zone
  region  = var.region
  profile = var.profile
}

terraform {
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "2.2.1"
    }
  }
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
  required_version = "= 1.0.7"
}
