demo-bucket-name = "very-random-name-terraform-automation-bucket"
environment      = "demo"
bucket_config = {
  "acl"              = "private"
  "object_ownership" = "BucketOwnerPreferred"
  "versioning"       = "Enabled"
}