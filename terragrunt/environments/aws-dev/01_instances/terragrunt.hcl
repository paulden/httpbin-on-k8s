dependencies {
  paths = ["../00_network"]
}

terraform {
  source = "../../../terraform/aws/eks"
}

include {
  path = find_in_parent_folders()
}
