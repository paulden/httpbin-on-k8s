remote_state {
  backend      = "s3"
  disable_init = tobool(get_env("DISABLE_INIT", "false"))
  config = {
    bucket         = "pade-terraform-state-bucket"
    key            = "aws-dev/${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-3"
    encrypt        = true
    dynamodb_table = "pade-terraform-state-lock-dynamo"
    profile        = "perso"
  }
}

inputs = {
  name        = "pade"
  region      = "eu-west-3"
  profile     = "perso"
  network     = "172.31.0.0/16"
  cidr_blocks = ["172.31.0.0/24", "172.31.1.0/24", "172.31.2.0/24"]
}
