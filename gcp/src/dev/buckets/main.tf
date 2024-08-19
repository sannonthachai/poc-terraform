terraform {
  cloud {
    organization = "sannon-poc-terraform"

    workspaces {
      project = "GCP-Development"
      name    = "Buckets"
    }
  }
}

provider "google" {
  project = module.variables.dev.project
}

module "global_variables" {
  source = "../../../global_variables"
}

module "variables" {
  source = "../variables"
}

module "tfstate_bucket" {
  source              = "../../../modules/tfstate_buckets"
  tfstate_bucket_name = var.tfstate_bucket_name
  project             = module.variables.dev.project
  env                 = module.variables.dev.env
  team                = module.global_variables.team.ops
}

# module "bucket" {
#   source  = "../modules/buckets"
#   project = var.project
#   env     = var.env
# }
