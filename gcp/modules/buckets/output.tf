output "ops_bucket_self_link" {
  description = "A reference (self link) to a bucket"
  value       = google_storage_bucket.buckets.self_link
}
