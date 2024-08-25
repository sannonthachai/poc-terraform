variable "GOOGLE_CREDENTIALS" { type = string }
variable "tfstate_bucket_name" {
  type        = string
  description = "Terraform bucket name"
  default     = "tfstate-bucket"
}
variable "region" {
  type        = string
  description = "GCP default region"
  default     = "asia-southeast1"
}
variable "bucket_class" {
  type        = string
  description = "GCP default bucket class"
  default     = "STANDARD"
}
variable "ops_bucket_name" {
  type        = list(string)
  description = "Bucket name for ops team"
  default = [
    "ops-bucket-001",
    "ops-bucket-002",
  ]
}
