variable "env" { type = string }
variable "project" { type = string }
variable "ops_bucket_name" {
  type        = list(string)
  description = "Bucket name for ops team"
  default = [
    "some-bucket-name-001",
    "some-bucket-name-002",
    "some-bucket-name-003",
  ]
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
