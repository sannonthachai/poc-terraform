locals {
  tfstate_bucket_name = "${var.tfstate_bucket_name}_${var.project}"
}

resource "google_storage_bucket" "tfstate" {
  project       = var.project
  name          = local.tfstate_bucket_name
  location      = var.region
  storage_class = var.bucket_class
  labels = {
    "project" = var.project
    "team"    = var.team
    "env"     = var.env
  }
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
}
