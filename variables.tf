variable "demo-bucket-name" {
  type        = string
  description = "Bucket name"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "bucket_config" {
  type        = map(string)
  description = "Bucket configuration"
}