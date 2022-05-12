resource "scaleway_instance_placement_group" "availability_group" {
  name = "availability_enforced-kapsule-${var.name}"
}

resource "scaleway_lb_ip" "reserved_lb_ip" {
  lifecycle {
    prevent_destroy = true
  }
}

resource "scaleway_k8s_cluster" "kapsule" {
  name          = "kapsule-${var.name}"
  version       = var.kubernetes_version
  cni           = "cilium"
  feature_gates = ["KubeletCredentialProviders"] # Allow pulling from Scaleway private registries

  auto_upgrade {
    enable                        = true
    maintenance_window_start_hour = var.kapsule_auto_upgrade_start_hour
    maintenance_window_day        = var.kapsule_auto_upgrade_start_day
  }

  tags = ["kapsule-${var.name}"]
}

resource "scaleway_k8s_pool" "app_node_pool" {
  cluster_id          = scaleway_k8s_cluster.kapsule.id
  name                = "node-pool-app"
  node_type           = var.app_instance_type
  size                = var.app_node_pool_size
  min_size            = var.app_node_pool_size
  max_size            = var.app_node_pool_size + 3
  wait_for_pool_ready = true
  autohealing         = true
  autoscaling         = true
  placement_group_id  = scaleway_instance_placement_group.availability_group.id

  tags = ["noprefix=node.kubernetes.io/role=app"]
}
