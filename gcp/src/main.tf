provider "google" {
  project = var.poc_gke_project
}

module "tfstate_bucket" {
  source              = "../modules/tfstate_buckets"
  tfstate_bucket_name = var.tfstate_bucket_name
  poc_gke_project     = var.poc_gke_project
  env                 = var.env
}
