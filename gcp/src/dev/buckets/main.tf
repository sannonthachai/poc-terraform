terraform {
  cloud {
    organization = "sannon-poc-terraform"

    workspaces {
      project = "GCP-Development"
      name    = "DEV-Buckets"
    }
  }
}

locals {
  list_ops_buckets = [for name in var.ops_bucket_name : "${name}_${module.variables.dev.project}"]
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

module "ops_bucket" {
  source       = "../../../modules/buckets"
  for_each     = toset(local.list_ops_buckets)
  bucket_name  = each.value
  project      = module.variables.dev.project
  env          = module.variables.dev.env
  team         = module.global_variables.team.ops
  region       = module.variables.dev.region
  bucket_class = var.bucket_class
}
