provider "aws" {
  region = "us-east-1"
}

# -----------------------------------
# 🧾 Variable: Map of bucket => ACL
# -----------------------------------
variable "buckets" {
  description = "Map of bucket names and ACLs"
  default = {
    logs    = "private"
    assets  = "public-read"
    backups = "private"
  }
}

# -----------------------------------
# 🔁 Create S3 buckets using for_each
# -----------------------------------
resource "aws_s3_bucket" "example" {
  for_each = var.buckets

  bucket = "my-${each.key}-bucket"
  acl    = each.value

  tags = {
    Name = each.key
  }
}

# -----------------------------------
# 🧠 Locals with for expressions
# -----------------------------------
locals {
  # List of all bucket names
  bucket_names = [for b in aws_s3_bucket.example : b.bucket]

  # Map of bucket name key => ARN
  bucket_arn_map = {
    for key, b in aws_s3_bucket.example :
    key => b.arn
  }
}
