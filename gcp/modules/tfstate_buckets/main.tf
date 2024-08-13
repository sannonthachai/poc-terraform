locals {
  tfstate_bucket_name = "${var.env}_${var.tfstate_bucket_name}_${var.poc_gke_project}"
}

module "global_settings" {
  source = "../global_constants"
}

resource "google_storage_bucket" "tfstate" {
  project       = var.poc_gke_project
  name          = local.tfstate_bucket_name
  location      = var.region
  storage_class = var.bucket_class
  labels = {
    "project" = var.poc_gke_project
    "team"    = module.global_settings.team.ops
    "env"     = var.env
  }
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
}
