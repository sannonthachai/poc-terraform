variable "GOOGLE_CREDENTIALS" { type = string }
variable "tfstate_bucket_name" {
  type        = string
  description = "Terraform bucket name"
  default     = "tfstate-bucket"
}
