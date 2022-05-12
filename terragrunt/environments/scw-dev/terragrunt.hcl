remote_state {
  backend      = "s3"
  disable_init = tobool(get_env("DISABLE_INIT", "false"))
  config = {
    bucket                      = "pade-terraform-state-bucket"
    endpoint                    = "https://s3.fr-par.scw.cloud"
    key                         = "scw-dev/${path_relative_to_include()}/terraform.tfstate"
    profile                     = "pade"
    region                      = "fr-par"
    skip_credentials_validation = true
    skip_region_validation      = true
  }
}

inputs = {
  name    = "pade"
  zone    = "fr-par-1"
  region  = "fr-par"
  profile = "pade"
}
