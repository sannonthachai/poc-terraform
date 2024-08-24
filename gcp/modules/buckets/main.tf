resource "google_storage_bucket" "buckets" {
  project       = var.project
  name          = var.bucket_name
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
