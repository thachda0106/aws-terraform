provider "aws" {
  region = "us-east-1"
}

# --------------------------
# 🧮 Example 1: Using `count`
# --------------------------

# A variable containing a list of security group names
variable "sg_names" {
  description = "Names of security groups"
  default     = ["web", "app", "db"]
}

resource "aws_security_group" "count_example" {
  # The `count` meta-argument is used to create multiple resources based on the list length
  count = length(var.sg_names)

  # Each resource gets a unique name based on the index
  name        = "sg-${var.sg_names[count.index]}"
  description = "Security group for ${var.sg_names[count.index]}"
  vpc_id      = "vpc-xxxxxxxx"  # Replace with your actual VPC ID

  tags = {
    Name = "sg-${var.sg_names[count.index]}"
  }
}

# --------------------------------
# 🔁 Example 2: Using `for_each`
# --------------------------------

# A variable containing a map of bucket names and their ACL settings
variable "buckets" {
  description = "Map of S3 buckets with their ACLs"
  default = {
    logs    = "private"
    assets  = "public-read"
    backups = "private"
  }
}

resource "aws_s3_bucket" "foreach_example" {
  # The `for_each` meta-argument creates one resource per key-value pair in the map
  for_each = var.buckets

  # `each.key` refers to the bucket name, `each.value` to its ACL setting
  bucket = "my-${each.key}-bucket"
  acl    = each.value

  tags = {
    Name = each.key
  }
}
