terraform {
  source = "../../../terraform/scw/kapsule"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  kubernetes_version = "1.23"
  app_node_pool_size = 2
  app_instance_type  = "DEV1-M" # 3 vCPU / 4 GB RAM / 40 GB SSD
}
