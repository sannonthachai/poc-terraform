locals {
  list_ops_buckets = [for name in var.ops_bucket_name : "${var.env}_${name}_${var.project}"]
}

module "global_settings" {
  source = "../global_constants"
}

resource "google_storage_bucket" "ops_bucket" {
  project       = var.project
  for_each      = toset(local.list_ops_buckets)
  name          = each.value
  location      = var.region
  storage_class = var.bucket_class
  labels = {
    "project" = var.project
    "team"    = module.global_settings.team.ops
    "env"     = var.env
  }
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
}
