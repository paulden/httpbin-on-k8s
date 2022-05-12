## Metadata

variable "region" {
  type        = string
  description = "Scaleway region"
}

variable "zone" {
  type        = string
  description = "Scaleway zone"
}

variable "profile" {
  type        = string
  description = "Scaleway profile"
}

variable "name" {
  type        = string
  description = "Name of the environment"
}

## Kubernetes and Kapsule general specs

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
}

variable "kapsule_auto_upgrade_start_hour" {
  type        = number
  default     = 3
  description = "Hour when when Kapsule may auto-upgrade Kubernetes (minor version only)"
}

variable "kapsule_auto_upgrade_start_day" {
  type        = string
  default     = "tuesday"
  description = "Day when Kapsule may auto-upgrade Kubernetes (minor version only)"
}

## Node pool specifics

variable "app_node_pool_size" {
  type        = number
  description = "Number of nodes in app node pool"
}

variable "app_instance_type" {
  type        = string
  description = "Type of instance to be used in app node pool"
}
