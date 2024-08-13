variable "env" { type = string }
variable "poc_gke_project" { type = string }
variable "tfstate_bucket_name" { type = string }
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
