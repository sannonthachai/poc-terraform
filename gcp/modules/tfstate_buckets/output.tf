output "tfstate_bucket_self_link" {
  description = "A reference (self link) to a tfstate bucket"
  value       = google_storage_bucket.tfstate.self_link
}
