output "ops_bucket_self_link" {
  description = "A reference (self link) to an ops bucket"
  value       = { for k, v in google_storage_bucket.ops_bucket : k => v.self_link }
}
